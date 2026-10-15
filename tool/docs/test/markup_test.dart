import 'package:html/parser.dart' as html;
import 'package:test/test.dart';

import '../build_guide.dart' as guide;

void main() {
  test(
    'raw markup cannot load assets, execute code, or carry event handlers',
    () {
      final rendered = guide.renderMarkdown('''
# Guide
<script>window.docAttack = true;</script>
<img src="https://example.invalid/pixel" onerror="window.docAttack = true">
<iframe src="https://example.invalid/frame"></iframe>
<style>@import 'https://example.invalid/track.css';</style>
<a href="javascript:alert(1)" onclick="window.docAttack = true">Unsafe</a>
<a href="https://proofchain.co.za">Documentation</a>
<a href="#install">Install</a>
<p style="background:url(https://example.invalid/pixel)" onmouseover="alert(1)">Body</p>
''');
      final fragment = html.parseFragment(rendered);
      expect(
        fragment.querySelectorAll(
          'script,img,iframe,style,object,embed,svg,math,form,input',
        ),
        isEmpty,
      );
      expect(
        fragment.querySelectorAll('[onclick],[onerror],[onmouseover],[style]'),
        isEmpty,
      );
      final links = fragment.querySelectorAll('a');
      expect(links[0].attributes['href'], isNull);
      expect(links[1].attributes['href'], 'https://proofchain.co.za');
      expect(links[2].attributes['href'], '#install');
    },
  );

  test('annotated declarations remain literal code inside the model table', () {
    const declaration =
        '@Doc("`<img src=x onerror=alert(1)>` *_") String user_id';
    final rendered = guide.renderMarkdown(
      '<table class="model-index"><tbody><tr><td>'
      '${guide.sourceCode(declaration)}'
      '</td></tr></tbody></table>',
    );
    final fragment = html.parseFragment(rendered);
    expect(fragment.querySelectorAll('img,[onerror]'), isEmpty);
    expect(fragment.querySelector('table code')!.text, declaration);
    expect(fragment.querySelectorAll('tbody tr'), hasLength(1));
  });

  test('fenced examples preserve generic types and literal HTML without activation', () {
    const code =
        'Map<String, Object?> value = {"html": "<script>literal</script>"};';
    final rendered = guide.renderMarkdown('```dart\n$code\n```');
    final fragment = html.parseFragment(rendered);
    expect(fragment.querySelectorAll('script'), isEmpty);
    expect(fragment.querySelector('pre code')!.text.trim(), code);
    expect(
      fragment.querySelector('pre code')!.classes,
      contains('language-dart'),
    );
  });
}
