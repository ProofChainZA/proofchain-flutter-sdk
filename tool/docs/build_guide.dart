import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html;
import 'package:markdown/markdown.dart' as md;

const resources = <String, ({String type, String file, String purpose})>{
  'documents': (
    type: 'DocumentsResource',
    file: 'client.dart',
    purpose: 'Multipart document attestation and hash lookup.',
  ),
  'events': (
    type: 'EventsResource',
    file: 'client.dart',
    purpose: 'Create, list, search and retrieve tenant events.',
  ),
  'channels': (
    type: 'ChannelsResource',
    file: 'client.dart',
    purpose: 'Channel lifecycle, streaming and settlement.',
  ),
  'certificates': (
    type: 'CertificatesResource',
    file: 'client.dart',
    purpose: 'Certificate issuance, lookup, revocation and verification.',
  ),
  'webhooks': (
    type: 'WebhooksResource',
    file: 'client.dart',
    purpose: 'Manage and test server-to-server webhooks.',
  ),
  'vault': (
    type: 'VaultResource',
    file: 'resources.dart',
    purpose: 'Store, list, download, retrieve and remove vault documents.',
  ),
  'search': (
    type: 'SearchResource',
    file: 'resources.dart',
    purpose: 'Tenant search, user event history and event counts.',
  ),
  'verifyResource': (
    type: 'VerifyResource',
    file: 'resources.dart',
    purpose: 'Verification lookups and proof operations.',
  ),
  'tenant': (
    type: 'TenantResource',
    file: 'resources.dart',
    purpose: 'Tenant context, API-key administration, usage and blockchain operations.',
  ),
  'passports': (
    type: 'PassportClient',
    file: 'passports.dart',
    purpose: 'User passports, categories, linked events and grants.',
  ),
  'wallets': (
    type: 'WalletClient',
    file: 'wallets.dart',
    purpose:
        'Wallet REST operations; not a local signing/provider implementation.',
  ),
  'users': (
    type: 'EndUsersClient',
    file: 'users.dart',
    purpose: 'End-user lifecycle, profiles, linked wallets, attributes, GDPR and exports.',
  ),
  'rewards': (
    type: 'RewardsClient',
    file: 'rewards.dart',
    purpose: 'Reward definitions, assignment, redemption and verification.',
  ),
  'quests': (
    type: 'QuestsClient',
    file: 'quests.dart',
    purpose: 'Quest definitions, steps, user progress and completion.',
  ),
  'schemas': (
    type: 'SchemasClient',
    file: 'schemas.dart',
    purpose: 'Schema definitions, validation and inheritance.',
  ),
  'dataViews': (
    type: 'DataViewsClient',
    file: 'dataviews.dart',
    purpose: 'Data-view definitions, previews and execution.',
  ),
  'cohorts': (
    type: 'CohortLeaderboardClient',
    file: 'cohorts.dart',
    purpose: 'Cohort membership and user/cohort leaderboard queries.',
  ),
  'fanpassLeaderboard': (
    type: 'FanpassLeaderboardClient',
    file: 'fanpass_leaderboard.dart',
    purpose: 'FanPass-specific leaderboards and statistics.',
  ),
  'notifications': (
    type: 'NotificationsClient',
    file: 'notifications.dart',
    purpose: 'Native SSE subscriptions and Web Push server registration APIs.',
  ),
  'credentials': (
    type: 'CredentialsClient',
    file: 'credentials.dart',
    purpose: 'Credential types, issuance, user credentials and verification.',
  ),
  'nft': (
    type: 'NftClient',
    file: 'nft.dart',
    purpose: 'Mint NFTs and list or retrieve mint records.',
  ),
  'partnerKeys': (
    type: 'PartnerKeysClient',
    file: 'partner_keys.dart',
    purpose: 'Privileged partner API-key administration.',
  ),
  'attestations': (
    type: 'AttestationsClient',
    file: 'attestations.dart',
    purpose: 'Attestation schemas, records, configuration and revocation.',
  ),
  'airkit': (
    type: 'AirKitClient',
    file: 'airkit.dart',
    purpose: 'Create server-authorized AirKit sessions.',
  ),
};

