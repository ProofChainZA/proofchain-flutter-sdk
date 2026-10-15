import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawnSync } from 'node:child_process';
import ts from '../../javascript/node_modules/typescript/lib/typescript.js';

const packageRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const sourceRoot = path.resolve(packageRoot, '../javascript/src');
const files = fs.readdirSync(sourceRoot).filter(name => name.endsWith('.ts')).sort()
  .map(name => path.join(sourceRoot, name));
const program = ts.createProgram(files, {
  strict: true, target: ts.ScriptTarget.ES2022, module: ts.ModuleKind.CommonJS,
});
const checker = program.getTypeChecker();
const excluded = new Set([
  'http.HttpClientOptions', 'types.ProofChainOptions', 'errors.ValidationErrorDetail',
  'notifications.SubscribeOptions', 'notifications.NotificationCallback', 'notifications.Unsubscribe',
]);
const renamed = new Map(Object.entries({
  'users.CreateWalletRequest': 'CreateUserWalletRequest',
  'schemas.ValidationError': 'SchemaValidationError',
  'rewards.VerifyResult': 'RewardVerifyResult',
  'attestations.Attestation': 'AttestationRecord',
  'attestations.UpdateConfigRequest': 'UpdateAttestationConfigRequest',
  'rewards.UserReward': 'RewardUserReward',
  'fanpass_leaderboard.LeaderboardUserProfile': 'FanpassLeaderboardUserProfile',
}));
const declarations = [];
const symbolNames = new Map();
const symbolNodes = new Map();
const names = new Set();
function identity(node) {
  return `${path.basename(node.getSourceFile().fileName, '.ts')}.${node.name.text}`;
}
for (const source of program.getSourceFiles().filter(file => files.includes(file.fileName))) {
  for (const node of source.statements) {
    if (!ts.isInterfaceDeclaration(node) && !ts.isTypeAliasDeclaration(node)) continue;
    const id = identity(node);
    if (excluded.has(id)) continue;
    const name = renamed.get(id) ?? node.name.text;
    const symbol = checker.getSymbolAtLocation(node.name);
    if (symbolNames.has(symbol)) continue; // TypeScript declaration merging.
    if (names.has(name)) throw new Error(`Duplicate Dart model: ${id} -> ${name}`);
    names.add(name);
    symbolNames.set(symbol, name);
    symbolNodes.set(symbol, node);
    declarations.push({name, node});
  }
}
function lookup(node) {
  let symbol = checker.getSymbolAtLocation(node);
  if (symbol && symbol.flags & ts.SymbolFlags.Alias) symbol = checker.getAliasedSymbol(symbol);
  return {name: symbolNames.get(symbol), node: symbolNodes.get(symbol)};
}
const reserved = new Set(['assert','break','case','catch','class','const','continue','default',
  'do','else','enum','extends','false','final','finally','for','if','in','is','new','null',
  'rethrow','return','super','switch','this','throw','true','try','var','void','while','with']);
