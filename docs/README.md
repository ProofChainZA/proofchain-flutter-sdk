# Flutter SDK developer guide

- [Download/open the PDF](proofchain-flutter-sdk-developer-guide.pdf)
- [Read the self-contained HTML](developer-guide.html)
- [Edit the Markdown chapters](chapters/)

The guide covers installation, initialization, JWT/backend authentication,
Flutter session/widget ownership, model serialization, error handling, concrete
resource recipes, ingestion, native SSE, production integration, migration,
troubleshooting, and the source-derived method/model reference.

## Source files

| File | Role |
|---|---|
| `chapters/01-getting-started.md` | Setup, initialization, complete Flutter screen, models and errors |
| `chapters/02-workflows.md` | Resource implementation recipes |
| `chapters/03-operations.md` | Production/security, migration, troubleshooting and maintenance |
| `chapters/04-api-reference.md` | Generated method signatures and model/type catalog; do not edit by hand |
| `print.css` | Print/screen typography, page numbering and layout |
| `reference-manifest.json` | Generated source paths, lines, signatures and model requirements |
| `../tool/docs/build_guide.dart` | Source-AST extraction, HTML assembly, native example analysis and PDF rendering |

The HTML embeds its CSS and does not fetch remote assets. The PDF has selectable
text and linked contents. Its source baseline is this checkout, not an assumed
published JavaScript/Dart release.

## Rebuild

The private documentation tool requires Dart **3.13+** and Chromium/Chrome for
PDF output. These are documentation-tool requirements, not the SDK's declared
runtime minimum. Its dependencies do not enter the SDK's runtime dependency graph.

From the SDK package's `tool/docs` directory:

```sh
dart pub get
dart analyze
dart test
dart run build_guide.dart --check-examples --pdf
```

If necessary, set `CHROME_BIN` to the Chromium/Chrome executable path. Without
`--pdf`, the command refreshes the reference, manifest and HTML only. Without
`--check-examples`, it does not analyze example libraries. Author chapters 01–03;
chapter 04 is regenerated from SDK declarations every time.

The checker analyzes standalone native Dart fences against the local SDK in an
isolated temporary package. It does not execute every request against a live
service. Flutter-importing examples are reported separately and need a Flutter
SDK/app build for platform validation. PDF generation is not an Android/iOS build.

## Initial guide verification (0.1.0)

- Dart 3.13.5: documentation tooling analysis clean; all three renderer-security
  regression tests pass.
- All 28 standalone native Dart examples pass analysis against this SDK checkout.
- Selected examples were executed against a real loopback HTTP/SSE server:
  initialization, profile edits, two-page pagination, multipart/binary round-trip,
  end-user ingestion, SSE lifecycle, environment initialization and safe CLI
  failure boundaries; 10 requests observed.
- The Flutter screen requires a Flutter toolchain and was not built here.
  Android/iOS builds, real devices and live-tenant authorization are not proven
  by these checks.

For current SDK checks and model regeneration, see the package
[README](../README.md#development-and-verification) and guide chapter 15.