String escape(String input) => const HtmlEscape().convert(input);
String sourceCode(String input) => '<code>${escape(input)}</code>';
String renderMarkdown(String input) {
  final fragment = html.parseFragment(
    md.markdownToHtml(
      input,
      extensionSet: md.ExtensionSet.gitHubFlavored,
      encodeHtml: true,
    ),
  );
  const allowed = {
    'p',
    'pre',
    'code',
    'em',
    'strong',
    'h1',
    'h2',
    'h3',
    'h4',
    'h5',
    'h6',
    'ul',
    'ol',
    'li',
    'table',
    'thead',
    'tbody',
    'tr',
    'th',
    'td',
    'a',
    'blockquote',
    'hr',
    'br',
    'del',
  };
  void clean(dom.Node node) {
    for (final child in node.nodes.toList()) {
      if (child is dom.Element) {
        if (!allowed.contains(child.localName)) {
          child.remove();
          continue;
        }
        child.attributes.removeWhere((key, value) {
          if (key == 'href' && child.localName == 'a') {
            final uri = Uri.tryParse(value);
            return !value.startsWith('#') &&
                uri?.scheme != 'https' &&
                uri?.scheme != 'http';
          }
          if (key == 'class') {
            return value != 'model-index' &&
                !RegExp(r'^language-[a-z0-9_-]+$').hasMatch(value);
          }
          return true;
        });
        clean(child);
      } else if (child is! dom.Text) {
        child.remove();
      }
    }
  }

  clean(fragment);
  return fragment.outerHtml;
}

String compact(String input) => input.replaceAll(RegExp(r'\s+'), ' ').trim();
String slug(String input) => input
    .toLowerCase()
    .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
    .replaceAll(RegExp(r'^-|-$'), '');

class Source {
  final String file;
  late final parsed = parseFile(
    path: file,
    featureSet: FeatureSet.latestLanguageVersion(),
    throwIfDiagnostics: true,
  );
  Source(this.file);
  ClassDeclaration type(String name) => parsed.unit.declarations
      .whereType<ClassDeclaration>()
      .singleWhere((node) => node.namePart.typeName.lexeme == name);
  int line(AstNode node) => parsed.lineInfo.getLocation(node.offset).lineNumber;
}

String methodSignature(MethodDeclaration method) => compact(
  '${method.returnType?.toSource() ?? 'dynamic'} ${method.name.lexeme}${method.typeParameters?.toSource() ?? ''}${method.parameters?.toSource() ?? ''}',
);
String constructorSignature(
  String type,
  ConstructorDeclaration node,
) => compact(
  '${node.factoryKeyword == null ? '' : 'factory '}$type${node.name == null ? '' : '.${node.name!.lexeme}'}${node.parameters.toSource()}',
);
bool publicMethod(MethodDeclaration node) =>
    !node.name.lexeme.startsWith('_') && !node.isGetter && !node.isSetter;

