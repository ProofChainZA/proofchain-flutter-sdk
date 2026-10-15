# Native Dart example

Run from the package root with Dart (no Flutter plugins required):

```sh
dart run example/proofchain_sdk_example.dart
```

Supply these nonempty environment variables through your shell's secure input or your secret manager:

- `PROOFCHAIN_USER_TOKEN`: a valid end-user JWT obtained from your application's authentication flow. Do not substitute a tenant/backend API key.
- `PROOFCHAIN_TENANT_ID`: the tenant scope for that JWT.
- `PROOFCHAIN_USER_ID`: the user whose passport the JWT is authorized to read.
- `PROOFCHAIN_BASE_URL` (optional): the API root, defaulting to `https://api.proofchain.co.za`. HTTPS is required except for HTTP loopback development servers. Include any deployment-specific API path prefix; omit query strings, fragments and URL credentials.

Do not commit credentials, put them in command-line arguments or shell history, or share environment dumps. Environment variables are configuration, not encrypted storage; use a trusted machine and clear them when finished. Production native applications should obtain and refresh JWTs through their own authentication flow and must not embed backend keys.

The example performs one read-only `GET /passports/{percent-encoded-user-id}` using `client.passports.get`. The SDK sends the JWT in `Authorization: Bearer ...` and tenant scope in `X-Tenant-ID`. The selected passport must already exist; this example does not create or mutate data. A successful response must be a JSON object accepted by the SDK's `Passport` model.

Output deliberately omits the JWT, tenant/user identifiers, passport contents, raw server responses and exception messages. Exit code 0 means the read succeeded, 64 means configuration/usage was invalid, and 1 means the read failed. The client always closes in `finally` after the request, releasing its sockets and notification subscriptions. Main SDK timeouts cover receipt of response headers, not subsequent response-body reading.