function fieldName(key) { return reserved.has(key) ? `${key}Value` : key; }
function cap(value) { return value.replace(/[^a-zA-Z0-9]+(.)?/g, (_,ch) => ch?.toUpperCase() ?? '').replace(/^./, ch => ch.toUpperCase()); }
const nested = [];
function scalar(dart, nullable = false) { return {kind:'scalar', dart, nullable}; }
function describe(node, hint) {
  if (!node) throw new Error(`Missing type: ${hint}`);
  if (ts.isParenthesizedTypeNode(node)) return describe(node.type, hint);
  if (ts.isUnionTypeNode(node)) {
    const nullable = node.types.some(t => t.kind === ts.SyntaxKind.UndefinedKeyword ||
      (ts.isLiteralTypeNode(t) && t.literal.kind === ts.SyntaxKind.NullKeyword));
    const members = node.types.filter(t => t.kind !== ts.SyntaxKind.UndefinedKeyword &&
      !(ts.isLiteralTypeNode(t) && t.literal.kind === ts.SyntaxKind.NullKeyword));
    if (members.every(t => ts.isTypeReferenceNode(t) && ['File','Blob','Buffer','ArrayBuffer'].includes(t.typeName.getText()))) {
      return {kind:'upload', dart:'UploadFile', nullable};
    }
    const types = members.map(t => describe(t, hint));
    if (types.length && types.every(t => t.dart === types[0].dart)) return {...types[0], nullable:nullable || types[0].nullable};
    return scalar('Object', true);
  }
  if (ts.isLiteralTypeNode(node)) {
    if (ts.isStringLiteral(node.literal)) return scalar('String');
    if (node.literal.kind === ts.SyntaxKind.TrueKeyword || node.literal.kind === ts.SyntaxKind.FalseKeyword) return scalar('bool');
    if (ts.isNumericLiteral(node.literal)) return scalar('num');
    return scalar('Object', true);
  }
  if (ts.isArrayTypeNode(node)) {
    const item = describe(node.elementType, `${hint}Item`);
    return {kind:'list', dart:`List<${dartType(item)}>`, item, nullable:false};
  }
  if (ts.isTypeOperatorNode(node)) return describe(node.type, hint);
  if (ts.isTupleTypeNode(node)) return {kind:'list',dart:'List<Object?>',item:scalar('Object',true),nullable:false};
  if (ts.isTypeLiteralNode(node)) {
    const properties = node.members.filter(ts.isPropertySignature);
    if (!properties.length && node.members.some(ts.isIndexSignatureDeclaration)) {
      const index = node.members.find(ts.isIndexSignatureDeclaration);
      const item = describe(index.type, `${hint}Value`);
      return {kind:'map',dart:`Map<String, ${dartType(item)}>`,item,nullable:false};
    }
    let name = hint;
    for (let n=2; names.has(name); n++) name = `${hint}${n}`;
    names.add(name);
    nested.push({name, node, properties});
    return {kind:'model',dart:name,nullable:false};
  }
  if (ts.isTypeReferenceNode(node)) {
    const typeName = node.typeName.getText();
    const args = node.typeArguments ?? [];
    if (typeName === 'Array' || typeName === 'ReadonlyArray') {
      const item = describe(args[0], `${hint}Item`);
      return {kind:'list',dart:`List<${dartType(item)}>`,item,nullable:false};
    }
    if (typeName === 'Record') {
      const item = describe(args[1], `${hint}Value`);
      return {kind:'map',dart:`Map<String, ${dartType(item)}>`,item,nullable:false};
    }
    if (['Partial','Pick','Omit'].includes(typeName)) return {kind:'map',dart:'JsonMap',item:scalar('Object',true),nullable:false};
    if (['File','Blob','Buffer','ArrayBuffer'].includes(typeName)) return {kind:'upload',dart:'UploadFile',nullable:false};
    const found = lookup(node.typeName);
    if (!found.name) throw new Error(`Unmapped type ${typeName} at ${hint}`);
    return {kind:ts.isInterfaceDeclaration(found.node)?'model':'alias',dart:found.name,node:found.node,nullable:false};
  }
  switch (node.kind) {
    case ts.SyntaxKind.StringKeyword: return scalar('String');
    case ts.SyntaxKind.NumberKeyword: return scalar('num');
    case ts.SyntaxKind.BooleanKeyword: return scalar('bool');
    case ts.SyntaxKind.AnyKeyword:
    case ts.SyntaxKind.UnknownKeyword:
    case ts.SyntaxKind.ObjectKeyword: return scalar('Object',true);
    default: throw new Error(`Unsupported ${ts.SyntaxKind[node.kind]}: ${node.getText()} at ${hint}`);
  }
}
function dartType(type, optional=false) { return type.dart + ((type.nullable || optional) && !type.dart.endsWith('?') ? '?' : ''); }
function readValue(type, expression, optional=false) {
  if ((type.nullable || optional) && type.dart !== 'Object') return `${expression} == null ? null : ${readValue({...type,nullable:false},expression)}`;
  switch (type.kind) {
    case 'model': return `${type.dart}.fromJson(asJsonMap(${expression}))`;
    case 'upload': return `${expression} is UploadFile ? ${expression} as UploadFile : UploadFile((${expression} as List<Object?>).cast<int>())`;
    case 'list': return `(${expression} as List<Object?>).map((item) => ${readValue(type.item,'item')}).toList(growable: false)`;
    case 'map': return type.item.dart === 'Object' ? `asJsonMap(${expression})` : `asJsonMap(${expression}).map((key, value) => MapEntry(key, ${readValue(type.item,'value')}))`;
    default: return type.dart === 'Object' ? expression : `${expression} as ${dartType(type,optional)}`;
  }
}
function properties(node,name) {
  const symbol = node.name ? checker.getSymbolAtLocation(node.name) : null;
  const members = symbol
    ? symbol.declarations.filter(ts.isInterfaceDeclaration).flatMap(item => item.members)
    : node.members;
  const unique = new Map();
  for (const p of members.filter(ts.isPropertySignature)) unique.set(p.name.text, p);
  return [...unique.values()].map(p => {
    const key = p.name.text;
    return {key,field:fieldName(key),optional:!!p.questionToken,type:describe(p.type,`${name}${cap(key)}`)};
  });
}
function allProperties(node) {
  return checker.getPropertiesOfType(checker.getTypeAtLocation(node)).map(p => p.valueDeclaration ?? p.declarations?.[0]).filter(Boolean);
}
// Keep upstream prose, but render symbol references as code: JavaScript-only
// names and TypeScript member paths are not necessarily Dartdoc link targets.
function documentation(node) {
  const symbol = node?.name ? checker.getSymbolAtLocation(node.name) : null;
  return (symbol ? ts.displayPartsToString(symbol.getDocumentationComment(checker)) : '')
    .replace(/\{@link(?:code|plain)?\s+([^}]+)\}/g, (_, target) => `\`${target.trim()}\``)
    .replace(/\[([^\]\n]+)\](?!\()/g, (_, target) => `\`${target}\``)
    .trim();
}
function dartdoc(text, indent='') {
  for (const line of text.split(/\r?\n/)) output.push(`${indent}///${line ? ` ${line}` : ''}`);
}
const output = [
  '// Generated from the JavaScript SDK interfaces. Do not edit by hand.',
  '// Regenerate with: node tool/generate_models.mjs',
  '// Field names retain JavaScript API and JSON wire casing for SDK parity.',
  '// This generated file alone allows those non-Dart-style identifiers.',
  '// ignore_for_file: non_constant_identifier_names',
  "import 'json.dart';", "import 'upload.dart';", '',
];
const catalog = [];
function emit({name,node}) {
  if (ts.isTypeAliasDeclaration(node)) {
    const type = describe(node.type,name);
    const sourceDocs = documentation(node);
    dartdoc(sourceDocs || `Dart representation of JavaScript SDK \`${identity(node)}\`.`);
    dartdoc(`\nUses \`${dartType(type)}\`; TypeScript-only constraints are not validated.`);
    output.push(`typedef ${name} = ${dartType(type)};`,'');
    catalog.push({name,source:identity(node),alias:dartType(type)});
    return;
  }
  const props = properties(node,name);
  const heritage = node.heritageClauses?.[0]?.types[0];
  const parent = heritage ? lookup(heritage.expression) : null;
  if (heritage && !parent.name) throw new Error(`Unmapped parent ${heritage.getText()}`);
  const inherited = parent ? allProperties(parent.node).map(p => ({key:p.name.text,field:fieldName(p.name.text),optional:!!p.questionToken})) : [];
  const ctorFields = [...inherited.map(p => `${p.optional?'':'required '}super.${p.field}`),...props.map(p => `${p.optional?'':'required '}${dartType(p.type,p.optional)} ${p.field}`)];
  const sourceDocs = documentation(node);
  dartdoc(sourceDocs || (node.name
    ? `JSON model for JavaScript SDK \`${identity(node)}\`.`
    : `JSON model for an inline object in \`${path.basename(node.getSourceFile().fileName)}\`.`));
  dartdoc('\nJSON-backed instances retain their input map for serialization.\nRequired non-nullable getters cast stored values and can throw if a decoded\nfield was missing or null; construction does not validate business rules.');
  if (parent) dartdoc(`\nIncludes the fields and JSON serialization of [${parent.name}].`);
  output.push(`class ${name}${parent?` extends ${parent.name}`:' implements JsonModel'} {`);
  if (!parent) output.push('  final JsonMap? _originalJson;');
  for (const p of props) {
    output.push(`  final ${dartType(p.type,true)} _${p.field};`);
    const property = checker.getPropertyOfType(checker.getTypeAtLocation(node), p.key);
    const sourceDocs = documentation(property?.valueDeclaration ?? property?.declarations?.[0]);
    if (sourceDocs) dartdoc(sourceDocs, '  ');
    output.push(`  ${dartType(p.type,p.optional)} get ${p.field} => _${p.field}${p.optional||p.type.nullable?'':` as ${p.type.dart}`};`);
  }
  output.push('');
  const ctorInitializers = [...props.map(p => `_${p.field} = ${p.field}`), ...(parent?[]:['_originalJson = null'])];
  dartdoc('Creates a model from typed fields.\n\nSerialization omits null optional fields and includes required fields.', '  ');
  output.push(`  const ${name}(${ctorFields.length?`{${ctorFields.join(', ')}}`:''})${ctorInitializers.length?` : ${ctorInitializers.join(', ')}`:''};`);
  const initializers = props.map(p => `_${p.field} = ${readValue(p.type,`json[${JSON.stringify(p.key)}]`,true)}`);
  initializers.push(parent?'super.fromJson(json)':'_originalJson = json');
  dartdoc('Decodes typed fields from [json] and retains the same map for [toJson].\n\nUnknown keys and explicit nulls are preserved in that map. Present values\nare decoded immediately and may throw on incompatible types. Missing or\nnull fields can fail later when read through a required non-nullable getter.\nReplacing map entries does not re-decode fields; nested mutable values may\nstill be shared.', '  ');
  output.push(`  ${name}.fromJson(JsonMap json) : ${initializers.join(',\n      ')};`,'');
  dartdoc('Returns the original input map for JSON-backed instances, without copying.\n\nOtherwise encodes typed fields, omitting null optional fields.', '  ');
  output.push('  @override','  JsonMap toJson() => _originalJson ?? {',...(parent?['    ...super.toJson(),']:[]));
  for (const p of props) output.push(`    ${p.optional?`if (_${p.field} != null) `:''}${JSON.stringify(p.key)}: jsonValue(_${p.field}),`);
  output.push('  };','}','');
  catalog.push({name,source:node.name?identity(node):'nested',fields:[...inherited,...props].map(p=>({name:p.field,key:p.key,optional:p.optional,...(p.type?{type:dartType(p.type,p.optional)}:{})}))});
}
for (const declaration of declarations) emit(declaration);
for (let i=0; i<nested.length; i++) emit(nested[i]);
const formatted = spawnSync(process.env.DART ?? 'dart', [
  'format', '--output=show', '--show=none', '--summary=none', '--language-version=3.4',
], { input: output.join('\n'), encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 });
if (formatted.error || formatted.status !== 0) {
  throw new Error(`Dart formatter failed: ${formatted.error ?? formatted.stderr}`);
}
const result = formatted.stdout;
if (process.argv.includes('--check')) {
  if (fs.readFileSync(path.join(packageRoot,'lib/src/models.dart'),'utf8') !== result) {
    console.error('Dart models are stale. Run node tool/generate_models.mjs.');
    process.exitCode = 1;
  }
} else {
  fs.writeFileSync(path.join(packageRoot,'lib/src/models.dart'),result);
}
if (process.argv.includes('--catalog')) console.log(JSON.stringify(catalog,null,2));
else console.log(`${declarations.length} source types, ${nested.length} nested types -> lib/src/models.dart`);