Future<void> main(List<String> args) async {
  final sdk = File.fromUri(Platform.script).parent.parent.parent;
  final docs = Directory('${sdk.path}/docs');
  final chapters = Directory('${docs.path}/chapters');
  final sources = <String, Source>{};
  Source source(String file) =>
      sources.putIfAbsent(file, () => Source('${sdk.path}/lib/src/$file'));
  final entries = <Map<String, Object?>>[];
  final reference = StringBuffer('''# 16. API reference

This reference is generated from the Dart syntax tree, not handwritten method lists. Names, parameter positions, defaults and return types are the current source declarations. Signatures are reference notation, not standalone Dart programs. All `client.*` resources share the configuration and authentication of their owning `ProofChain` instance. Method availability does not grant authorization: the server must allow the requested operation for the current identity.

`JsonMap` means `Map<String, Object?>`; `UploadFile` carries bytes, a filename and content type; downloads use `Uint8List`. Optional positional parameters appear inside `[...]`; named parameters inside `{...}`. `Future<T>` must be awaited. A `JsonMap` return value has no stronger SDK field guarantee than the current server response.

## 16.1 Construction, lifecycle and top-level operations

''');

  void addMethod(
    String owner,
    String file,
    Source src,
    MethodDeclaration method,
  ) {
    final signature = methodSignature(method);
    final isNativeLifecycle =
        method.name.lexeme == 'close' &&
        (owner == 'client' || owner == 'client.notifications');
    entries.add({
      'owner': owner,
      'name': method.name.lexeme,
      'signature': signature,
      'source': 'lib/src/$file',
      'line': src.line(method),
      'nativeLifecycle': isNativeLifecycle,
    });
    reference.writeln(
      '### `$owner.${method.name.lexeme}`${isNativeLifecycle ? ' — native lifecycle' : ''}\n\n```text\n$signature\n```\n',
    );
  }

  final rootSource = source('client.dart');
  final rootType = rootSource.type('ProofChain');
  for (final node
      in rootType.body.members.whereType<ConstructorDeclaration>()) {
    reference.writeln(
      '```text\n${constructorSignature('ProofChain', node)}\n```\n',
    );
    if (node.name != null) {
      entries.add({
        'owner': 'ProofChain',
        'name': node.name!.lexeme,
        'signature': constructorSignature('ProofChain', node),
        'source': 'lib/src/client.dart',
        'line': rootSource.line(node),
        'nativeLifecycle': false,
      });
    }
  }
  reference.writeln(
    '`ProofChain.fromEnv()` reads `PROOFCHAIN_API_KEY` and optional `PROOFCHAIN_BASE_URL` only. Missing/empty API key throws `StateError`. `tenantApiUrl(String slug)` returns `https://<slug>.proofchain.co.za/api`; it constructs a URL and does not discover, create or authenticate a tenant.\n',
  );
  for (final method
      in rootType.body.members.whereType<MethodDeclaration>().where(
        publicMethod,
      )) {
    addMethod('client', 'client.dart', rootSource, method);
  }
  for (final item in resources.entries) {
    final src = source(item.value.file);
    final type = src.type(item.value.type);
    reference.writeln(
      '## client.${item.key}\n\n${item.value.purpose}\n\nSource: `lib/src/${item.value.file}` · Class: `${item.value.type}`.\n',
    );
    for (final method in type.body.members.whereType<MethodDeclaration>().where(
      publicMethod,
    )) {
      addMethod('client.${item.key}', item.value.file, src, method);
    }
  }
  reference.writeln(
    '## Standalone ingestion clients\n\nThese clients are constructed separately; they are not `ProofChain` properties. Each request owns and closes its transport. Neither class has a public `close()` method.\n',
  );
  final ingest = source('ingestion.dart');
  for (final name in ['IngestionClient', 'EndUserIngestionClient']) {
    final type = ingest.type(name);
    reference.writeln('### $name\n');
    for (final node in type.body.members.whereType<ConstructorDeclaration>()) {
      reference.writeln('```text\n${constructorSignature(name, node)}\n```\n');
    }
    for (final method in type.body.members.whereType<MethodDeclaration>().where(
      publicMethod,
    )) {
      addMethod(name, 'ingestion.dart', ingest, method);
    }
  }
  reference.writeln(
    '## Notification and upload support types\n\n```text\ntypedef NotificationCallback = void Function(NotificationEvent event);\ntypedef Unsubscribe = void Function();\n```\n\n`Unsubscribe` is a synchronous cancellation function, not `StreamSubscription`. Call it to stop connecting, active and scheduled reconnect work.\n',
  );
  for (final pair in [
    ('notifications.dart', 'SubscribeOptions'),
    ('upload.dart', 'UploadFile'),
    ('http.dart', 'ProofChainOptions'),
  ]) {
    final type = source(pair.$1).type(pair.$2);
    for (final constructor
        in type.body.members.whereType<ConstructorDeclaration>()) {
      reference.writeln(
        '```text\n${constructorSignature(pair.$2, constructor)}\n```\n',
      );
    }
  }

  final models = source('models.dart');
  final modelTypes = models.parsed.unit.declarations
      .whereType<ClassDeclaration>()
      .toList();
  final aliases = models.parsed.unit.declarations
      .whereType<GenericTypeAlias>()
      .toList();
  reference.write('''# 17. Model and type catalog

All types below are exported by `package:proofchain_sdk/proofchain.dart`. The catalog is generated from `lib/src/models.dart`. It lists each named-constructor requirement and the number of optional constructor fields; use the source constructor or IDE completion for the full optional field types. Every generated class also supplies `Type.fromJson(JsonMap)` and `toJson()`. Required constructor fields describe the typed interface, not a promise that every server response contains that field; accessing a missing required getter can fail. Use raw `toJson()` when inspecting a response with unknown fields or a version mismatch.

The catalog intentionally distinguishes model construction from API authorization: constructing `Create*Request` does not grant permission to perform that operation. Do not pass an entire response model into a partial update without selecting the intended editable keys.

## 17.1 Generated model constructors

<table class="model-index">
<thead><tr><th>Type</th><th>Required named constructor fields</th><th>Optional</th></tr></thead>
<tbody>
''');
  final modelEntries = <Map<String, Object?>>[];
  for (final type in modelTypes) {
    final constructors = type.body.members
        .whereType<ConstructorDeclaration>()
        .where((node) => node.name == null)
        .toList();
    if (constructors.isEmpty) continue;
    final parameters = constructors.first.parameters.parameters;
    final required = parameters
        .where((p) => p.isRequiredNamed || p.isRequiredPositional)
        .map(
          (p) => compact(p.toSource()).replaceFirst(RegExp(r'^required '), ''),
        )
        .toList();
    final optional = parameters.length - required.length;
    reference.writeln(
      '<tr><td>${sourceCode(type.namePart.typeName.lexeme)}</td><td>${required.isEmpty ? 'None' : required.map(sourceCode).join(', ')}</td><td>$optional</td></tr>',
    );
    modelEntries.add({
      'name': type.namePart.typeName.lexeme,
      'required': required,
      'optionalCount': optional,
      'source': 'lib/src/models.dart',
      'line': models.line(type),
    });
  }
  reference.writeln('</tbody></table>\n');
  reference.writeln(
    '\n## 17.2 String unions and aliases\n\nDart string aliases do not enforce the JavaScript union members at runtime. Check the JavaScript type definition and server contract for accepted literal values.\n',
  );
  for (final alias in aliases) {
    reference.writeln('```text\n${compact(alias.toSource())}\n```\n');
  }
  reference.writeln(
    '## 17.3 Handwritten support and error types\n\n`JsonModel`, `JsonMap`, `UploadFile`, `ProofChainOptions`, `SubscribeOptions`, `NotificationCallback`, `Unsubscribe`, `ProofChainError`, `AuthenticationError`, `AuthorizationError`, `NotFoundError`, `ValidationError`, `ValidationErrorDetail`, `RateLimitError`, `ServerError`, `NetworkError`, and `TimeoutError` are exported support types. Error semantics and arbitrary validation detail handling are covered in chapter 5. `HttpClient` and JSON conversion helpers are internal implementation details, not exported transport-extension APIs.\n',
  );
  final referenceFile = File('${chapters.path}/04-api-reference.md');
  await referenceFile.writeAsString(reference.toString());
  final manifest = <String, Object?>{
    'sdkVersion': '0.1.1',
    'namespaces': resources.keys.toList(),
    'publicOperations': entries
        .where((entry) => entry['nativeLifecycle'] != true)
        .length,
    'methods': entries,
    'modelClasses': modelEntries,
    'typeAliases': aliases.map((a) => compact(a.toSource())).toList(),
  };
  await File(
    '${docs.path}/reference-manifest.json',
  ).writeAsString('${const JsonEncoder.withIndent('  ').convert(manifest)}\n');

  final chapterFiles =
      chapters
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.md'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));
  if (chapterFiles.length != 4) {
    throw StateError(
      'Expected four authored/generated chapter files; found ${chapterFiles.length}',
    );
  }
  final markdown = chapterFiles
      .map((file) => file.readAsStringSync())
      .join('\n\n');
  var body = renderMarkdown(markdown);
  final headings = <({String id, String text, int level})>[];
  final used = <String, int>{};
  body = body.replaceAllMapped(
    RegExp(r'<h([12])(?: id="[^"]*")?>([\s\S]*?)</h\1>'),
    (match) {
      final level = int.parse(match[1]!);
      final text = match[2]!
          .replaceAll(RegExp(r'<[^>]+>'), '')
          .replaceAll('&amp;', '&')
          .replaceAll('&lt;', '<')
          .replaceAll('&gt;', '>')
          .replaceAll('&#39;', "'")
          .replaceAll('&quot;', '"');
      final key = slug(text);
      final count = used.update(key, (n) => n + 1, ifAbsent: () => 1);
      final id = count == 1 ? key : '$key-$count';
      headings.add((id: id, text: text, level: level));
      return '<h$level id="$id">${match[2]}</h$level>';
    },
  );
  body = body.replaceAllMapped(
    RegExp(r'<pre><code([\s\S]*?)</code></pre>'),
    (match) => match[0]!.replaceFirst(
      '<pre>',
      match[0]!.split('\n').length <= 28 ? '<pre class="short">' : '<pre>',
    ),
  );
  final toc = headings
      .where(
        (h) =>
            h.level == 1 ||
            h.text.startsWith('client.') ||
            h.text == 'Standalone ingestion clients',
      )
      .map(
        (h) =>
            '<li${h.level == 2 ? ' class="sub"' : ''}><a href="#${h.id}">${escape(h.text)}</a></li>',
      )
      .join('\n');
  final css = File('${docs.path}/print.css').readAsStringSync();
  final date = DateTime.now().toUtc().toIso8601String().substring(0, 10);
  final html =
      '''<!DOCTYPE html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Security-Policy" content="default-src 'none'; style-src 'unsafe-inline'; script-src 'none'; connect-src 'none'; object-src 'none'; base-uri 'none'; form-action 'none'">
<title>ProofChain Flutter SDK — Developer Guide</title>
<meta name="description" content="Installation, authentication, Flutter integration, implementation recipes and source-derived API reference for proofchain_sdk.">
<style>$css</style></head><body>
<header class="cover"><div><div class="brand">ProofChain</div><h1>Flutter SDK<br>Developer guide</h1><p class="subtitle">Initialize securely. Integrate real workflows.<br>Use the complete Dart API.</p><p class="summary">A practical implementation manual for Android/iOS Flutter applications and trusted native Dart processes. Includes runnable Dart examples, authenticated Flutter integration, native event streams, ingestion and a source-derived API reference.</p></div><div class="meta"><p><strong>Package</strong> <code>proofchain_sdk</code> · <strong>Version</strong> ${manifest['sdkVersion']} · <strong>Edition</strong> $date</p><p><strong>Reference</strong> Current local JavaScript SDK and Dart implementation</p><p><strong>Scope</strong> ${resources.length} resource namespaces · ${manifest['publicOperations']} matching public operations</p><p class="status">Native Dart. Android/iOS build and device validation remain outstanding. Registry releases are versioned separately from this source guide.</p></div></header>
<nav class="toc" aria-label="Contents"><h1>Contents</h1><small>Section titles and resource namespaces are clickable in the PDF. Code examples use fixture identifiers and require your own authorized environment; no production credentials are included.</small><ol>$toc</ol></nav>
<main>$body</main></body></html>
''';
  final htmlFile = File('${docs.path}/developer-guide.html');
  await htmlFile.writeAsString(html);
  stdout.writeln('Generated ${htmlFile.path}');
  stdout.writeln(
    '${resources.length} namespaces; ${manifest['publicOperations']} operations; ${modelEntries.length} model classes; ${aliases.length} type aliases.',
  );
  if (args.contains('--check-examples')) await checkExamples(markdown, sdk);
  if (args.contains('--pdf')) {
    final profile = await Directory.systemTemp.createTemp(
      'proofchain-docs-chrome-',
    );
    try {
      final output = '${docs.path}/proofchain-flutter-sdk-developer-guide.pdf';
      final result = await Process.run(
        Platform.environment['CHROME_BIN'] ?? 'chromium',
        [
          '--headless',
          '--disable-gpu',
          '--no-pdf-header-footer',
          '--user-data-dir=${profile.path}',
          '--print-to-pdf=$output',
          htmlFile.uri.toString(),
        ],
      );
      if (result.exitCode != 0) {
        throw ProcessException(
          'chromium',
          [],
          '${result.stdout}\n${result.stderr}',
          result.exitCode,
        );
      }
      if (!File(output).existsSync() || File(output).lengthSync() < 1000) {
        throw StateError('Renderer did not produce a PDF');
      }
      stdout.writeln('Generated $output (${File(output).lengthSync()} bytes)');
    } finally {
      await profile.delete(recursive: true);
    }
  }
}

Future<void> checkExamples(String markdown, Directory sdk) async {
  final dir = await Directory.systemTemp.createTemp('proofchain-doc-examples-');
  try {
    final lib = await Directory('${dir.path}/lib').create();
    await File('${dir.path}/pubspec.yaml').writeAsString(
      'name: proofchain_guide_examples\npublish_to: none\nenvironment:\n  sdk: ">=3.13.0 <4.0.0"\ndependencies:\n  proofchain_sdk:\n    path: ${sdk.absolute.path}\n',
    );
    final fences = RegExp(
      r'^```dart\s*\n([\s\S]*?)^```\s*$',
      multiLine: true,
    ).allMatches(markdown);
    var checked = 0;
    var flutter = 0;
    for (final match in fences) {
      final code = match[1]!;
      if (code.contains('package:flutter/')) {
        flutter++;
        continue;
      }
      checked++;
      await File(
        '${lib.path}/example_${checked.toString().padLeft(2, '0')}.dart',
      ).writeAsString(code);
    }
    for (final command in [
      ['pub', 'get', '--offline'],
      ['analyze', '--fatal-infos'],
    ]) {
      final result = await Process.run(
        Platform.resolvedExecutable,
        command,
        workingDirectory: dir.path,
      );
      stdout.write(result.stdout);
      stderr.write(result.stderr);
      if (result.exitCode != 0) {
        throw ProcessException(
          Platform.resolvedExecutable,
          command,
          'Documentation examples failed validation',
          result.exitCode,
        );
      }
    }
    stdout.writeln(
      'Analyzed $checked standalone Dart examples. $flutter Flutter-only example(s) require a Flutter SDK and were not compiled by this check.',
    );
  } finally {
    await dir.delete(recursive: true);
  }
}
