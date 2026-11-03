// Generated from the JavaScript SDK interfaces. Do not edit by hand.
// Regenerate with: node tool/generate_models.mjs
// Field names retain JavaScript API and JSON wire casing for SDK parity.
// This generated file alone allows those non-Dart-style identifiers.
// ignore_for_file: non_constant_identifier_names
import 'json.dart';
import 'upload.dart';

/// JSON model for JavaScript SDK `airkit.AirKitSessionResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class AirKitSessionResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _auth_token;

  /// Partner JWT (~5 min) to pass as `authToken` to airService.login()
  String get auth_token => _auth_token as String;
  final String? _partner_id;

  /// Moca partner ID — use as the AirService constructor's partnerId
  String get partner_id => _partner_id as String;
  final String? _build_env;

  /// 'sandbox' | 'production' — maps to BUILD_ENV in
  String get build_env => _build_env as String;
  final num? _expires_in;

  /// Token lifetime in seconds
  num get expires_in => _expires_in as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const AirKitSessionResponse(
      {required String auth_token,
      required String partner_id,
      required String build_env,
      required num expires_in})
      : _auth_token = auth_token,
        _partner_id = partner_id,
        _build_env = build_env,
        _expires_in = expires_in,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  AirKitSessionResponse.fromJson(JsonMap json)
      : _auth_token =
            json["auth_token"] == null ? null : json["auth_token"] as String,
        _partner_id =
            json["partner_id"] == null ? null : json["partner_id"] as String,
        _build_env =
            json["build_env"] == null ? null : json["build_env"] as String,
        _expires_in =
            json["expires_in"] == null ? null : json["expires_in"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "auth_token": jsonValue(_auth_token),
        "partner_id": jsonValue(_partner_id),
        "build_env": jsonValue(_build_env),
        "expires_in": jsonValue(_expires_in),
      };
}

/// JSON model for JavaScript SDK `attestations.AttestationSchema`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class AttestationSchema implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _slug;
  String get slug => _slug as String;
  final String? _description;
  String? get description => _description;
  final String? _attestation_type;
  String get attestation_type => _attestation_type as String;
  final Map<String, Object?>? _schema_definition;
  Map<String, Object?> get schema_definition =>
      _schema_definition as Map<String, Object?>;
  final bool? _revocable;
  bool get revocable => _revocable as bool;
  final num? _default_expiry_days;
  num? get default_expiry_days => _default_expiry_days;
  final String? _icon;
  String? get icon => _icon;
  final String? _color;
  String? get color => _color;
  final num? _version;
  num get version => _version as num;
  final bool? _is_active;
  bool get is_active => _is_active as bool;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const AttestationSchema(
      {required String id,
      required String name,
      required String slug,
      String? description,
      required String attestation_type,
      required Map<String, Object?> schema_definition,
      required bool revocable,
      num? default_expiry_days,
      String? icon,
      String? color,
      required num version,
      required bool is_active,
      required String created_at})
      : _id = id,
        _name = name,
        _slug = slug,
        _description = description,
        _attestation_type = attestation_type,
        _schema_definition = schema_definition,
        _revocable = revocable,
        _default_expiry_days = default_expiry_days,
        _icon = icon,
        _color = color,
        _version = version,
        _is_active = is_active,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  AttestationSchema.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _attestation_type = json["attestation_type"] == null
            ? null
            : json["attestation_type"] as String,
        _schema_definition = json["schema_definition"] == null
            ? null
            : asJsonMap(json["schema_definition"]),
        _revocable =
            json["revocable"] == null ? null : json["revocable"] as bool,
        _default_expiry_days = json["default_expiry_days"] == null
            ? null
            : json["default_expiry_days"] as num,
        _icon = json["icon"] == null ? null : json["icon"] as String,
        _color = json["color"] == null ? null : json["color"] as String,
        _version = json["version"] == null ? null : json["version"] as num,
        _is_active =
            json["is_active"] == null ? null : json["is_active"] as bool,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "slug": jsonValue(_slug),
        if (_description != null) "description": jsonValue(_description),
        "attestation_type": jsonValue(_attestation_type),
        "schema_definition": jsonValue(_schema_definition),
        "revocable": jsonValue(_revocable),
        if (_default_expiry_days != null)
          "default_expiry_days": jsonValue(_default_expiry_days),
        if (_icon != null) "icon": jsonValue(_icon),
        if (_color != null) "color": jsonValue(_color),
        "version": jsonValue(_version),
        "is_active": jsonValue(_is_active),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `attestations.Attestation`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class AttestationRecord implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _uid;
  String get uid => _uid as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final String? _schema_id;
  String get schema_id => _schema_id as String;
  final String? _attester_address;
  String get attester_address => _attester_address as String;
  final String? _attester_type;
  String get attester_type => _attester_type as String;
  final String? _subject_address;
  String get subject_address => _subject_address as String;
  final String? _subject_user_id;
  String? get subject_user_id => _subject_user_id;
  final Map<String, Object?>? _data;
  Map<String, Object?> get data => _data as Map<String, Object?>;
  final String? _ref_type;
  String? get ref_type => _ref_type;
  final String? _ref_id;
  String? get ref_id => _ref_id;
  final String? _signature;
  String? get signature => _signature;
  final String? _signature_type;
  String? get signature_type => _signature_type;
  final String? _status;
  String get status => _status as String;
  final String? _expires_at;
  String? get expires_at => _expires_at;
  final String? _revoked_at;
  String? get revoked_at => _revoked_at;
  final String? _revocation_reason;
  String? get revocation_reason => _revocation_reason;
  final String? _tx_hash;
  String? get tx_hash => _tx_hash;
  final num? _block_number;
  num? get block_number => _block_number;
  final String? _ipfs_hash;
  String? get ipfs_hash => _ipfs_hash;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const AttestationRecord(
      {required String id,
      required String uid,
      required String tenant_id,
      required String schema_id,
      required String attester_address,
      required String attester_type,
      required String subject_address,
      String? subject_user_id,
      required Map<String, Object?> data,
      String? ref_type,
      String? ref_id,
      String? signature,
      String? signature_type,
      required String status,
      String? expires_at,
      String? revoked_at,
      String? revocation_reason,
      String? tx_hash,
      num? block_number,
      String? ipfs_hash,
      required String created_at})
      : _id = id,
        _uid = uid,
        _tenant_id = tenant_id,
        _schema_id = schema_id,
        _attester_address = attester_address,
        _attester_type = attester_type,
        _subject_address = subject_address,
        _subject_user_id = subject_user_id,
        _data = data,
        _ref_type = ref_type,
        _ref_id = ref_id,
        _signature = signature,
        _signature_type = signature_type,
        _status = status,
        _expires_at = expires_at,
        _revoked_at = revoked_at,
        _revocation_reason = revocation_reason,
        _tx_hash = tx_hash,
        _block_number = block_number,
        _ipfs_hash = ipfs_hash,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  AttestationRecord.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _uid = json["uid"] == null ? null : json["uid"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _schema_id =
            json["schema_id"] == null ? null : json["schema_id"] as String,
        _attester_address = json["attester_address"] == null
            ? null
            : json["attester_address"] as String,
        _attester_type = json["attester_type"] == null
            ? null
            : json["attester_type"] as String,
        _subject_address = json["subject_address"] == null
            ? null
            : json["subject_address"] as String,
        _subject_user_id = json["subject_user_id"] == null
            ? null
            : json["subject_user_id"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _ref_type =
            json["ref_type"] == null ? null : json["ref_type"] as String,
        _ref_id = json["ref_id"] == null ? null : json["ref_id"] as String,
        _signature =
            json["signature"] == null ? null : json["signature"] as String,
        _signature_type = json["signature_type"] == null
            ? null
            : json["signature_type"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _revoked_at =
            json["revoked_at"] == null ? null : json["revoked_at"] as String,
        _revocation_reason = json["revocation_reason"] == null
            ? null
            : json["revocation_reason"] as String,
        _tx_hash = json["tx_hash"] == null ? null : json["tx_hash"] as String,
        _block_number =
            json["block_number"] == null ? null : json["block_number"] as num,
        _ipfs_hash =
            json["ipfs_hash"] == null ? null : json["ipfs_hash"] as String,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "uid": jsonValue(_uid),
        "tenant_id": jsonValue(_tenant_id),
        "schema_id": jsonValue(_schema_id),
        "attester_address": jsonValue(_attester_address),
        "attester_type": jsonValue(_attester_type),
        "subject_address": jsonValue(_subject_address),
        if (_subject_user_id != null)
          "subject_user_id": jsonValue(_subject_user_id),
        "data": jsonValue(_data),
        if (_ref_type != null) "ref_type": jsonValue(_ref_type),
        if (_ref_id != null) "ref_id": jsonValue(_ref_id),
        if (_signature != null) "signature": jsonValue(_signature),
        if (_signature_type != null)
          "signature_type": jsonValue(_signature_type),
        "status": jsonValue(_status),
        if (_expires_at != null) "expires_at": jsonValue(_expires_at),
        if (_revoked_at != null) "revoked_at": jsonValue(_revoked_at),
        if (_revocation_reason != null)
          "revocation_reason": jsonValue(_revocation_reason),
        if (_tx_hash != null) "tx_hash": jsonValue(_tx_hash),
        if (_block_number != null) "block_number": jsonValue(_block_number),
        if (_ipfs_hash != null) "ipfs_hash": jsonValue(_ipfs_hash),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `attestations.WalletCredential`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class WalletCredential implements JsonModel {
  final JsonMap? _originalJson;
  final String? _uid;
  String get uid => _uid as String;
  final String? _attestation_type;
  String? get attestation_type => _attestation_type;
  final String? _issuer_name;
  String? get issuer_name => _issuer_name;
  final String? _issuer_client_id;
  String? get issuer_client_id => _issuer_client_id;
  final String? _subject_address;
  String get subject_address => _subject_address as String;
  final Map<String, Object?>? _data;
  Map<String, Object?> get data => _data as Map<String, Object?>;
  final String? _signature;
  String? get signature => _signature;
  final String? _signature_type;
  String? get signature_type => _signature_type;
  final String? _status;
  String get status => _status as String;
  final String? _tx_hash;
  String? get tx_hash => _tx_hash;
  final String? _expires_at;
  String? get expires_at => _expires_at;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const WalletCredential(
      {required String uid,
      String? attestation_type,
      String? issuer_name,
      String? issuer_client_id,
      required String subject_address,
      required Map<String, Object?> data,
      String? signature,
      String? signature_type,
      required String status,
      String? tx_hash,
      String? expires_at,
      required String created_at})
      : _uid = uid,
        _attestation_type = attestation_type,
        _issuer_name = issuer_name,
        _issuer_client_id = issuer_client_id,
        _subject_address = subject_address,
        _data = data,
        _signature = signature,
        _signature_type = signature_type,
        _status = status,
        _tx_hash = tx_hash,
        _expires_at = expires_at,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  WalletCredential.fromJson(JsonMap json)
      : _uid = json["uid"] == null ? null : json["uid"] as String,
        _attestation_type = json["attestation_type"] == null
            ? null
            : json["attestation_type"] as String,
        _issuer_name =
            json["issuer_name"] == null ? null : json["issuer_name"] as String,
        _issuer_client_id = json["issuer_client_id"] == null
            ? null
            : json["issuer_client_id"] as String,
        _subject_address = json["subject_address"] == null
            ? null
            : json["subject_address"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _signature =
            json["signature"] == null ? null : json["signature"] as String,
        _signature_type = json["signature_type"] == null
            ? null
            : json["signature_type"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _tx_hash = json["tx_hash"] == null ? null : json["tx_hash"] as String,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "uid": jsonValue(_uid),
        if (_attestation_type != null)
          "attestation_type": jsonValue(_attestation_type),
        if (_issuer_name != null) "issuer_name": jsonValue(_issuer_name),
        if (_issuer_client_id != null)
          "issuer_client_id": jsonValue(_issuer_client_id),
        "subject_address": jsonValue(_subject_address),
        "data": jsonValue(_data),
        if (_signature != null) "signature": jsonValue(_signature),
        if (_signature_type != null)
          "signature_type": jsonValue(_signature_type),
        "status": jsonValue(_status),
        if (_tx_hash != null) "tx_hash": jsonValue(_tx_hash),
        if (_expires_at != null) "expires_at": jsonValue(_expires_at),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `attestations.WalletCredentialVerifySummary`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class WalletCredentialVerifySummary implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_address;
  String get wallet_address => _wallet_address as String;
  final num? _total_credentials;
  num get total_credentials => _total_credentials as num;
  final Map<String, num>? _credential_types;
  Map<String, num> get credential_types =>
      _credential_types as Map<String, num>;
  final Map<String, Object?>? _latest_scores;
  Map<String, Object?> get latest_scores =>
      _latest_scores as Map<String, Object?>;
  final bool? _is_verified;
  bool get is_verified => _is_verified as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const WalletCredentialVerifySummary(
      {required String wallet_address,
      required num total_credentials,
      required Map<String, num> credential_types,
      required Map<String, Object?> latest_scores,
      required bool is_verified})
      : _wallet_address = wallet_address,
        _total_credentials = total_credentials,
        _credential_types = credential_types,
        _latest_scores = latest_scores,
        _is_verified = is_verified,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  WalletCredentialVerifySummary.fromJson(JsonMap json)
      : _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _total_credentials = json["total_credentials"] == null
            ? null
            : json["total_credentials"] as num,
        _credential_types = json["credential_types"] == null
            ? null
            : asJsonMap(json["credential_types"])
                .map((key, value) => MapEntry(key, value as num)),
        _latest_scores = json["latest_scores"] == null
            ? null
            : asJsonMap(json["latest_scores"]),
        _is_verified =
            json["is_verified"] == null ? null : json["is_verified"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_address": jsonValue(_wallet_address),
        "total_credentials": jsonValue(_total_credentials),
        "credential_types": jsonValue(_credential_types),
        "latest_scores": jsonValue(_latest_scores),
        "is_verified": jsonValue(_is_verified),
      };
}

/// JSON model for JavaScript SDK `attestations.AttestationConfig`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class AttestationConfig implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final bool? _auto_attest_passports;
  bool get auto_attest_passports => _auto_attest_passports as bool;
  final bool? _auto_attest_cohort_scores;
  bool get auto_attest_cohort_scores => _auto_attest_cohort_scores as bool;
  final bool? _attest_on_score_change;
  bool get attest_on_score_change => _attest_on_score_change as bool;
  final num? _min_score_change_threshold;
  num get min_score_change_threshold => _min_score_change_threshold as num;
  final bool? _anchor_attestations;
  bool get anchor_attestations => _anchor_attestations as bool;
  final String? _reward_anchoring_mode;
  String get reward_anchoring_mode => _reward_anchoring_mode as String;
  final bool? _public_attestations;
  bool get public_attestations => _public_attestations as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const AttestationConfig(
      {required String id,
      required String tenant_id,
      required bool auto_attest_passports,
      required bool auto_attest_cohort_scores,
      required bool attest_on_score_change,
      required num min_score_change_threshold,
      required bool anchor_attestations,
      required String reward_anchoring_mode,
      required bool public_attestations})
      : _id = id,
        _tenant_id = tenant_id,
        _auto_attest_passports = auto_attest_passports,
        _auto_attest_cohort_scores = auto_attest_cohort_scores,
        _attest_on_score_change = attest_on_score_change,
        _min_score_change_threshold = min_score_change_threshold,
        _anchor_attestations = anchor_attestations,
        _reward_anchoring_mode = reward_anchoring_mode,
        _public_attestations = public_attestations,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  AttestationConfig.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _auto_attest_passports = json["auto_attest_passports"] == null
            ? null
            : json["auto_attest_passports"] as bool,
        _auto_attest_cohort_scores = json["auto_attest_cohort_scores"] == null
            ? null
            : json["auto_attest_cohort_scores"] as bool,
        _attest_on_score_change = json["attest_on_score_change"] == null
            ? null
            : json["attest_on_score_change"] as bool,
        _min_score_change_threshold = json["min_score_change_threshold"] == null
            ? null
            : json["min_score_change_threshold"] as num,
        _anchor_attestations = json["anchor_attestations"] == null
            ? null
            : json["anchor_attestations"] as bool,
        _reward_anchoring_mode = json["reward_anchoring_mode"] == null
            ? null
            : json["reward_anchoring_mode"] as String,
        _public_attestations = json["public_attestations"] == null
            ? null
            : json["public_attestations"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "tenant_id": jsonValue(_tenant_id),
        "auto_attest_passports": jsonValue(_auto_attest_passports),
        "auto_attest_cohort_scores": jsonValue(_auto_attest_cohort_scores),
        "attest_on_score_change": jsonValue(_attest_on_score_change),
        "min_score_change_threshold": jsonValue(_min_score_change_threshold),
        "anchor_attestations": jsonValue(_anchor_attestations),
        "reward_anchoring_mode": jsonValue(_reward_anchoring_mode),
        "public_attestations": jsonValue(_public_attestations),
      };
}

/// JSON model for JavaScript SDK `attestations.CreateAttestationRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateAttestationRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _schema_id;
  String get schema_id => _schema_id as String;
  final String? _subject_address;
  String get subject_address => _subject_address as String;
  final Map<String, Object?>? _data;
  Map<String, Object?> get data => _data as Map<String, Object?>;
  final String? _subject_user_id;
  String? get subject_user_id => _subject_user_id;
  final String? _ref_type;
  String? get ref_type => _ref_type;
  final String? _ref_id;
  String? get ref_id => _ref_id;
  final String? _expires_at;
  String? get expires_at => _expires_at;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateAttestationRequest(
      {required String schema_id,
      required String subject_address,
      required Map<String, Object?> data,
      String? subject_user_id,
      String? ref_type,
      String? ref_id,
      String? expires_at})
      : _schema_id = schema_id,
        _subject_address = subject_address,
        _data = data,
        _subject_user_id = subject_user_id,
        _ref_type = ref_type,
        _ref_id = ref_id,
        _expires_at = expires_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateAttestationRequest.fromJson(JsonMap json)
      : _schema_id =
            json["schema_id"] == null ? null : json["schema_id"] as String,
        _subject_address = json["subject_address"] == null
            ? null
            : json["subject_address"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _subject_user_id = json["subject_user_id"] == null
            ? null
            : json["subject_user_id"] as String,
        _ref_type =
            json["ref_type"] == null ? null : json["ref_type"] as String,
        _ref_id = json["ref_id"] == null ? null : json["ref_id"] as String,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "schema_id": jsonValue(_schema_id),
        "subject_address": jsonValue(_subject_address),
        "data": jsonValue(_data),
        if (_subject_user_id != null)
          "subject_user_id": jsonValue(_subject_user_id),
        if (_ref_type != null) "ref_type": jsonValue(_ref_type),
        if (_ref_id != null) "ref_id": jsonValue(_ref_id),
        if (_expires_at != null) "expires_at": jsonValue(_expires_at),
      };
}

/// JSON model for JavaScript SDK `attestations.ListAttestationsOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListAttestationsOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _attestation_type;
  String? get attestation_type => _attestation_type;
  final String? _status;
  String? get status => _status;
  final num? _limit;
  num? get limit => _limit;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListAttestationsOptions(
      {String? attestation_type, String? status, num? limit})
      : _attestation_type = attestation_type,
        _status = status,
        _limit = limit,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListAttestationsOptions.fromJson(JsonMap json)
      : _attestation_type = json["attestation_type"] == null
            ? null
            : json["attestation_type"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_attestation_type != null)
          "attestation_type": jsonValue(_attestation_type),
        if (_status != null) "status": jsonValue(_status),
        if (_limit != null) "limit": jsonValue(_limit),
      };
}

/// JSON model for JavaScript SDK `attestations.ListWalletCredentialsOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListWalletCredentialsOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _attestation_type;
  String? get attestation_type => _attestation_type;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListWalletCredentialsOptions(
      {String? attestation_type, num? limit, num? offset})
      : _attestation_type = attestation_type,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListWalletCredentialsOptions.fromJson(JsonMap json)
      : _attestation_type = json["attestation_type"] == null
            ? null
            : json["attestation_type"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_attestation_type != null)
          "attestation_type": jsonValue(_attestation_type),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `attestations.UpdateConfigRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UpdateAttestationConfigRequest implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _attest_on_score_change;
  bool? get attest_on_score_change => _attest_on_score_change;
  final num? _min_score_change_threshold;
  num? get min_score_change_threshold => _min_score_change_threshold;
  final bool? _anchor_attestations;
  bool? get anchor_attestations => _anchor_attestations;
  final String? _reward_anchoring_mode;
  String? get reward_anchoring_mode => _reward_anchoring_mode;
  final bool? _auto_attest_cohort_scores;
  bool? get auto_attest_cohort_scores => _auto_attest_cohort_scores;
  final bool? _public_attestations;
  bool? get public_attestations => _public_attestations;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UpdateAttestationConfigRequest(
      {bool? attest_on_score_change,
      num? min_score_change_threshold,
      bool? anchor_attestations,
      String? reward_anchoring_mode,
      bool? auto_attest_cohort_scores,
      bool? public_attestations})
      : _attest_on_score_change = attest_on_score_change,
        _min_score_change_threshold = min_score_change_threshold,
        _anchor_attestations = anchor_attestations,
        _reward_anchoring_mode = reward_anchoring_mode,
        _auto_attest_cohort_scores = auto_attest_cohort_scores,
        _public_attestations = public_attestations,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UpdateAttestationConfigRequest.fromJson(JsonMap json)
      : _attest_on_score_change = json["attest_on_score_change"] == null
            ? null
            : json["attest_on_score_change"] as bool,
        _min_score_change_threshold = json["min_score_change_threshold"] == null
            ? null
            : json["min_score_change_threshold"] as num,
        _anchor_attestations = json["anchor_attestations"] == null
            ? null
            : json["anchor_attestations"] as bool,
        _reward_anchoring_mode = json["reward_anchoring_mode"] == null
            ? null
            : json["reward_anchoring_mode"] as String,
        _auto_attest_cohort_scores = json["auto_attest_cohort_scores"] == null
            ? null
            : json["auto_attest_cohort_scores"] as bool,
        _public_attestations = json["public_attestations"] == null
            ? null
            : json["public_attestations"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_attest_on_score_change != null)
          "attest_on_score_change": jsonValue(_attest_on_score_change),
        if (_min_score_change_threshold != null)
          "min_score_change_threshold": jsonValue(_min_score_change_threshold),
        if (_anchor_attestations != null)
          "anchor_attestations": jsonValue(_anchor_attestations),
        if (_reward_anchoring_mode != null)
          "reward_anchoring_mode": jsonValue(_reward_anchoring_mode),
        if (_auto_attest_cohort_scores != null)
          "auto_attest_cohort_scores": jsonValue(_auto_attest_cohort_scores),
        if (_public_attestations != null)
          "public_attestations": jsonValue(_public_attestations),
      };
}

/// ProofChain SDK Types
///
/// Uses `String`; TypeScript-only constraints are not validated.
typedef AttestationMode = String;

/// Dart representation of JavaScript SDK `types.EventStatus`.
///
/// Uses `String`; TypeScript-only constraints are not validated.
typedef EventStatus = String;

/// Dart representation of JavaScript SDK `types.ChannelState`.
///
/// Uses `String`; TypeScript-only constraints are not validated.
typedef ChannelState = String;

/// JSON model for JavaScript SDK `types.AttestationResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class AttestationResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _ipfsHash;
  String get ipfsHash => _ipfsHash as String;
  final String? _documentHash;
  String get documentHash => _documentHash as String;
  final String? _gatewayUrl;
  String get gatewayUrl => _gatewayUrl as String;
  final String? _verifyUrl;
  String get verifyUrl => _verifyUrl as String;
  final String? _certificateId;
  String get certificateId => _certificateId as String;
  final EventStatus? _status;
  EventStatus get status => _status as EventStatus;
  final AttestationMode? _attestationMode;
  AttestationMode get attestationMode => _attestationMode as AttestationMode;
  final String? _timestamp;
  String get timestamp => _timestamp as String;
  final String? _blockchainTx;
  String? get blockchainTx => _blockchainTx;
  final List<String>? _proof;
  List<String>? get proof => _proof;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const AttestationResult(
      {required String id,
      required String ipfsHash,
      required String documentHash,
      required String gatewayUrl,
      required String verifyUrl,
      required String certificateId,
      required EventStatus status,
      required AttestationMode attestationMode,
      required String timestamp,
      String? blockchainTx,
      List<String>? proof})
      : _id = id,
        _ipfsHash = ipfsHash,
        _documentHash = documentHash,
        _gatewayUrl = gatewayUrl,
        _verifyUrl = verifyUrl,
        _certificateId = certificateId,
        _status = status,
        _attestationMode = attestationMode,
        _timestamp = timestamp,
        _blockchainTx = blockchainTx,
        _proof = proof,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  AttestationResult.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _ipfsHash =
            json["ipfsHash"] == null ? null : json["ipfsHash"] as String,
        _documentHash = json["documentHash"] == null
            ? null
            : json["documentHash"] as String,
        _gatewayUrl =
            json["gatewayUrl"] == null ? null : json["gatewayUrl"] as String,
        _verifyUrl =
            json["verifyUrl"] == null ? null : json["verifyUrl"] as String,
        _certificateId = json["certificateId"] == null
            ? null
            : json["certificateId"] as String,
        _status = json["status"] == null ? null : json["status"] as EventStatus,
        _attestationMode = json["attestationMode"] == null
            ? null
            : json["attestationMode"] as AttestationMode,
        _timestamp =
            json["timestamp"] == null ? null : json["timestamp"] as String,
        _blockchainTx = json["blockchainTx"] == null
            ? null
            : json["blockchainTx"] as String,
        _proof = json["proof"] == null
            ? null
            : (json["proof"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "ipfsHash": jsonValue(_ipfsHash),
        "documentHash": jsonValue(_documentHash),
        "gatewayUrl": jsonValue(_gatewayUrl),
        "verifyUrl": jsonValue(_verifyUrl),
        "certificateId": jsonValue(_certificateId),
        "status": jsonValue(_status),
        "attestationMode": jsonValue(_attestationMode),
        "timestamp": jsonValue(_timestamp),
        if (_blockchainTx != null) "blockchainTx": jsonValue(_blockchainTx),
        if (_proof != null) "proof": jsonValue(_proof),
      };
}

/// JSON model for JavaScript SDK `types.Event`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Event implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _eventType;
  String get eventType => _eventType as String;
  final String? _userId;
  String get userId => _userId as String;
  final String? _ipfsHash;
  String get ipfsHash => _ipfsHash as String;
  final String? _documentHash;
  String? get documentHash => _documentHash;
  final String? _gatewayUrl;
  String get gatewayUrl => _gatewayUrl as String;
  final String? _certificateId;
  String get certificateId => _certificateId as String;
  final EventStatus? _status;
  EventStatus get status => _status as EventStatus;
  final AttestationMode? _attestationMode;
  AttestationMode get attestationMode => _attestationMode as AttestationMode;
  final String? _timestamp;
  String get timestamp => _timestamp as String;
  final Map<String, Object?>? _data;
  Map<String, Object?>? get data => _data;
  final String? _blockchainTx;
  String? get blockchainTx => _blockchainTx;
  final String? _batchId;
  String? get batchId => _batchId;
  final String? _channelId;
  String? get channelId => _channelId;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Event(
      {required String id,
      required String eventType,
      required String userId,
      required String ipfsHash,
      String? documentHash,
      required String gatewayUrl,
      required String certificateId,
      required EventStatus status,
      required AttestationMode attestationMode,
      required String timestamp,
      Map<String, Object?>? data,
      String? blockchainTx,
      String? batchId,
      String? channelId})
      : _id = id,
        _eventType = eventType,
        _userId = userId,
        _ipfsHash = ipfsHash,
        _documentHash = documentHash,
        _gatewayUrl = gatewayUrl,
        _certificateId = certificateId,
        _status = status,
        _attestationMode = attestationMode,
        _timestamp = timestamp,
        _data = data,
        _blockchainTx = blockchainTx,
        _batchId = batchId,
        _channelId = channelId,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Event.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _eventType =
            json["eventType"] == null ? null : json["eventType"] as String,
        _userId = json["userId"] == null ? null : json["userId"] as String,
        _ipfsHash =
            json["ipfsHash"] == null ? null : json["ipfsHash"] as String,
        _documentHash = json["documentHash"] == null
            ? null
            : json["documentHash"] as String,
        _gatewayUrl =
            json["gatewayUrl"] == null ? null : json["gatewayUrl"] as String,
        _certificateId = json["certificateId"] == null
            ? null
            : json["certificateId"] as String,
        _status = json["status"] == null ? null : json["status"] as EventStatus,
        _attestationMode = json["attestationMode"] == null
            ? null
            : json["attestationMode"] as AttestationMode,
        _timestamp =
            json["timestamp"] == null ? null : json["timestamp"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _blockchainTx = json["blockchainTx"] == null
            ? null
            : json["blockchainTx"] as String,
        _batchId = json["batchId"] == null ? null : json["batchId"] as String,
        _channelId =
            json["channelId"] == null ? null : json["channelId"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "eventType": jsonValue(_eventType),
        "userId": jsonValue(_userId),
        "ipfsHash": jsonValue(_ipfsHash),
        if (_documentHash != null) "documentHash": jsonValue(_documentHash),
        "gatewayUrl": jsonValue(_gatewayUrl),
        "certificateId": jsonValue(_certificateId),
        "status": jsonValue(_status),
        "attestationMode": jsonValue(_attestationMode),
        "timestamp": jsonValue(_timestamp),
        if (_data != null) "data": jsonValue(_data),
        if (_blockchainTx != null) "blockchainTx": jsonValue(_blockchainTx),
        if (_batchId != null) "batchId": jsonValue(_batchId),
        if (_channelId != null) "channelId": jsonValue(_channelId),
      };
}

/// JSON model for JavaScript SDK `types.Channel`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Channel implements JsonModel {
  final JsonMap? _originalJson;
  final String? _channelId;
  String get channelId => _channelId as String;
  final String? _name;
  String get name => _name as String;
  final ChannelState? _state;
  ChannelState get state => _state as ChannelState;
  final String? _createdAt;
  String get createdAt => _createdAt as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Channel(
      {required String channelId,
      required String name,
      required ChannelState state,
      required String createdAt})
      : _channelId = channelId,
        _name = name,
        _state = state,
        _createdAt = createdAt,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Channel.fromJson(JsonMap json)
      : _channelId =
            json["channelId"] == null ? null : json["channelId"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _state = json["state"] == null ? null : json["state"] as ChannelState,
        _createdAt =
            json["createdAt"] == null ? null : json["createdAt"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "channelId": jsonValue(_channelId),
        "name": jsonValue(_name),
        "state": jsonValue(_state),
        "createdAt": jsonValue(_createdAt),
      };
}

/// JSON model for JavaScript SDK `types.ChannelStatus`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ChannelStatus implements JsonModel {
  final JsonMap? _originalJson;
  final String? _channelId;
  String get channelId => _channelId as String;
  final String? _name;
  String get name => _name as String;
  final ChannelState? _state;
  ChannelState get state => _state as ChannelState;
  final num? _eventCount;
  num get eventCount => _eventCount as num;
  final num? _syncedCount;
  num get syncedCount => _syncedCount as num;
  final num? _pendingCount;
  num get pendingCount => _pendingCount as num;
  final String? _createdAt;
  String get createdAt => _createdAt as String;
  final String? _lastActivity;
  String? get lastActivity => _lastActivity;
  final String? _lastSettlement;
  String? get lastSettlement => _lastSettlement;
  final String? _merkleRoot;
  String? get merkleRoot => _merkleRoot;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ChannelStatus(
      {required String channelId,
      required String name,
      required ChannelState state,
      required num eventCount,
      required num syncedCount,
      required num pendingCount,
      required String createdAt,
      String? lastActivity,
      String? lastSettlement,
      String? merkleRoot})
      : _channelId = channelId,
        _name = name,
        _state = state,
        _eventCount = eventCount,
        _syncedCount = syncedCount,
        _pendingCount = pendingCount,
        _createdAt = createdAt,
        _lastActivity = lastActivity,
        _lastSettlement = lastSettlement,
        _merkleRoot = merkleRoot,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ChannelStatus.fromJson(JsonMap json)
      : _channelId =
            json["channelId"] == null ? null : json["channelId"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _state = json["state"] == null ? null : json["state"] as ChannelState,
        _eventCount =
            json["eventCount"] == null ? null : json["eventCount"] as num,
        _syncedCount =
            json["syncedCount"] == null ? null : json["syncedCount"] as num,
        _pendingCount =
            json["pendingCount"] == null ? null : json["pendingCount"] as num,
        _createdAt =
            json["createdAt"] == null ? null : json["createdAt"] as String,
        _lastActivity = json["lastActivity"] == null
            ? null
            : json["lastActivity"] as String,
        _lastSettlement = json["lastSettlement"] == null
            ? null
            : json["lastSettlement"] as String,
        _merkleRoot =
            json["merkleRoot"] == null ? null : json["merkleRoot"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "channelId": jsonValue(_channelId),
        "name": jsonValue(_name),
        "state": jsonValue(_state),
        "eventCount": jsonValue(_eventCount),
        "syncedCount": jsonValue(_syncedCount),
        "pendingCount": jsonValue(_pendingCount),
        "createdAt": jsonValue(_createdAt),
        if (_lastActivity != null) "lastActivity": jsonValue(_lastActivity),
        if (_lastSettlement != null)
          "lastSettlement": jsonValue(_lastSettlement),
        if (_merkleRoot != null) "merkleRoot": jsonValue(_merkleRoot),
      };
}

/// JSON model for JavaScript SDK `types.Settlement`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Settlement implements JsonModel {
  final JsonMap? _originalJson;
  final String? _channelId;
  String get channelId => _channelId as String;
  final String? _txHash;
  String get txHash => _txHash as String;
  final String? _merkleRoot;
  String get merkleRoot => _merkleRoot as String;
  final num? _eventCount;
  num get eventCount => _eventCount as num;
  final num? _blockNumber;
  num get blockNumber => _blockNumber as num;
  final num? _gasUsed;
  num get gasUsed => _gasUsed as num;
  final String? _settledAt;
  String get settledAt => _settledAt as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Settlement(
      {required String channelId,
      required String txHash,
      required String merkleRoot,
      required num eventCount,
      required num blockNumber,
      required num gasUsed,
      required String settledAt})
      : _channelId = channelId,
        _txHash = txHash,
        _merkleRoot = merkleRoot,
        _eventCount = eventCount,
        _blockNumber = blockNumber,
        _gasUsed = gasUsed,
        _settledAt = settledAt,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Settlement.fromJson(JsonMap json)
      : _channelId =
            json["channelId"] == null ? null : json["channelId"] as String,
        _txHash = json["txHash"] == null ? null : json["txHash"] as String,
        _merkleRoot =
            json["merkleRoot"] == null ? null : json["merkleRoot"] as String,
        _eventCount =
            json["eventCount"] == null ? null : json["eventCount"] as num,
        _blockNumber =
            json["blockNumber"] == null ? null : json["blockNumber"] as num,
        _gasUsed = json["gasUsed"] == null ? null : json["gasUsed"] as num,
        _settledAt =
            json["settledAt"] == null ? null : json["settledAt"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "channelId": jsonValue(_channelId),
        "txHash": jsonValue(_txHash),
        "merkleRoot": jsonValue(_merkleRoot),
        "eventCount": jsonValue(_eventCount),
        "blockNumber": jsonValue(_blockNumber),
        "gasUsed": jsonValue(_gasUsed),
        "settledAt": jsonValue(_settledAt),
      };
}

/// JSON model for JavaScript SDK `types.Certificate`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Certificate implements JsonModel {
  final JsonMap? _originalJson;
  final String? _certificateId;
  String get certificateId => _certificateId as String;
  final String? _recipientName;
  String get recipientName => _recipientName as String;
  final String? _recipientEmail;
  String? get recipientEmail => _recipientEmail;
  final String? _title;
  String get title => _title as String;
  final String? _description;
  String? get description => _description;
  final String? _ipfsHash;
  String get ipfsHash => _ipfsHash as String;
  final String? _verifyUrl;
  String get verifyUrl => _verifyUrl as String;
  final String? _qrCodeUrl;
  String get qrCodeUrl => _qrCodeUrl as String;
  final String? _issuedAt;
  String get issuedAt => _issuedAt as String;
  final String? _expiresAt;
  String? get expiresAt => _expiresAt;
  final bool? _revoked;
  bool get revoked => _revoked as bool;
  final String? _revokedAt;
  String? get revokedAt => _revokedAt;
  final String? _revocationReason;
  String? get revocationReason => _revocationReason;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;
  final String? _blockchainTx;
  String? get blockchainTx => _blockchainTx;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Certificate(
      {required String certificateId,
      required String recipientName,
      String? recipientEmail,
      required String title,
      String? description,
      required String ipfsHash,
      required String verifyUrl,
      required String qrCodeUrl,
      required String issuedAt,
      String? expiresAt,
      required bool revoked,
      String? revokedAt,
      String? revocationReason,
      Map<String, Object?>? metadata,
      String? blockchainTx})
      : _certificateId = certificateId,
        _recipientName = recipientName,
        _recipientEmail = recipientEmail,
        _title = title,
        _description = description,
        _ipfsHash = ipfsHash,
        _verifyUrl = verifyUrl,
        _qrCodeUrl = qrCodeUrl,
        _issuedAt = issuedAt,
        _expiresAt = expiresAt,
        _revoked = revoked,
        _revokedAt = revokedAt,
        _revocationReason = revocationReason,
        _metadata = metadata,
        _blockchainTx = blockchainTx,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Certificate.fromJson(JsonMap json)
      : _certificateId = json["certificateId"] == null
            ? null
            : json["certificateId"] as String,
        _recipientName = json["recipientName"] == null
            ? null
            : json["recipientName"] as String,
        _recipientEmail = json["recipientEmail"] == null
            ? null
            : json["recipientEmail"] as String,
        _title = json["title"] == null ? null : json["title"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _ipfsHash =
            json["ipfsHash"] == null ? null : json["ipfsHash"] as String,
        _verifyUrl =
            json["verifyUrl"] == null ? null : json["verifyUrl"] as String,
        _qrCodeUrl =
            json["qrCodeUrl"] == null ? null : json["qrCodeUrl"] as String,
        _issuedAt =
            json["issuedAt"] == null ? null : json["issuedAt"] as String,
        _expiresAt =
            json["expiresAt"] == null ? null : json["expiresAt"] as String,
        _revoked = json["revoked"] == null ? null : json["revoked"] as bool,
        _revokedAt =
            json["revokedAt"] == null ? null : json["revokedAt"] as String,
        _revocationReason = json["revocationReason"] == null
            ? null
            : json["revocationReason"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _blockchainTx = json["blockchainTx"] == null
            ? null
            : json["blockchainTx"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "certificateId": jsonValue(_certificateId),
        "recipientName": jsonValue(_recipientName),
        if (_recipientEmail != null)
          "recipientEmail": jsonValue(_recipientEmail),
        "title": jsonValue(_title),
        if (_description != null) "description": jsonValue(_description),
        "ipfsHash": jsonValue(_ipfsHash),
        "verifyUrl": jsonValue(_verifyUrl),
        "qrCodeUrl": jsonValue(_qrCodeUrl),
        "issuedAt": jsonValue(_issuedAt),
        if (_expiresAt != null) "expiresAt": jsonValue(_expiresAt),
        "revoked": jsonValue(_revoked),
        if (_revokedAt != null) "revokedAt": jsonValue(_revokedAt),
        if (_revocationReason != null)
          "revocationReason": jsonValue(_revocationReason),
        if (_metadata != null) "metadata": jsonValue(_metadata),
        if (_blockchainTx != null) "blockchainTx": jsonValue(_blockchainTx),
      };
}

/// JSON model for JavaScript SDK `types.Webhook`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Webhook implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _url;
  String get url => _url as String;
  final List<String>? _events;
  List<String> get events => _events as List<String>;
  final bool? _active;
  bool get active => _active as bool;
  final String? _createdAt;
  String get createdAt => _createdAt as String;
  final String? _lastTriggered;
  String? get lastTriggered => _lastTriggered;
  final num? _failureCount;
  num get failureCount => _failureCount as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Webhook(
      {required String id,
      required String url,
      required List<String> events,
      required bool active,
      required String createdAt,
      String? lastTriggered,
      required num failureCount})
      : _id = id,
        _url = url,
        _events = events,
        _active = active,
        _createdAt = createdAt,
        _lastTriggered = lastTriggered,
        _failureCount = failureCount,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Webhook.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _url = json["url"] == null ? null : json["url"] as String,
        _events = json["events"] == null
            ? null
            : (json["events"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _active = json["active"] == null ? null : json["active"] as bool,
        _createdAt =
            json["createdAt"] == null ? null : json["createdAt"] as String,
        _lastTriggered = json["lastTriggered"] == null
            ? null
            : json["lastTriggered"] as String,
        _failureCount =
            json["failureCount"] == null ? null : json["failureCount"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "url": jsonValue(_url),
        "events": jsonValue(_events),
        "active": jsonValue(_active),
        "createdAt": jsonValue(_createdAt),
        if (_lastTriggered != null) "lastTriggered": jsonValue(_lastTriggered),
        "failureCount": jsonValue(_failureCount),
      };
}

/// JSON model for JavaScript SDK `types.VerificationResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class VerificationResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _valid;
  bool get valid => _valid as bool;
  final String? _ipfsHash;
  String get ipfsHash => _ipfsHash as String;
  final String? _documentHash;
  String? get documentHash => _documentHash;
  final String? _timestamp;
  String? get timestamp => _timestamp;
  final String? _certificateId;
  String? get certificateId => _certificateId;
  final String? _blockchainTx;
  String? get blockchainTx => _blockchainTx;
  final num? _blockNumber;
  num? get blockNumber => _blockNumber;
  final AttestationMode? _attestationMode;
  AttestationMode? get attestationMode => _attestationMode;
  final bool? _proofVerified;
  bool get proofVerified => _proofVerified as bool;
  final String? _message;
  String get message => _message as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const VerificationResult(
      {required bool valid,
      required String ipfsHash,
      String? documentHash,
      String? timestamp,
      String? certificateId,
      String? blockchainTx,
      num? blockNumber,
      AttestationMode? attestationMode,
      required bool proofVerified,
      required String message})
      : _valid = valid,
        _ipfsHash = ipfsHash,
        _documentHash = documentHash,
        _timestamp = timestamp,
        _certificateId = certificateId,
        _blockchainTx = blockchainTx,
        _blockNumber = blockNumber,
        _attestationMode = attestationMode,
        _proofVerified = proofVerified,
        _message = message,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  VerificationResult.fromJson(JsonMap json)
      : _valid = json["valid"] == null ? null : json["valid"] as bool,
        _ipfsHash =
            json["ipfsHash"] == null ? null : json["ipfsHash"] as String,
        _documentHash = json["documentHash"] == null
            ? null
            : json["documentHash"] as String,
        _timestamp =
            json["timestamp"] == null ? null : json["timestamp"] as String,
        _certificateId = json["certificateId"] == null
            ? null
            : json["certificateId"] as String,
        _blockchainTx = json["blockchainTx"] == null
            ? null
            : json["blockchainTx"] as String,
        _blockNumber =
            json["blockNumber"] == null ? null : json["blockNumber"] as num,
        _attestationMode = json["attestationMode"] == null
            ? null
            : json["attestationMode"] as AttestationMode,
        _proofVerified = json["proofVerified"] == null
            ? null
            : json["proofVerified"] as bool,
        _message = json["message"] == null ? null : json["message"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "valid": jsonValue(_valid),
        "ipfsHash": jsonValue(_ipfsHash),
        if (_documentHash != null) "documentHash": jsonValue(_documentHash),
        if (_timestamp != null) "timestamp": jsonValue(_timestamp),
        if (_certificateId != null) "certificateId": jsonValue(_certificateId),
        if (_blockchainTx != null) "blockchainTx": jsonValue(_blockchainTx),
        if (_blockNumber != null) "blockNumber": jsonValue(_blockNumber),
        if (_attestationMode != null)
          "attestationMode": jsonValue(_attestationMode),
        "proofVerified": jsonValue(_proofVerified),
        "message": jsonValue(_message),
      };
}

/// JSON model for JavaScript SDK `types.SearchResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SearchResult implements JsonModel {
  final JsonMap? _originalJson;
  final num? _total;
  num get total => _total as num;
  final num? _page;
  num get page => _page as num;
  final num? _limit;
  num get limit => _limit as num;
  final List<Event>? _events;
  List<Event> get events => _events as List<Event>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SearchResult(
      {required num total,
      required num page,
      required num limit,
      required List<Event> events})
      : _total = total,
        _page = page,
        _limit = limit,
        _events = events,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SearchResult.fromJson(JsonMap json)
      : _total = json["total"] == null ? null : json["total"] as num,
        _page = json["page"] == null ? null : json["page"] as num,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _events = json["events"] == null
            ? null
            : (json["events"] as List<Object?>)
                .map((item) => Event.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "total": jsonValue(_total),
        "page": jsonValue(_page),
        "limit": jsonValue(_limit),
        "events": jsonValue(_events),
      };
}

/// JSON model for JavaScript SDK `types.UsageStats`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UsageStats implements JsonModel {
  final JsonMap? _originalJson;
  final String? _periodStart;
  String get periodStart => _periodStart as String;
  final String? _periodEnd;
  String get periodEnd => _periodEnd as String;
  final num? _eventsCreated;
  num get eventsCreated => _eventsCreated as num;
  final num? _documentsAttested;
  num get documentsAttested => _documentsAttested as num;
  final num? _verifications;
  num get verifications => _verifications as num;
  final num? _apiCalls;
  num get apiCalls => _apiCalls as num;
  final num? _storageBytes;
  num get storageBytes => _storageBytes as num;
  final num? _channelsCreated;
  num get channelsCreated => _channelsCreated as num;
  final num? _settlements;
  num get settlements => _settlements as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UsageStats(
      {required String periodStart,
      required String periodEnd,
      required num eventsCreated,
      required num documentsAttested,
      required num verifications,
      required num apiCalls,
      required num storageBytes,
      required num channelsCreated,
      required num settlements})
      : _periodStart = periodStart,
        _periodEnd = periodEnd,
        _eventsCreated = eventsCreated,
        _documentsAttested = documentsAttested,
        _verifications = verifications,
        _apiCalls = apiCalls,
        _storageBytes = storageBytes,
        _channelsCreated = channelsCreated,
        _settlements = settlements,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UsageStats.fromJson(JsonMap json)
      : _periodStart =
            json["periodStart"] == null ? null : json["periodStart"] as String,
        _periodEnd =
            json["periodEnd"] == null ? null : json["periodEnd"] as String,
        _eventsCreated =
            json["eventsCreated"] == null ? null : json["eventsCreated"] as num,
        _documentsAttested = json["documentsAttested"] == null
            ? null
            : json["documentsAttested"] as num,
        _verifications =
            json["verifications"] == null ? null : json["verifications"] as num,
        _apiCalls = json["apiCalls"] == null ? null : json["apiCalls"] as num,
        _storageBytes =
            json["storageBytes"] == null ? null : json["storageBytes"] as num,
        _channelsCreated = json["channelsCreated"] == null
            ? null
            : json["channelsCreated"] as num,
        _settlements =
            json["settlements"] == null ? null : json["settlements"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "periodStart": jsonValue(_periodStart),
        "periodEnd": jsonValue(_periodEnd),
        "eventsCreated": jsonValue(_eventsCreated),
        "documentsAttested": jsonValue(_documentsAttested),
        "verifications": jsonValue(_verifications),
        "apiCalls": jsonValue(_apiCalls),
        "storageBytes": jsonValue(_storageBytes),
        "channelsCreated": jsonValue(_channelsCreated),
        "settlements": jsonValue(_settlements),
      };
}

/// JSON model for JavaScript SDK `types.TenantInfo`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class TenantInfo implements JsonModel {
  final JsonMap? _originalJson;
  final String? _tenantId;
  String get tenantId => _tenantId as String;
  final String? _name;
  String get name => _name as String;
  final String? _subdomain;
  String get subdomain => _subdomain as String;
  final String? _plan;
  String get plan => _plan as String;
  final String? _createdAt;
  String get createdAt => _createdAt as String;
  final num? _apiKeysCount;
  num get apiKeysCount => _apiKeysCount as num;
  final num? _eventsCount;
  num get eventsCount => _eventsCount as num;
  final num? _storageUsedBytes;
  num get storageUsedBytes => _storageUsedBytes as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const TenantInfo(
      {required String tenantId,
      required String name,
      required String subdomain,
      required String plan,
      required String createdAt,
      required num apiKeysCount,
      required num eventsCount,
      required num storageUsedBytes})
      : _tenantId = tenantId,
        _name = name,
        _subdomain = subdomain,
        _plan = plan,
        _createdAt = createdAt,
        _apiKeysCount = apiKeysCount,
        _eventsCount = eventsCount,
        _storageUsedBytes = storageUsedBytes,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  TenantInfo.fromJson(JsonMap json)
      : _tenantId =
            json["tenantId"] == null ? null : json["tenantId"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _subdomain =
            json["subdomain"] == null ? null : json["subdomain"] as String,
        _plan = json["plan"] == null ? null : json["plan"] as String,
        _createdAt =
            json["createdAt"] == null ? null : json["createdAt"] as String,
        _apiKeysCount =
            json["apiKeysCount"] == null ? null : json["apiKeysCount"] as num,
        _eventsCount =
            json["eventsCount"] == null ? null : json["eventsCount"] as num,
        _storageUsedBytes = json["storageUsedBytes"] == null
            ? null
            : json["storageUsedBytes"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "tenantId": jsonValue(_tenantId),
        "name": jsonValue(_name),
        "subdomain": jsonValue(_subdomain),
        "plan": jsonValue(_plan),
        "createdAt": jsonValue(_createdAt),
        "apiKeysCount": jsonValue(_apiKeysCount),
        "eventsCount": jsonValue(_eventsCount),
        "storageUsedBytes": jsonValue(_storageUsedBytes),
      };
}

/// JSON model for JavaScript SDK `types.StreamAck`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class StreamAck implements JsonModel {
  final JsonMap? _originalJson;
  final num? _sequence;
  num get sequence => _sequence as num;
  final String? _channelId;
  String get channelId => _channelId as String;
  final bool? _received;
  bool get received => _received as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const StreamAck(
      {required num sequence,
      required String channelId,
      required bool received})
      : _sequence = sequence,
        _channelId = channelId,
        _received = received,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  StreamAck.fromJson(JsonMap json)
      : _sequence = json["sequence"] == null ? null : json["sequence"] as num,
        _channelId =
            json["channelId"] == null ? null : json["channelId"] as String,
        _received = json["received"] == null ? null : json["received"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "sequence": jsonValue(_sequence),
        "channelId": jsonValue(_channelId),
        "received": jsonValue(_received),
      };
}

/// JSON model for JavaScript SDK `types.AttestRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class AttestRequest implements JsonModel {
  final JsonMap? _originalJson;
  final UploadFile? _file;
  UploadFile get file => _file as UploadFile;
  final String? _filename;
  String? get filename => _filename;
  final String? _userId;
  String get userId => _userId as String;
  final String? _eventType;
  String? get eventType => _eventType;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;
  final bool? _encrypt;
  bool? get encrypt => _encrypt;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const AttestRequest(
      {required UploadFile file,
      String? filename,
      required String userId,
      String? eventType,
      Map<String, Object?>? metadata,
      bool? encrypt})
      : _file = file,
        _filename = filename,
        _userId = userId,
        _eventType = eventType,
        _metadata = metadata,
        _encrypt = encrypt,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  AttestRequest.fromJson(JsonMap json)
      : _file = json["file"] == null
            ? null
            : json["file"] is UploadFile
                ? json["file"] as UploadFile
                : UploadFile((json["file"] as List<Object?>).cast<int>()),
        _filename =
            json["filename"] == null ? null : json["filename"] as String,
        _userId = json["userId"] == null ? null : json["userId"] as String,
        _eventType =
            json["eventType"] == null ? null : json["eventType"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _encrypt = json["encrypt"] == null ? null : json["encrypt"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "file": jsonValue(_file),
        if (_filename != null) "filename": jsonValue(_filename),
        "userId": jsonValue(_userId),
        if (_eventType != null) "eventType": jsonValue(_eventType),
        if (_metadata != null) "metadata": jsonValue(_metadata),
        if (_encrypt != null) "encrypt": jsonValue(_encrypt),
      };
}

/// JSON model for JavaScript SDK `types.CreateEventRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateEventRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _eventType;
  String get eventType => _eventType as String;
  final String? _userId;
  String get userId => _userId as String;
  final Map<String, Object?>? _data;
  Map<String, Object?>? get data => _data;
  final String? _source;
  String? get source => _source;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateEventRequest(
      {required String eventType,
      required String userId,
      Map<String, Object?>? data,
      String? source})
      : _eventType = eventType,
        _userId = userId,
        _data = data,
        _source = source,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateEventRequest.fromJson(JsonMap json)
      : _eventType =
            json["eventType"] == null ? null : json["eventType"] as String,
        _userId = json["userId"] == null ? null : json["userId"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _source = json["source"] == null ? null : json["source"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "eventType": jsonValue(_eventType),
        "userId": jsonValue(_userId),
        if (_data != null) "data": jsonValue(_data),
        if (_source != null) "source": jsonValue(_source),
      };
}

/// JSON model for JavaScript SDK `types.ListEventsRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListEventsRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _userId;
  String? get userId => _userId;
  final String? _eventType;
  String? get eventType => _eventType;
  final String? _status;
  String? get status => _status;
  final String? _startDate;
  String? get startDate => _startDate;
  final String? _endDate;
  String? get endDate => _endDate;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListEventsRequest(
      {String? userId,
      String? eventType,
      String? status,
      String? startDate,
      String? endDate,
      num? limit,
      num? offset})
      : _userId = userId,
        _eventType = eventType,
        _status = status,
        _startDate = startDate,
        _endDate = endDate,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListEventsRequest.fromJson(JsonMap json)
      : _userId = json["userId"] == null ? null : json["userId"] as String,
        _eventType =
            json["eventType"] == null ? null : json["eventType"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _startDate =
            json["startDate"] == null ? null : json["startDate"] as String,
        _endDate = json["endDate"] == null ? null : json["endDate"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_userId != null) "userId": jsonValue(_userId),
        if (_eventType != null) "eventType": jsonValue(_eventType),
        if (_status != null) "status": jsonValue(_status),
        if (_startDate != null) "startDate": jsonValue(_startDate),
        if (_endDate != null) "endDate": jsonValue(_endDate),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `types.SearchRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SearchRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _query;
  String get query => _query as String;
  final String? _userId;
  String? get userId => _userId;
  final String? _eventType;
  String? get eventType => _eventType;
  final String? _startDate;
  String? get startDate => _startDate;
  final String? _endDate;
  String? get endDate => _endDate;
  final num? _limit;
  num? get limit => _limit;
  final num? _page;
  num? get page => _page;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SearchRequest(
      {required String query,
      String? userId,
      String? eventType,
      String? startDate,
      String? endDate,
      num? limit,
      num? page})
      : _query = query,
        _userId = userId,
        _eventType = eventType,
        _startDate = startDate,
        _endDate = endDate,
        _limit = limit,
        _page = page,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SearchRequest.fromJson(JsonMap json)
      : _query = json["query"] == null ? null : json["query"] as String,
        _userId = json["userId"] == null ? null : json["userId"] as String,
        _eventType =
            json["eventType"] == null ? null : json["eventType"] as String,
        _startDate =
            json["startDate"] == null ? null : json["startDate"] as String,
        _endDate = json["endDate"] == null ? null : json["endDate"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _page = json["page"] == null ? null : json["page"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "query": jsonValue(_query),
        if (_userId != null) "userId": jsonValue(_userId),
        if (_eventType != null) "eventType": jsonValue(_eventType),
        if (_startDate != null) "startDate": jsonValue(_startDate),
        if (_endDate != null) "endDate": jsonValue(_endDate),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_page != null) "page": jsonValue(_page),
      };
}

/// JSON model for JavaScript SDK `types.CreateChannelRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateChannelRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateChannelRequest({required String name, String? description})
      : _name = name,
        _description = description,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateChannelRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
      };
}

/// JSON model for JavaScript SDK `types.StreamEventRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class StreamEventRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _eventType;
  String get eventType => _eventType as String;
  final String? _userId;
  String get userId => _userId as String;
  final Map<String, Object?>? _data;
  Map<String, Object?>? get data => _data;
  final String? _source;
  String? get source => _source;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const StreamEventRequest(
      {required String eventType,
      required String userId,
      Map<String, Object?>? data,
      String? source})
      : _eventType = eventType,
        _userId = userId,
        _data = data,
        _source = source,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  StreamEventRequest.fromJson(JsonMap json)
      : _eventType =
            json["eventType"] == null ? null : json["eventType"] as String,
        _userId = json["userId"] == null ? null : json["userId"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _source = json["source"] == null ? null : json["source"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "eventType": jsonValue(_eventType),
        "userId": jsonValue(_userId),
        if (_data != null) "data": jsonValue(_data),
        if (_source != null) "source": jsonValue(_source),
      };
}

/// JSON model for JavaScript SDK `types.IssueCertificateRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class IssueCertificateRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _recipientName;
  String get recipientName => _recipientName as String;
  final String? _recipientEmail;
  String? get recipientEmail => _recipientEmail;
  final String? _title;
  String get title => _title as String;
  final String? _description;
  String? get description => _description;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;
  final String? _expiresAt;
  String? get expiresAt => _expiresAt;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const IssueCertificateRequest(
      {required String recipientName,
      String? recipientEmail,
      required String title,
      String? description,
      Map<String, Object?>? metadata,
      String? expiresAt})
      : _recipientName = recipientName,
        _recipientEmail = recipientEmail,
        _title = title,
        _description = description,
        _metadata = metadata,
        _expiresAt = expiresAt,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  IssueCertificateRequest.fromJson(JsonMap json)
      : _recipientName = json["recipientName"] == null
            ? null
            : json["recipientName"] as String,
        _recipientEmail = json["recipientEmail"] == null
            ? null
            : json["recipientEmail"] as String,
        _title = json["title"] == null ? null : json["title"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _expiresAt =
            json["expiresAt"] == null ? null : json["expiresAt"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "recipientName": jsonValue(_recipientName),
        if (_recipientEmail != null)
          "recipientEmail": jsonValue(_recipientEmail),
        "title": jsonValue(_title),
        if (_description != null) "description": jsonValue(_description),
        if (_metadata != null) "metadata": jsonValue(_metadata),
        if (_expiresAt != null) "expiresAt": jsonValue(_expiresAt),
      };
}

/// JSON model for JavaScript SDK `types.ListCertificatesRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListCertificatesRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _recipientEmail;
  String? get recipientEmail => _recipientEmail;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListCertificatesRequest(
      {String? recipientEmail, num? limit, num? offset})
      : _recipientEmail = recipientEmail,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListCertificatesRequest.fromJson(JsonMap json)
      : _recipientEmail = json["recipientEmail"] == null
            ? null
            : json["recipientEmail"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_recipientEmail != null)
          "recipientEmail": jsonValue(_recipientEmail),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `types.CreateWebhookRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateWebhookRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _url;
  String get url => _url as String;
  final List<String>? _events;
  List<String> get events => _events as List<String>;
  final String? _secret;
  String? get secret => _secret;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateWebhookRequest(
      {required String url, required List<String> events, String? secret})
      : _url = url,
        _events = events,
        _secret = secret,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateWebhookRequest.fromJson(JsonMap json)
      : _url = json["url"] == null ? null : json["url"] as String,
        _events = json["events"] == null
            ? null
            : (json["events"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _secret = json["secret"] == null ? null : json["secret"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "url": jsonValue(_url),
        "events": jsonValue(_events),
        if (_secret != null) "secret": jsonValue(_secret),
      };
}

/// JSON model for JavaScript SDK `types.UpdateWebhookRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UpdateWebhookRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _url;
  String? get url => _url;
  final List<String>? _events;
  List<String>? get events => _events;
  final bool? _active;
  bool? get active => _active;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UpdateWebhookRequest({String? url, List<String>? events, bool? active})
      : _url = url,
        _events = events,
        _active = active,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UpdateWebhookRequest.fromJson(JsonMap json)
      : _url = json["url"] == null ? null : json["url"] as String,
        _events = json["events"] == null
            ? null
            : (json["events"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _active = json["active"] == null ? null : json["active"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_url != null) "url": jsonValue(_url),
        if (_events != null) "events": jsonValue(_events),
        if (_active != null) "active": jsonValue(_active),
      };
}

/// JSON model for JavaScript SDK `types.VaultFile`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class VaultFile implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _filename;
  String get filename => _filename as String;
  final String? _mimeType;
  String get mimeType => _mimeType as String;
  final num? _size;
  num get size => _size as num;
  final String? _ipfsHash;
  String get ipfsHash => _ipfsHash as String;
  final String? _userId;
  String get userId => _userId as String;
  final String? _folderId;
  String? get folderId => _folderId;
  final String? _accessMode;
  String get accessMode => _accessMode as String;
  final String? _createdAt;
  String get createdAt => _createdAt as String;
  final String? _updatedAt;
  String? get updatedAt => _updatedAt;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const VaultFile(
      {required String id,
      required String filename,
      required String mimeType,
      required num size,
      required String ipfsHash,
      required String userId,
      String? folderId,
      required String accessMode,
      required String createdAt,
      String? updatedAt})
      : _id = id,
        _filename = filename,
        _mimeType = mimeType,
        _size = size,
        _ipfsHash = ipfsHash,
        _userId = userId,
        _folderId = folderId,
        _accessMode = accessMode,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  VaultFile.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _filename =
            json["filename"] == null ? null : json["filename"] as String,
        _mimeType =
            json["mimeType"] == null ? null : json["mimeType"] as String,
        _size = json["size"] == null ? null : json["size"] as num,
        _ipfsHash =
            json["ipfsHash"] == null ? null : json["ipfsHash"] as String,
        _userId = json["userId"] == null ? null : json["userId"] as String,
        _folderId =
            json["folderId"] == null ? null : json["folderId"] as String,
        _accessMode =
            json["accessMode"] == null ? null : json["accessMode"] as String,
        _createdAt =
            json["createdAt"] == null ? null : json["createdAt"] as String,
        _updatedAt =
            json["updatedAt"] == null ? null : json["updatedAt"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "filename": jsonValue(_filename),
        "mimeType": jsonValue(_mimeType),
        "size": jsonValue(_size),
        "ipfsHash": jsonValue(_ipfsHash),
        "userId": jsonValue(_userId),
        if (_folderId != null) "folderId": jsonValue(_folderId),
        "accessMode": jsonValue(_accessMode),
        "createdAt": jsonValue(_createdAt),
        if (_updatedAt != null) "updatedAt": jsonValue(_updatedAt),
      };
}

/// JSON model for JavaScript SDK `types.VaultFolder`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class VaultFolder implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _parentId;
  String? get parentId => _parentId;
  final String? _createdAt;
  String get createdAt => _createdAt as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const VaultFolder(
      {required String id,
      required String name,
      String? parentId,
      required String createdAt})
      : _id = id,
        _name = name,
        _parentId = parentId,
        _createdAt = createdAt,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  VaultFolder.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _parentId =
            json["parentId"] == null ? null : json["parentId"] as String,
        _createdAt =
            json["createdAt"] == null ? null : json["createdAt"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        if (_parentId != null) "parentId": jsonValue(_parentId),
        "createdAt": jsonValue(_createdAt),
      };
}

/// JSON model for JavaScript SDK `types.VaultListResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class VaultListResponse implements JsonModel {
  final JsonMap? _originalJson;
  final List<VaultFile>? _files;
  List<VaultFile> get files => _files as List<VaultFile>;
  final List<VaultFolder>? _folders;
  List<VaultFolder> get folders => _folders as List<VaultFolder>;
  final num? _totalFiles;
  num get totalFiles => _totalFiles as num;
  final num? _totalSize;
  num get totalSize => _totalSize as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const VaultListResponse(
      {required List<VaultFile> files,
      required List<VaultFolder> folders,
      required num totalFiles,
      required num totalSize})
      : _files = files,
        _folders = folders,
        _totalFiles = totalFiles,
        _totalSize = totalSize,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  VaultListResponse.fromJson(JsonMap json)
      : _files = json["files"] == null
            ? null
            : (json["files"] as List<Object?>)
                .map((item) => VaultFile.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _folders = json["folders"] == null
            ? null
            : (json["folders"] as List<Object?>)
                .map((item) => VaultFolder.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _totalFiles =
            json["totalFiles"] == null ? null : json["totalFiles"] as num,
        _totalSize =
            json["totalSize"] == null ? null : json["totalSize"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "files": jsonValue(_files),
        "folders": jsonValue(_folders),
        "totalFiles": jsonValue(_totalFiles),
        "totalSize": jsonValue(_totalSize),
      };
}

/// JSON model for JavaScript SDK `types.VaultStats`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class VaultStats implements JsonModel {
  final JsonMap? _originalJson;
  final num? _totalFiles;
  num get totalFiles => _totalFiles as num;
  final num? _totalFolders;
  num get totalFolders => _totalFolders as num;
  final num? _totalSize;
  num get totalSize => _totalSize as num;
  final num? _usedQuota;
  num get usedQuota => _usedQuota as num;
  final num? _maxQuota;
  num get maxQuota => _maxQuota as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const VaultStats(
      {required num totalFiles,
      required num totalFolders,
      required num totalSize,
      required num usedQuota,
      required num maxQuota})
      : _totalFiles = totalFiles,
        _totalFolders = totalFolders,
        _totalSize = totalSize,
        _usedQuota = usedQuota,
        _maxQuota = maxQuota,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  VaultStats.fromJson(JsonMap json)
      : _totalFiles =
            json["totalFiles"] == null ? null : json["totalFiles"] as num,
        _totalFolders =
            json["totalFolders"] == null ? null : json["totalFolders"] as num,
        _totalSize =
            json["totalSize"] == null ? null : json["totalSize"] as num,
        _usedQuota =
            json["usedQuota"] == null ? null : json["usedQuota"] as num,
        _maxQuota = json["maxQuota"] == null ? null : json["maxQuota"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "totalFiles": jsonValue(_totalFiles),
        "totalFolders": jsonValue(_totalFolders),
        "totalSize": jsonValue(_totalSize),
        "usedQuota": jsonValue(_usedQuota),
        "maxQuota": jsonValue(_maxQuota),
      };
}

/// JSON model for JavaScript SDK `types.VaultUploadRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class VaultUploadRequest implements JsonModel {
  final JsonMap? _originalJson;
  final UploadFile? _file;
  UploadFile get file => _file as UploadFile;
  final String? _filename;
  String? get filename => _filename;
  final String? _userId;
  String get userId => _userId as String;
  final String? _folderId;
  String? get folderId => _folderId;
  final String? _accessMode;
  String? get accessMode => _accessMode;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const VaultUploadRequest(
      {required UploadFile file,
      String? filename,
      required String userId,
      String? folderId,
      String? accessMode})
      : _file = file,
        _filename = filename,
        _userId = userId,
        _folderId = folderId,
        _accessMode = accessMode,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  VaultUploadRequest.fromJson(JsonMap json)
      : _file = json["file"] == null
            ? null
            : json["file"] is UploadFile
                ? json["file"] as UploadFile
                : UploadFile((json["file"] as List<Object?>).cast<int>()),
        _filename =
            json["filename"] == null ? null : json["filename"] as String,
        _userId = json["userId"] == null ? null : json["userId"] as String,
        _folderId =
            json["folderId"] == null ? null : json["folderId"] as String,
        _accessMode =
            json["accessMode"] == null ? null : json["accessMode"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "file": jsonValue(_file),
        if (_filename != null) "filename": jsonValue(_filename),
        "userId": jsonValue(_userId),
        if (_folderId != null) "folderId": jsonValue(_folderId),
        if (_accessMode != null) "accessMode": jsonValue(_accessMode),
      };
}

/// JSON model for JavaScript SDK `types.SearchFilters`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SearchFilters implements JsonModel {
  final JsonMap? _originalJson;
  final String? _query;
  String? get query => _query;
  final List<String>? _eventTypes;
  List<String>? get eventTypes => _eventTypes;
  final List<String>? _eventSources;
  List<String>? get eventSources => _eventSources;
  final List<String>? _userIds;
  List<String>? get userIds => _userIds;
  final String? _status;
  String? get status => _status;
  final bool? _hasDocument;
  bool? get hasDocument => _hasDocument;
  final bool? _hasBlockchainProof;
  bool? get hasBlockchainProof => _hasBlockchainProof;
  final String? _fromDate;
  String? get fromDate => _fromDate;
  final String? _toDate;
  String? get toDate => _toDate;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SearchFilters(
      {String? query,
      List<String>? eventTypes,
      List<String>? eventSources,
      List<String>? userIds,
      String? status,
      bool? hasDocument,
      bool? hasBlockchainProof,
      String? fromDate,
      String? toDate})
      : _query = query,
        _eventTypes = eventTypes,
        _eventSources = eventSources,
        _userIds = userIds,
        _status = status,
        _hasDocument = hasDocument,
        _hasBlockchainProof = hasBlockchainProof,
        _fromDate = fromDate,
        _toDate = toDate,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SearchFilters.fromJson(JsonMap json)
      : _query = json["query"] == null ? null : json["query"] as String,
        _eventTypes = json["eventTypes"] == null
            ? null
            : (json["eventTypes"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _eventSources = json["eventSources"] == null
            ? null
            : (json["eventSources"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _userIds = json["userIds"] == null
            ? null
            : (json["userIds"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _status = json["status"] == null ? null : json["status"] as String,
        _hasDocument =
            json["hasDocument"] == null ? null : json["hasDocument"] as bool,
        _hasBlockchainProof = json["hasBlockchainProof"] == null
            ? null
            : json["hasBlockchainProof"] as bool,
        _fromDate =
            json["fromDate"] == null ? null : json["fromDate"] as String,
        _toDate = json["toDate"] == null ? null : json["toDate"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_query != null) "query": jsonValue(_query),
        if (_eventTypes != null) "eventTypes": jsonValue(_eventTypes),
        if (_eventSources != null) "eventSources": jsonValue(_eventSources),
        if (_userIds != null) "userIds": jsonValue(_userIds),
        if (_status != null) "status": jsonValue(_status),
        if (_hasDocument != null) "hasDocument": jsonValue(_hasDocument),
        if (_hasBlockchainProof != null)
          "hasBlockchainProof": jsonValue(_hasBlockchainProof),
        if (_fromDate != null) "fromDate": jsonValue(_fromDate),
        if (_toDate != null) "toDate": jsonValue(_toDate),
      };
}

/// JSON model for JavaScript SDK `types.SearchQueryRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SearchQueryRequest implements JsonModel {
  final JsonMap? _originalJson;
  final SearchFilters? _filters;
  SearchFilters? get filters => _filters;
  final num? _offset;
  num? get offset => _offset;
  final num? _limit;
  num? get limit => _limit;
  final bool? _includeData;
  bool? get includeData => _includeData;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SearchQueryRequest(
      {SearchFilters? filters, num? offset, num? limit, bool? includeData})
      : _filters = filters,
        _offset = offset,
        _limit = limit,
        _includeData = includeData,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SearchQueryRequest.fromJson(JsonMap json)
      : _filters = json["filters"] == null
            ? null
            : SearchFilters.fromJson(asJsonMap(json["filters"])),
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _includeData =
            json["includeData"] == null ? null : json["includeData"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_filters != null) "filters": jsonValue(_filters),
        if (_offset != null) "offset": jsonValue(_offset),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_includeData != null) "includeData": jsonValue(_includeData),
      };
}

/// JSON model for JavaScript SDK `types.SearchResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SearchResponse implements JsonModel {
  final JsonMap? _originalJson;
  final num? _total;
  num get total => _total as num;
  final num? _offset;
  num get offset => _offset as num;
  final num? _limit;
  num get limit => _limit as num;
  final List<Event>? _results;
  List<Event> get results => _results as List<Event>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SearchResponse(
      {required num total,
      required num offset,
      required num limit,
      required List<Event> results})
      : _total = total,
        _offset = offset,
        _limit = limit,
        _results = results,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SearchResponse.fromJson(JsonMap json)
      : _total = json["total"] == null ? null : json["total"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _results = json["results"] == null
            ? null
            : (json["results"] as List<Object?>)
                .map((item) => Event.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "total": jsonValue(_total),
        "offset": jsonValue(_offset),
        "limit": jsonValue(_limit),
        "results": jsonValue(_results),
      };
}

/// Pagination metadata returned by list endpoints (wire shape — snake_case).
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class PaginationMeta implements JsonModel {
  final JsonMap? _originalJson;
  final num? _total;
  num get total => _total as num;
  final num? _page;
  num get page => _page as num;
  final num? _page_size;
  num get page_size => _page_size as num;
  final num? _total_pages;
  num get total_pages => _total_pages as num;
  final bool? _has_next;
  bool get has_next => _has_next as bool;
  final bool? _has_prev;
  bool get has_prev => _has_prev as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const PaginationMeta(
      {required num total,
      required num page,
      required num page_size,
      required num total_pages,
      required bool has_next,
      required bool has_prev})
      : _total = total,
        _page = page,
        _page_size = page_size,
        _total_pages = total_pages,
        _has_next = has_next,
        _has_prev = has_prev,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  PaginationMeta.fromJson(JsonMap json)
      : _total = json["total"] == null ? null : json["total"] as num,
        _page = json["page"] == null ? null : json["page"] as num,
        _page_size =
            json["page_size"] == null ? null : json["page_size"] as num,
        _total_pages =
            json["total_pages"] == null ? null : json["total_pages"] as num,
        _has_next = json["has_next"] == null ? null : json["has_next"] as bool,
        _has_prev = json["has_prev"] == null ? null : json["has_prev"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "total": jsonValue(_total),
        "page": jsonValue(_page),
        "page_size": jsonValue(_page_size),
        "total_pages": jsonValue(_total_pages),
        "has_next": jsonValue(_has_next),
        "has_prev": jsonValue(_has_prev),
      };
}

/// A single event in a user's history (GET /search/by-user).
///
/// Wire shape is snake_case (the API does not camelCase its responses). FanScore
/// fields are best-effort: null when the event was not scored or falls outside the
/// FanScore lookup window.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserEventHistoryResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _event_type;
  String get event_type => _event_type as String;
  final String? _event_source;
  String get event_source => _event_source as String;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _status;
  String get status => _status as String;
  final String? _timestamp;

  /// ISO-8601 UTC. Results are ordered newest-first.
  String get timestamp => _timestamp as String;
  final bool? _has_blockchain_proof;
  bool get has_blockchain_proof => _has_blockchain_proof as bool;
  final String? _blockchain_tx_hash;
  String? get blockchain_tx_hash => _blockchain_tx_hash;
  final num? _fanscore_v_e;

  /// Per-event FanScore value (v_e).
  num? get fanscore_v_e => _fanscore_v_e;
  final num? _fanscore_event_score;

  /// The event's raw event score.
  num? get fanscore_event_score => _fanscore_event_score;
  final num? _fanscore_contribution;

  /// Contribution to the headline score = v_e × Σ(cohort weights for its activity).
  num? get fanscore_contribution => _fanscore_contribution;
  final String? _fanscore_cohort;

  /// Persona cohort this event's score lands in (e.g. "Tactician").
  String? get fanscore_cohort => _fanscore_cohort;
  final String? _fanscore_subject;

  /// Finer-grained subject tag within the cohort (e.g. "Predictions").
  String? get fanscore_subject => _fanscore_subject;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserEventHistoryResult(
      {required String id,
      required String event_type,
      required String event_source,
      required String user_id,
      required String status,
      required String timestamp,
      required bool has_blockchain_proof,
      required String? blockchain_tx_hash,
      required num? fanscore_v_e,
      required num? fanscore_event_score,
      required num? fanscore_contribution,
      required String? fanscore_cohort,
      required String? fanscore_subject})
      : _id = id,
        _event_type = event_type,
        _event_source = event_source,
        _user_id = user_id,
        _status = status,
        _timestamp = timestamp,
        _has_blockchain_proof = has_blockchain_proof,
        _blockchain_tx_hash = blockchain_tx_hash,
        _fanscore_v_e = fanscore_v_e,
        _fanscore_event_score = fanscore_event_score,
        _fanscore_contribution = fanscore_contribution,
        _fanscore_cohort = fanscore_cohort,
        _fanscore_subject = fanscore_subject,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserEventHistoryResult.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _event_type =
            json["event_type"] == null ? null : json["event_type"] as String,
        _event_source = json["event_source"] == null
            ? null
            : json["event_source"] as String,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _timestamp =
            json["timestamp"] == null ? null : json["timestamp"] as String,
        _has_blockchain_proof = json["has_blockchain_proof"] == null
            ? null
            : json["has_blockchain_proof"] as bool,
        _blockchain_tx_hash = json["blockchain_tx_hash"] == null
            ? null
            : json["blockchain_tx_hash"] as String,
        _fanscore_v_e =
            json["fanscore_v_e"] == null ? null : json["fanscore_v_e"] as num,
        _fanscore_event_score = json["fanscore_event_score"] == null
            ? null
            : json["fanscore_event_score"] as num,
        _fanscore_contribution = json["fanscore_contribution"] == null
            ? null
            : json["fanscore_contribution"] as num,
        _fanscore_cohort = json["fanscore_cohort"] == null
            ? null
            : json["fanscore_cohort"] as String,
        _fanscore_subject = json["fanscore_subject"] == null
            ? null
            : json["fanscore_subject"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "event_type": jsonValue(_event_type),
        "event_source": jsonValue(_event_source),
        "user_id": jsonValue(_user_id),
        "status": jsonValue(_status),
        "timestamp": jsonValue(_timestamp),
        "has_blockchain_proof": jsonValue(_has_blockchain_proof),
        "blockchain_tx_hash": jsonValue(_blockchain_tx_hash),
        "fanscore_v_e": jsonValue(_fanscore_v_e),
        "fanscore_event_score": jsonValue(_fanscore_event_score),
        "fanscore_contribution": jsonValue(_fanscore_contribution),
        "fanscore_cohort": jsonValue(_fanscore_cohort),
        "fanscore_subject": jsonValue(_fanscore_subject),
      };
}

/// Response for GET /search/by-user (user event history).
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserEventHistoryResponse implements JsonModel {
  final JsonMap? _originalJson;
  final List<UserEventHistoryResult>? _results;
  List<UserEventHistoryResult> get results =>
      _results as List<UserEventHistoryResult>;
  final num? _total;
  num get total => _total as num;
  final num? _offset;
  num get offset => _offset as num;
  final num? _limit;
  num get limit => _limit as num;
  final num? _query_time_ms;
  num get query_time_ms => _query_time_ms as num;
  final PaginationMeta? _pagination;
  PaginationMeta? get pagination => _pagination;
  final String? _retention_warning;

  /// Non-null when the window was served from the analytics archive rather than
  /// the hot tier. The note names the hot-tier horizon the server actually
  /// enforces — surface this string instead of restating the number, so the UI
  /// cannot drift from retention.
  String? get retention_warning => _retention_warning;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserEventHistoryResponse(
      {required List<UserEventHistoryResult> results,
      required num total,
      required num offset,
      required num limit,
      required num query_time_ms,
      required PaginationMeta? pagination,
      required String? retention_warning})
      : _results = results,
        _total = total,
        _offset = offset,
        _limit = limit,
        _query_time_ms = query_time_ms,
        _pagination = pagination,
        _retention_warning = retention_warning,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserEventHistoryResponse.fromJson(JsonMap json)
      : _results = json["results"] == null
            ? null
            : (json["results"] as List<Object?>)
                .map((item) => UserEventHistoryResult.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total = json["total"] == null ? null : json["total"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _query_time_ms =
            json["query_time_ms"] == null ? null : json["query_time_ms"] as num,
        _pagination = json["pagination"] == null
            ? null
            : PaginationMeta.fromJson(asJsonMap(json["pagination"])),
        _retention_warning = json["retention_warning"] == null
            ? null
            : json["retention_warning"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "results": jsonValue(_results),
        "total": jsonValue(_total),
        "offset": jsonValue(_offset),
        "limit": jsonValue(_limit),
        "query_time_ms": jsonValue(_query_time_ms),
        "pagination": jsonValue(_pagination),
        "retention_warning": jsonValue(_retention_warning),
      };
}

/// Options for SearchResource.byUser().
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserEventHistoryOptions implements JsonModel {
  final JsonMap? _originalJson;
  final num? _days;

  /// Lookback window in days (1–10). Default 3.
  /// The shortest windows are served from the hot tier (sub-100ms); anything
  /// past it serves the full `now-days, now` window from the analytics archive
  /// (a few hundred ms) and sets `retention_warning`. This endpoint is the
  /// archive-backed exception to the 30-day platform query cap — it stops at 10.
  num? get days => _days;
  final num? _limit;

  /// Page size (1–500, default 50).
  num? get limit => _limit;
  final num? _offset;

  /// Pagination offset (default 0).
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserEventHistoryOptions({num? days, num? limit, num? offset})
      : _days = days,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserEventHistoryOptions.fromJson(JsonMap json)
      : _days = json["days"] == null ? null : json["days"] as num,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_days != null) "days": jsonValue(_days),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `types.Facet`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Facet implements JsonModel {
  final JsonMap? _originalJson;
  final String? _key;
  String get key => _key as String;
  final num? _count;
  num get count => _count as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Facet({required String key, required num count})
      : _key = key,
        _count = count,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Facet.fromJson(JsonMap json)
      : _key = json["key"] == null ? null : json["key"] as String,
        _count = json["count"] == null ? null : json["count"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "key": jsonValue(_key),
        "count": jsonValue(_count),
      };
}

/// JSON model for JavaScript SDK `types.FacetsResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FacetsResponse implements JsonModel {
  final JsonMap? _originalJson;
  final List<Facet>? _eventTypes;
  List<Facet> get eventTypes => _eventTypes as List<Facet>;
  final List<Facet>? _eventSources;
  List<Facet> get eventSources => _eventSources as List<Facet>;
  final List<Facet>? _statuses;
  List<Facet> get statuses => _statuses as List<Facet>;
  final List<Facet>? _users;
  List<Facet> get users => _users as List<Facet>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FacetsResponse(
      {required List<Facet> eventTypes,
      required List<Facet> eventSources,
      required List<Facet> statuses,
      required List<Facet> users})
      : _eventTypes = eventTypes,
        _eventSources = eventSources,
        _statuses = statuses,
        _users = users,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FacetsResponse.fromJson(JsonMap json)
      : _eventTypes = json["eventTypes"] == null
            ? null
            : (json["eventTypes"] as List<Object?>)
                .map((item) => Facet.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _eventSources = json["eventSources"] == null
            ? null
            : (json["eventSources"] as List<Object?>)
                .map((item) => Facet.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _statuses = json["statuses"] == null
            ? null
            : (json["statuses"] as List<Object?>)
                .map((item) => Facet.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _users = json["users"] == null
            ? null
            : (json["users"] as List<Object?>)
                .map((item) => Facet.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "eventTypes": jsonValue(_eventTypes),
        "eventSources": jsonValue(_eventSources),
        "statuses": jsonValue(_statuses),
        "users": jsonValue(_users),
      };
}

/// JSON model for JavaScript SDK `types.SearchStats`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SearchStats implements JsonModel {
  final JsonMap? _originalJson;
  final num? _periodDays;
  num get periodDays => _periodDays as num;
  final num? _totalEvents;
  num get totalEvents => _totalEvents as num;
  final num? _uniqueUsers;
  num get uniqueUsers => _uniqueUsers as num;
  final num? _eventsPerDay;
  num get eventsPerDay => _eventsPerDay as num;
  final num? _totalStorageBytes;
  num get totalStorageBytes => _totalStorageBytes as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SearchStats(
      {required num periodDays,
      required num totalEvents,
      required num uniqueUsers,
      required num eventsPerDay,
      required num totalStorageBytes})
      : _periodDays = periodDays,
        _totalEvents = totalEvents,
        _uniqueUsers = uniqueUsers,
        _eventsPerDay = eventsPerDay,
        _totalStorageBytes = totalStorageBytes,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SearchStats.fromJson(JsonMap json)
      : _periodDays =
            json["periodDays"] == null ? null : json["periodDays"] as num,
        _totalEvents =
            json["totalEvents"] == null ? null : json["totalEvents"] as num,
        _uniqueUsers =
            json["uniqueUsers"] == null ? null : json["uniqueUsers"] as num,
        _eventsPerDay =
            json["eventsPerDay"] == null ? null : json["eventsPerDay"] as num,
        _totalStorageBytes = json["totalStorageBytes"] == null
            ? null
            : json["totalStorageBytes"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "periodDays": jsonValue(_periodDays),
        "totalEvents": jsonValue(_totalEvents),
        "uniqueUsers": jsonValue(_uniqueUsers),
        "eventsPerDay": jsonValue(_eventsPerDay),
        "totalStorageBytes": jsonValue(_totalStorageBytes),
      };
}

/// JSON model for JavaScript SDK `types.CertificateVerifyResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CertificateVerifyResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _certificateId;
  String get certificateId => _certificateId as String;
  final String? _status;
  String get status => _status as String;
  final String? _recipientName;
  String get recipientName => _recipientName as String;
  final String? _title;
  String get title => _title as String;
  final String? _issuedAt;
  String get issuedAt => _issuedAt as String;
  final String? _expiresAt;
  String? get expiresAt => _expiresAt;
  final String? _revokedAt;
  String? get revokedAt => _revokedAt;
  final String? _revocationReason;
  String? get revocationReason => _revocationReason;
  final String? _ipfsHash;
  String get ipfsHash => _ipfsHash as String;
  final String? _verifyUrl;
  String get verifyUrl => _verifyUrl as String;
  final Map<String, Object?>? _blockchain;
  Map<String, Object?>? get blockchain => _blockchain;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CertificateVerifyResult(
      {required String certificateId,
      required String status,
      required String recipientName,
      required String title,
      required String issuedAt,
      String? expiresAt,
      String? revokedAt,
      String? revocationReason,
      required String ipfsHash,
      required String verifyUrl,
      Map<String, Object?>? blockchain})
      : _certificateId = certificateId,
        _status = status,
        _recipientName = recipientName,
        _title = title,
        _issuedAt = issuedAt,
        _expiresAt = expiresAt,
        _revokedAt = revokedAt,
        _revocationReason = revocationReason,
        _ipfsHash = ipfsHash,
        _verifyUrl = verifyUrl,
        _blockchain = blockchain,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CertificateVerifyResult.fromJson(JsonMap json)
      : _certificateId = json["certificateId"] == null
            ? null
            : json["certificateId"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _recipientName = json["recipientName"] == null
            ? null
            : json["recipientName"] as String,
        _title = json["title"] == null ? null : json["title"] as String,
        _issuedAt =
            json["issuedAt"] == null ? null : json["issuedAt"] as String,
        _expiresAt =
            json["expiresAt"] == null ? null : json["expiresAt"] as String,
        _revokedAt =
            json["revokedAt"] == null ? null : json["revokedAt"] as String,
        _revocationReason = json["revocationReason"] == null
            ? null
            : json["revocationReason"] as String,
        _ipfsHash =
            json["ipfsHash"] == null ? null : json["ipfsHash"] as String,
        _verifyUrl =
            json["verifyUrl"] == null ? null : json["verifyUrl"] as String,
        _blockchain =
            json["blockchain"] == null ? null : asJsonMap(json["blockchain"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "certificateId": jsonValue(_certificateId),
        "status": jsonValue(_status),
        "recipientName": jsonValue(_recipientName),
        "title": jsonValue(_title),
        "issuedAt": jsonValue(_issuedAt),
        if (_expiresAt != null) "expiresAt": jsonValue(_expiresAt),
        if (_revokedAt != null) "revokedAt": jsonValue(_revokedAt),
        if (_revocationReason != null)
          "revocationReason": jsonValue(_revocationReason),
        "ipfsHash": jsonValue(_ipfsHash),
        "verifyUrl": jsonValue(_verifyUrl),
        if (_blockchain != null) "blockchain": jsonValue(_blockchain),
      };
}

/// JSON model for JavaScript SDK `types.ProofVerifyResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ProofVerifyResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _valid;
  bool get valid => _valid as bool;
  final String? _message;
  String get message => _message as String;
  final String? _verifiedAt;
  String get verifiedAt => _verifiedAt as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ProofVerifyResult(
      {required bool valid,
      required String message,
      required String verifiedAt})
      : _valid = valid,
        _message = message,
        _verifiedAt = verifiedAt,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ProofVerifyResult.fromJson(JsonMap json)
      : _valid = json["valid"] == null ? null : json["valid"] as bool,
        _message = json["message"] == null ? null : json["message"] as String,
        _verifiedAt =
            json["verifiedAt"] == null ? null : json["verifiedAt"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "valid": jsonValue(_valid),
        "message": jsonValue(_message),
        "verifiedAt": jsonValue(_verifiedAt),
      };
}

/// JSON model for JavaScript SDK `types.BatchVerifyResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class BatchVerifyResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _batchId;
  String get batchId => _batchId as String;
  final String? _merkleRoot;
  String get merkleRoot => _merkleRoot as String;
  final num? _totalEvents;
  num get totalEvents => _totalEvents as num;
  final String? _blockchainTx;
  String? get blockchainTx => _blockchainTx;
  final num? _blockNumber;
  num? get blockNumber => _blockNumber;
  final bool? _verified;
  bool get verified => _verified as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const BatchVerifyResult(
      {required String batchId,
      required String merkleRoot,
      required num totalEvents,
      String? blockchainTx,
      num? blockNumber,
      required bool verified})
      : _batchId = batchId,
        _merkleRoot = merkleRoot,
        _totalEvents = totalEvents,
        _blockchainTx = blockchainTx,
        _blockNumber = blockNumber,
        _verified = verified,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  BatchVerifyResult.fromJson(JsonMap json)
      : _batchId = json["batchId"] == null ? null : json["batchId"] as String,
        _merkleRoot =
            json["merkleRoot"] == null ? null : json["merkleRoot"] as String,
        _totalEvents =
            json["totalEvents"] == null ? null : json["totalEvents"] as num,
        _blockchainTx = json["blockchainTx"] == null
            ? null
            : json["blockchainTx"] as String,
        _blockNumber =
            json["blockNumber"] == null ? null : json["blockNumber"] as num,
        _verified = json["verified"] == null ? null : json["verified"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "batchId": jsonValue(_batchId),
        "merkleRoot": jsonValue(_merkleRoot),
        "totalEvents": jsonValue(_totalEvents),
        if (_blockchainTx != null) "blockchainTx": jsonValue(_blockchainTx),
        if (_blockNumber != null) "blockNumber": jsonValue(_blockNumber),
        "verified": jsonValue(_verified),
      };
}

/// JSON model for JavaScript SDK `types.EventBatchProof`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EventBatchProof implements JsonModel {
  final JsonMap? _originalJson;
  final String? _eventId;
  String get eventId => _eventId as String;
  final String? _certificateId;
  String get certificateId => _certificateId as String;
  final String? _batchId;
  String get batchId => _batchId as String;
  final num? _leafIndex;
  num get leafIndex => _leafIndex as num;
  final List<String>? _merkleProof;
  List<String> get merkleProof => _merkleProof as List<String>;
  final String? _merkleRoot;
  String get merkleRoot => _merkleRoot as String;
  final String? _blockchainTx;
  String? get blockchainTx => _blockchainTx;
  final bool? _verified;
  bool get verified => _verified as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EventBatchProof(
      {required String eventId,
      required String certificateId,
      required String batchId,
      required num leafIndex,
      required List<String> merkleProof,
      required String merkleRoot,
      String? blockchainTx,
      required bool verified})
      : _eventId = eventId,
        _certificateId = certificateId,
        _batchId = batchId,
        _leafIndex = leafIndex,
        _merkleProof = merkleProof,
        _merkleRoot = merkleRoot,
        _blockchainTx = blockchainTx,
        _verified = verified,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EventBatchProof.fromJson(JsonMap json)
      : _eventId = json["eventId"] == null ? null : json["eventId"] as String,
        _certificateId = json["certificateId"] == null
            ? null
            : json["certificateId"] as String,
        _batchId = json["batchId"] == null ? null : json["batchId"] as String,
        _leafIndex =
            json["leafIndex"] == null ? null : json["leafIndex"] as num,
        _merkleProof = json["merkleProof"] == null
            ? null
            : (json["merkleProof"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _merkleRoot =
            json["merkleRoot"] == null ? null : json["merkleRoot"] as String,
        _blockchainTx = json["blockchainTx"] == null
            ? null
            : json["blockchainTx"] as String,
        _verified = json["verified"] == null ? null : json["verified"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "eventId": jsonValue(_eventId),
        "certificateId": jsonValue(_certificateId),
        "batchId": jsonValue(_batchId),
        "leafIndex": jsonValue(_leafIndex),
        "merkleProof": jsonValue(_merkleProof),
        "merkleRoot": jsonValue(_merkleRoot),
        if (_blockchainTx != null) "blockchainTx": jsonValue(_blockchainTx),
        "verified": jsonValue(_verified),
      };
}

/// JSON model for JavaScript SDK `types.ApiKey`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ApiKey implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _keyPrefix;
  String get keyPrefix => _keyPrefix as String;
  final List<String>? _permissions;
  List<String> get permissions => _permissions as List<String>;
  final String? _createdAt;
  String get createdAt => _createdAt as String;
  final String? _lastUsedAt;
  String? get lastUsedAt => _lastUsedAt;
  final String? _expiresAt;
  String? get expiresAt => _expiresAt;
  final bool? _isActive;
  bool get isActive => _isActive as bool;
  final String? _key;
  String? get key => _key;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ApiKey(
      {required String id,
      required String name,
      required String keyPrefix,
      required List<String> permissions,
      required String createdAt,
      String? lastUsedAt,
      String? expiresAt,
      required bool isActive,
      String? key})
      : _id = id,
        _name = name,
        _keyPrefix = keyPrefix,
        _permissions = permissions,
        _createdAt = createdAt,
        _lastUsedAt = lastUsedAt,
        _expiresAt = expiresAt,
        _isActive = isActive,
        _key = key,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ApiKey.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _keyPrefix =
            json["keyPrefix"] == null ? null : json["keyPrefix"] as String,
        _permissions = json["permissions"] == null
            ? null
            : (json["permissions"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _createdAt =
            json["createdAt"] == null ? null : json["createdAt"] as String,
        _lastUsedAt =
            json["lastUsedAt"] == null ? null : json["lastUsedAt"] as String,
        _expiresAt =
            json["expiresAt"] == null ? null : json["expiresAt"] as String,
        _isActive = json["isActive"] == null ? null : json["isActive"] as bool,
        _key = json["key"] == null ? null : json["key"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "keyPrefix": jsonValue(_keyPrefix),
        "permissions": jsonValue(_permissions),
        "createdAt": jsonValue(_createdAt),
        if (_lastUsedAt != null) "lastUsedAt": jsonValue(_lastUsedAt),
        if (_expiresAt != null) "expiresAt": jsonValue(_expiresAt),
        "isActive": jsonValue(_isActive),
        if (_key != null) "key": jsonValue(_key),
      };
}

/// JSON model for JavaScript SDK `types.BlockchainStats`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class BlockchainStats implements JsonModel {
  final JsonMap? _originalJson;
  final num? _totalTransactions;
  num get totalTransactions => _totalTransactions as num;
  final num? _totalGasUsed;
  num get totalGasUsed => _totalGasUsed as num;
  final num? _totalEventsAttested;
  num get totalEventsAttested => _totalEventsAttested as num;
  final num? _pendingEvents;
  num get pendingEvents => _pendingEvents as num;
  final String? _lastTransaction;
  String? get lastTransaction => _lastTransaction;
  final String? _contractAddress;
  String? get contractAddress => _contractAddress;
  final num? _chainId;
  num get chainId => _chainId as num;
  final String? _chainName;
  String get chainName => _chainName as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const BlockchainStats(
      {required num totalTransactions,
      required num totalGasUsed,
      required num totalEventsAttested,
      required num pendingEvents,
      String? lastTransaction,
      String? contractAddress,
      required num chainId,
      required String chainName})
      : _totalTransactions = totalTransactions,
        _totalGasUsed = totalGasUsed,
        _totalEventsAttested = totalEventsAttested,
        _pendingEvents = pendingEvents,
        _lastTransaction = lastTransaction,
        _contractAddress = contractAddress,
        _chainId = chainId,
        _chainName = chainName,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  BlockchainStats.fromJson(JsonMap json)
      : _totalTransactions = json["totalTransactions"] == null
            ? null
            : json["totalTransactions"] as num,
        _totalGasUsed =
            json["totalGasUsed"] == null ? null : json["totalGasUsed"] as num,
        _totalEventsAttested = json["totalEventsAttested"] == null
            ? null
            : json["totalEventsAttested"] as num,
        _pendingEvents =
            json["pendingEvents"] == null ? null : json["pendingEvents"] as num,
        _lastTransaction = json["lastTransaction"] == null
            ? null
            : json["lastTransaction"] as String,
        _contractAddress = json["contractAddress"] == null
            ? null
            : json["contractAddress"] as String,
        _chainId = json["chainId"] == null ? null : json["chainId"] as num,
        _chainName =
            json["chainName"] == null ? null : json["chainName"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "totalTransactions": jsonValue(_totalTransactions),
        "totalGasUsed": jsonValue(_totalGasUsed),
        "totalEventsAttested": jsonValue(_totalEventsAttested),
        "pendingEvents": jsonValue(_pendingEvents),
        if (_lastTransaction != null)
          "lastTransaction": jsonValue(_lastTransaction),
        if (_contractAddress != null)
          "contractAddress": jsonValue(_contractAddress),
        "chainId": jsonValue(_chainId),
        "chainName": jsonValue(_chainName),
      };
}

/// JSON model for JavaScript SDK `types.BlockchainProof`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class BlockchainProof implements JsonModel {
  final JsonMap? _originalJson;
  final String? _certificateId;
  String get certificateId => _certificateId as String;
  final bool? _verified;
  bool get verified => _verified as bool;
  final String? _txHash;
  String? get txHash => _txHash;
  final num? _blockNumber;
  num? get blockNumber => _blockNumber;
  final String? _merkleRoot;
  String? get merkleRoot => _merkleRoot;
  final List<String>? _merkleProof;
  List<String>? get merkleProof => _merkleProof;
  final num? _leafIndex;
  num? get leafIndex => _leafIndex;
  final String? _chainName;
  String get chainName => _chainName as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const BlockchainProof(
      {required String certificateId,
      required bool verified,
      String? txHash,
      num? blockNumber,
      String? merkleRoot,
      List<String>? merkleProof,
      num? leafIndex,
      required String chainName})
      : _certificateId = certificateId,
        _verified = verified,
        _txHash = txHash,
        _blockNumber = blockNumber,
        _merkleRoot = merkleRoot,
        _merkleProof = merkleProof,
        _leafIndex = leafIndex,
        _chainName = chainName,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  BlockchainProof.fromJson(JsonMap json)
      : _certificateId = json["certificateId"] == null
            ? null
            : json["certificateId"] as String,
        _verified = json["verified"] == null ? null : json["verified"] as bool,
        _txHash = json["txHash"] == null ? null : json["txHash"] as String,
        _blockNumber =
            json["blockNumber"] == null ? null : json["blockNumber"] as num,
        _merkleRoot =
            json["merkleRoot"] == null ? null : json["merkleRoot"] as String,
        _merkleProof = json["merkleProof"] == null
            ? null
            : (json["merkleProof"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _leafIndex =
            json["leafIndex"] == null ? null : json["leafIndex"] as num,
        _chainName =
            json["chainName"] == null ? null : json["chainName"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "certificateId": jsonValue(_certificateId),
        "verified": jsonValue(_verified),
        if (_txHash != null) "txHash": jsonValue(_txHash),
        if (_blockNumber != null) "blockNumber": jsonValue(_blockNumber),
        if (_merkleRoot != null) "merkleRoot": jsonValue(_merkleRoot),
        if (_merkleProof != null) "merkleProof": jsonValue(_merkleProof),
        if (_leafIndex != null) "leafIndex": jsonValue(_leafIndex),
        "chainName": jsonValue(_chainName),
      };
}

/// JSON model for JavaScript SDK `types.CreateApiKeyRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateApiKeyRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final List<String>? _permissions;
  List<String>? get permissions => _permissions;
  final num? _expiresInDays;
  num? get expiresInDays => _expiresInDays;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateApiKeyRequest(
      {required String name, List<String>? permissions, num? expiresInDays})
      : _name = name,
        _permissions = permissions,
        _expiresInDays = expiresInDays,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateApiKeyRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _permissions = json["permissions"] == null
            ? null
            : (json["permissions"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _expiresInDays =
            json["expiresInDays"] == null ? null : json["expiresInDays"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        if (_permissions != null) "permissions": jsonValue(_permissions),
        if (_expiresInDays != null) "expiresInDays": jsonValue(_expiresInDays),
      };
}

/// JSON model for JavaScript SDK `passports.Passport`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Passport implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _wallet_address;
  String? get wallet_address => _wallet_address;
  final num? _level;
  num get level => _level as num;
  final num? _points;
  num get points => _points as num;
  final num? _experience;
  num get experience => _experience as num;
  final Map<String, Object?>? _traits;
  Map<String, Object?> get traits => _traits as Map<String, Object?>;
  final Map<String, Object?>? _custom_metadata;
  Map<String, Object?> get custom_metadata =>
      _custom_metadata as Map<String, Object?>;
  final String? _on_chain_token_id;
  String? get on_chain_token_id => _on_chain_token_id;
  final String? _on_chain_tx_hash;
  String? get on_chain_tx_hash => _on_chain_tx_hash;
  final String? _created_at;
  String get created_at => _created_at as String;
  final String? _last_updated_at;
  String get last_updated_at => _last_updated_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Passport(
      {required String id,
      required String tenant_id,
      required String user_id,
      String? wallet_address,
      required num level,
      required num points,
      required num experience,
      required Map<String, Object?> traits,
      required Map<String, Object?> custom_metadata,
      String? on_chain_token_id,
      String? on_chain_tx_hash,
      required String created_at,
      required String last_updated_at})
      : _id = id,
        _tenant_id = tenant_id,
        _user_id = user_id,
        _wallet_address = wallet_address,
        _level = level,
        _points = points,
        _experience = experience,
        _traits = traits,
        _custom_metadata = custom_metadata,
        _on_chain_token_id = on_chain_token_id,
        _on_chain_tx_hash = on_chain_tx_hash,
        _created_at = created_at,
        _last_updated_at = last_updated_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Passport.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _level = json["level"] == null ? null : json["level"] as num,
        _points = json["points"] == null ? null : json["points"] as num,
        _experience =
            json["experience"] == null ? null : json["experience"] as num,
        _traits = json["traits"] == null ? null : asJsonMap(json["traits"]),
        _custom_metadata = json["custom_metadata"] == null
            ? null
            : asJsonMap(json["custom_metadata"]),
        _on_chain_token_id = json["on_chain_token_id"] == null
            ? null
            : json["on_chain_token_id"] as String,
        _on_chain_tx_hash = json["on_chain_tx_hash"] == null
            ? null
            : json["on_chain_tx_hash"] as String,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _last_updated_at = json["last_updated_at"] == null
            ? null
            : json["last_updated_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "tenant_id": jsonValue(_tenant_id),
        "user_id": jsonValue(_user_id),
        if (_wallet_address != null)
          "wallet_address": jsonValue(_wallet_address),
        "level": jsonValue(_level),
        "points": jsonValue(_points),
        "experience": jsonValue(_experience),
        "traits": jsonValue(_traits),
        "custom_metadata": jsonValue(_custom_metadata),
        if (_on_chain_token_id != null)
          "on_chain_token_id": jsonValue(_on_chain_token_id),
        if (_on_chain_tx_hash != null)
          "on_chain_tx_hash": jsonValue(_on_chain_tx_hash),
        "created_at": jsonValue(_created_at),
        "last_updated_at": jsonValue(_last_updated_at),
      };
}

/// JSON model for JavaScript SDK `passports.PassportWithFields`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
///
/// Includes the fields and JSON serialization of [Passport].
class PassportWithFields extends Passport {
  final String? _template_id;
  String? get template_id => _template_id;
  final String? _template_name;
  String? get template_name => _template_name;
  final List<FieldValue>? _field_values;
  List<FieldValue> get field_values => _field_values as List<FieldValue>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const PassportWithFields(
      {required super.id,
      required super.tenant_id,
      required super.user_id,
      super.wallet_address,
      required super.level,
      required super.points,
      required super.experience,
      required super.traits,
      required super.custom_metadata,
      super.on_chain_token_id,
      super.on_chain_tx_hash,
      required super.created_at,
      required super.last_updated_at,
      String? template_id,
      String? template_name,
      required List<FieldValue> field_values})
      : _template_id = template_id,
        _template_name = template_name,
        _field_values = field_values;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  PassportWithFields.fromJson(JsonMap json)
      : _template_id =
            json["template_id"] == null ? null : json["template_id"] as String,
        _template_name = json["template_name"] == null
            ? null
            : json["template_name"] as String,
        _field_values = json["field_values"] == null
            ? null
            : (json["field_values"] as List<Object?>)
                .map((item) => FieldValue.fromJson(asJsonMap(item)))
                .toList(growable: false),
        super.fromJson(json);

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        ...super.toJson(),
        if (_template_id != null) "template_id": jsonValue(_template_id),
        if (_template_name != null) "template_name": jsonValue(_template_name),
        "field_values": jsonValue(_field_values),
      };
}

/// JSON model for JavaScript SDK `passports.FieldValue`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FieldValue implements JsonModel {
  final JsonMap? _originalJson;
  final String? _field_key;
  String get field_key => _field_key as String;
  final String? _field_name;
  String get field_name => _field_name as String;
  final Object? _value;
  Object? get value => _value;
  final String? _data_type;
  String get data_type => _data_type as String;
  final String? _computed_at;
  String? get computed_at => _computed_at;
  final bool? _manually_set;
  bool get manually_set => _manually_set as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FieldValue(
      {required String field_key,
      required String field_name,
      required Object? value,
      required String data_type,
      String? computed_at,
      required bool manually_set})
      : _field_key = field_key,
        _field_name = field_name,
        _value = value,
        _data_type = data_type,
        _computed_at = computed_at,
        _manually_set = manually_set,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FieldValue.fromJson(JsonMap json)
      : _field_key =
            json["field_key"] == null ? null : json["field_key"] as String,
        _field_name =
            json["field_name"] == null ? null : json["field_name"] as String,
        _value = json["value"],
        _data_type =
            json["data_type"] == null ? null : json["data_type"] as String,
        _computed_at =
            json["computed_at"] == null ? null : json["computed_at"] as String,
        _manually_set =
            json["manually_set"] == null ? null : json["manually_set"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "field_key": jsonValue(_field_key),
        "field_name": jsonValue(_field_name),
        "value": jsonValue(_value),
        "data_type": jsonValue(_data_type),
        if (_computed_at != null) "computed_at": jsonValue(_computed_at),
        "manually_set": jsonValue(_manually_set),
      };
}

/// JSON model for JavaScript SDK `passports.PassportTemplate`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class PassportTemplate implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _slug;
  String get slug => _slug as String;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final bool? _is_default;
  bool get is_default => _is_default as bool;
  final bool? _is_active;
  bool get is_active => _is_active as bool;
  final String? _created_at;
  String get created_at => _created_at as String;
  final String? _updated_at;
  String get updated_at => _updated_at as String;
  final List<TemplateField>? _fields;
  List<TemplateField> get fields => _fields as List<TemplateField>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const PassportTemplate(
      {required String id,
      required String tenant_id,
      required String name,
      String? description,
      required String slug,
      String? icon_url,
      required bool is_default,
      required bool is_active,
      required String created_at,
      required String updated_at,
      required List<TemplateField> fields})
      : _id = id,
        _tenant_id = tenant_id,
        _name = name,
        _description = description,
        _slug = slug,
        _icon_url = icon_url,
        _is_default = is_default,
        _is_active = is_active,
        _created_at = created_at,
        _updated_at = updated_at,
        _fields = fields,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  PassportTemplate.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _is_default =
            json["is_default"] == null ? null : json["is_default"] as bool,
        _is_active =
            json["is_active"] == null ? null : json["is_active"] as bool,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _updated_at =
            json["updated_at"] == null ? null : json["updated_at"] as String,
        _fields = json["fields"] == null
            ? null
            : (json["fields"] as List<Object?>)
                .map((item) => TemplateField.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "tenant_id": jsonValue(_tenant_id),
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        "slug": jsonValue(_slug),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        "is_default": jsonValue(_is_default),
        "is_active": jsonValue(_is_active),
        "created_at": jsonValue(_created_at),
        "updated_at": jsonValue(_updated_at),
        "fields": jsonValue(_fields),
      };
}

/// JSON model for JavaScript SDK `passports.TemplateField`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class TemplateField implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _template_id;
  String get template_id => _template_id as String;
  final String? _name;
  String get name => _name as String;
  final String? _field_key;
  String get field_key => _field_key as String;
  final String? _description;
  String? get description => _description;
  final String? _data_type;
  String get data_type => _data_type as String;
  final Object? _default_value;
  Object? get default_value => _default_value;
  final String? _formula;
  String? get formula => _formula;
  final String? _formula_type;
  String? get formula_type => _formula_type;
  final String? _aggregation;
  String? get aggregation => _aggregation;
  final Map<String, Object?>? _event_filter;
  Map<String, Object?>? get event_filter => _event_filter;
  final String? _display_format;
  String? get display_format => _display_format;
  final String? _icon;
  String? get icon => _icon;
  final String? _color;
  String? get color => _color;
  final num? _sort_order;
  num get sort_order => _sort_order as num;
  final bool? _is_visible;
  bool get is_visible => _is_visible as bool;
  final bool? _is_computed;
  bool get is_computed => _is_computed as bool;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const TemplateField(
      {required String id,
      required String template_id,
      required String name,
      required String field_key,
      String? description,
      required String data_type,
      Object? default_value,
      String? formula,
      String? formula_type,
      String? aggregation,
      Map<String, Object?>? event_filter,
      String? display_format,
      String? icon,
      String? color,
      required num sort_order,
      required bool is_visible,
      required bool is_computed,
      required String created_at})
      : _id = id,
        _template_id = template_id,
        _name = name,
        _field_key = field_key,
        _description = description,
        _data_type = data_type,
        _default_value = default_value,
        _formula = formula,
        _formula_type = formula_type,
        _aggregation = aggregation,
        _event_filter = event_filter,
        _display_format = display_format,
        _icon = icon,
        _color = color,
        _sort_order = sort_order,
        _is_visible = is_visible,
        _is_computed = is_computed,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  TemplateField.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _template_id =
            json["template_id"] == null ? null : json["template_id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _field_key =
            json["field_key"] == null ? null : json["field_key"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _data_type =
            json["data_type"] == null ? null : json["data_type"] as String,
        _default_value = json["default_value"],
        _formula = json["formula"] == null ? null : json["formula"] as String,
        _formula_type = json["formula_type"] == null
            ? null
            : json["formula_type"] as String,
        _aggregation =
            json["aggregation"] == null ? null : json["aggregation"] as String,
        _event_filter = json["event_filter"] == null
            ? null
            : asJsonMap(json["event_filter"]),
        _display_format = json["display_format"] == null
            ? null
            : json["display_format"] as String,
        _icon = json["icon"] == null ? null : json["icon"] as String,
        _color = json["color"] == null ? null : json["color"] as String,
        _sort_order =
            json["sort_order"] == null ? null : json["sort_order"] as num,
        _is_visible =
            json["is_visible"] == null ? null : json["is_visible"] as bool,
        _is_computed =
            json["is_computed"] == null ? null : json["is_computed"] as bool,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "template_id": jsonValue(_template_id),
        "name": jsonValue(_name),
        "field_key": jsonValue(_field_key),
        if (_description != null) "description": jsonValue(_description),
        "data_type": jsonValue(_data_type),
        if (_default_value != null) "default_value": jsonValue(_default_value),
        if (_formula != null) "formula": jsonValue(_formula),
        if (_formula_type != null) "formula_type": jsonValue(_formula_type),
        if (_aggregation != null) "aggregation": jsonValue(_aggregation),
        if (_event_filter != null) "event_filter": jsonValue(_event_filter),
        if (_display_format != null)
          "display_format": jsonValue(_display_format),
        if (_icon != null) "icon": jsonValue(_icon),
        if (_color != null) "color": jsonValue(_color),
        "sort_order": jsonValue(_sort_order),
        "is_visible": jsonValue(_is_visible),
        "is_computed": jsonValue(_is_computed),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `passports.Badge`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Badge implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final String? _badge_id;
  String get badge_id => _badge_id as String;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _rarity;
  String get rarity => _rarity as String;
  final Map<String, Object?>? _requirements;
  Map<String, Object?> get requirements =>
      _requirements as Map<String, Object?>;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Badge(
      {required String id,
      required String tenant_id,
      required String badge_id,
      required String name,
      String? description,
      String? icon_url,
      required String rarity,
      required Map<String, Object?> requirements,
      required String created_at})
      : _id = id,
        _tenant_id = tenant_id,
        _badge_id = badge_id,
        _name = name,
        _description = description,
        _icon_url = icon_url,
        _rarity = rarity,
        _requirements = requirements,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Badge.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _badge_id =
            json["badge_id"] == null ? null : json["badge_id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _rarity = json["rarity"] == null ? null : json["rarity"] as String,
        _requirements = json["requirements"] == null
            ? null
            : asJsonMap(json["requirements"]),
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "tenant_id": jsonValue(_tenant_id),
        "badge_id": jsonValue(_badge_id),
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        "rarity": jsonValue(_rarity),
        "requirements": jsonValue(_requirements),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `passports.Achievement`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Achievement implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final String? _achievement_id;
  String get achievement_id => _achievement_id as String;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _category;
  String? get category => _category;
  final num? _points_reward;
  num get points_reward => _points_reward as num;
  final Map<String, Object?>? _requirements;
  Map<String, Object?> get requirements =>
      _requirements as Map<String, Object?>;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Achievement(
      {required String id,
      required String tenant_id,
      required String achievement_id,
      required String name,
      String? description,
      String? category,
      required num points_reward,
      required Map<String, Object?> requirements,
      required String created_at})
      : _id = id,
        _tenant_id = tenant_id,
        _achievement_id = achievement_id,
        _name = name,
        _description = description,
        _category = category,
        _points_reward = points_reward,
        _requirements = requirements,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Achievement.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _achievement_id = json["achievement_id"] == null
            ? null
            : json["achievement_id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _points_reward =
            json["points_reward"] == null ? null : json["points_reward"] as num,
        _requirements = json["requirements"] == null
            ? null
            : asJsonMap(json["requirements"]),
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "tenant_id": jsonValue(_tenant_id),
        "achievement_id": jsonValue(_achievement_id),
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        if (_category != null) "category": jsonValue(_category),
        "points_reward": jsonValue(_points_reward),
        "requirements": jsonValue(_requirements),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `passports.UserBadge`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserBadge implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _passport_id;
  String get passport_id => _passport_id as String;
  final String? _badge_id;
  String get badge_id => _badge_id as String;
  final Badge? _badge;
  Badge get badge => _badge as Badge;
  final String? _earned_at;
  String get earned_at => _earned_at as String;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserBadge(
      {required String id,
      required String passport_id,
      required String badge_id,
      required Badge badge,
      required String earned_at,
      Map<String, Object?>? metadata})
      : _id = id,
        _passport_id = passport_id,
        _badge_id = badge_id,
        _badge = badge,
        _earned_at = earned_at,
        _metadata = metadata,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserBadge.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _passport_id =
            json["passport_id"] == null ? null : json["passport_id"] as String,
        _badge_id =
            json["badge_id"] == null ? null : json["badge_id"] as String,
        _badge = json["badge"] == null
            ? null
            : Badge.fromJson(asJsonMap(json["badge"])),
        _earned_at =
            json["earned_at"] == null ? null : json["earned_at"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "passport_id": jsonValue(_passport_id),
        "badge_id": jsonValue(_badge_id),
        "badge": jsonValue(_badge),
        "earned_at": jsonValue(_earned_at),
        if (_metadata != null) "metadata": jsonValue(_metadata),
      };
}

/// JSON model for JavaScript SDK `passports.UserAchievement`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserAchievement implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _passport_id;
  String get passport_id => _passport_id as String;
  final String? _achievement_id;
  String get achievement_id => _achievement_id as String;
  final Achievement? _achievement;
  Achievement get achievement => _achievement as Achievement;
  final String? _earned_at;
  String get earned_at => _earned_at as String;
  final num? _progress;
  num get progress => _progress as num;
  final bool? _completed;
  bool get completed => _completed as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserAchievement(
      {required String id,
      required String passport_id,
      required String achievement_id,
      required Achievement achievement,
      required String earned_at,
      required num progress,
      required bool completed})
      : _id = id,
        _passport_id = passport_id,
        _achievement_id = achievement_id,
        _achievement = achievement,
        _earned_at = earned_at,
        _progress = progress,
        _completed = completed,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserAchievement.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _passport_id =
            json["passport_id"] == null ? null : json["passport_id"] as String,
        _achievement_id = json["achievement_id"] == null
            ? null
            : json["achievement_id"] as String,
        _achievement = json["achievement"] == null
            ? null
            : Achievement.fromJson(asJsonMap(json["achievement"])),
        _earned_at =
            json["earned_at"] == null ? null : json["earned_at"] as String,
        _progress = json["progress"] == null ? null : json["progress"] as num,
        _completed =
            json["completed"] == null ? null : json["completed"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "passport_id": jsonValue(_passport_id),
        "achievement_id": jsonValue(_achievement_id),
        "achievement": jsonValue(_achievement),
        "earned_at": jsonValue(_earned_at),
        "progress": jsonValue(_progress),
        "completed": jsonValue(_completed),
      };
}

/// JSON model for JavaScript SDK `passports.PassportHistory`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class PassportHistory implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _passport_id;
  String get passport_id => _passport_id as String;
  final String? _event_type;
  String get event_type => _event_type as String;
  final Object? _old_value;
  Object? get old_value => _old_value;
  final Object? _new_value;
  Object? get new_value => _new_value;
  final String? _change_reason;
  String? get change_reason => _change_reason;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const PassportHistory(
      {required String id,
      required String passport_id,
      required String event_type,
      Object? old_value,
      Object? new_value,
      String? change_reason,
      required String created_at})
      : _id = id,
        _passport_id = passport_id,
        _event_type = event_type,
        _old_value = old_value,
        _new_value = new_value,
        _change_reason = change_reason,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  PassportHistory.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _passport_id =
            json["passport_id"] == null ? null : json["passport_id"] as String,
        _event_type =
            json["event_type"] == null ? null : json["event_type"] as String,
        _old_value = json["old_value"],
        _new_value = json["new_value"],
        _change_reason = json["change_reason"] == null
            ? null
            : json["change_reason"] as String,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "passport_id": jsonValue(_passport_id),
        "event_type": jsonValue(_event_type),
        if (_old_value != null) "old_value": jsonValue(_old_value),
        if (_new_value != null) "new_value": jsonValue(_new_value),
        if (_change_reason != null) "change_reason": jsonValue(_change_reason),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `passports.CreatePassportRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreatePassportRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _wallet_address;
  String? get wallet_address => _wallet_address;
  final num? _level;
  num? get level => _level;
  final num? _points;
  num? get points => _points;
  final num? _experience;
  num? get experience => _experience;
  final Map<String, Object?>? _traits;
  Map<String, Object?>? get traits => _traits;
  final Map<String, Object?>? _custom_metadata;
  Map<String, Object?>? get custom_metadata => _custom_metadata;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreatePassportRequest(
      {required String user_id,
      String? wallet_address,
      num? level,
      num? points,
      num? experience,
      Map<String, Object?>? traits,
      Map<String, Object?>? custom_metadata})
      : _user_id = user_id,
        _wallet_address = wallet_address,
        _level = level,
        _points = points,
        _experience = experience,
        _traits = traits,
        _custom_metadata = custom_metadata,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreatePassportRequest.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _level = json["level"] == null ? null : json["level"] as num,
        _points = json["points"] == null ? null : json["points"] as num,
        _experience =
            json["experience"] == null ? null : json["experience"] as num,
        _traits = json["traits"] == null ? null : asJsonMap(json["traits"]),
        _custom_metadata = json["custom_metadata"] == null
            ? null
            : asJsonMap(json["custom_metadata"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        if (_wallet_address != null)
          "wallet_address": jsonValue(_wallet_address),
        if (_level != null) "level": jsonValue(_level),
        if (_points != null) "points": jsonValue(_points),
        if (_experience != null) "experience": jsonValue(_experience),
        if (_traits != null) "traits": jsonValue(_traits),
        if (_custom_metadata != null)
          "custom_metadata": jsonValue(_custom_metadata),
      };
}

/// JSON model for JavaScript SDK `passports.UpdatePassportRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UpdatePassportRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_address;
  String? get wallet_address => _wallet_address;
  final num? _level;
  num? get level => _level;
  final num? _points;
  num? get points => _points;
  final num? _experience;
  num? get experience => _experience;
  final Map<String, Object?>? _traits;
  Map<String, Object?>? get traits => _traits;
  final Map<String, Object?>? _custom_metadata;
  Map<String, Object?>? get custom_metadata => _custom_metadata;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UpdatePassportRequest(
      {String? wallet_address,
      num? level,
      num? points,
      num? experience,
      Map<String, Object?>? traits,
      Map<String, Object?>? custom_metadata})
      : _wallet_address = wallet_address,
        _level = level,
        _points = points,
        _experience = experience,
        _traits = traits,
        _custom_metadata = custom_metadata,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UpdatePassportRequest.fromJson(JsonMap json)
      : _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _level = json["level"] == null ? null : json["level"] as num,
        _points = json["points"] == null ? null : json["points"] as num,
        _experience =
            json["experience"] == null ? null : json["experience"] as num,
        _traits = json["traits"] == null ? null : asJsonMap(json["traits"]),
        _custom_metadata = json["custom_metadata"] == null
            ? null
            : asJsonMap(json["custom_metadata"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_wallet_address != null)
          "wallet_address": jsonValue(_wallet_address),
        if (_level != null) "level": jsonValue(_level),
        if (_points != null) "points": jsonValue(_points),
        if (_experience != null) "experience": jsonValue(_experience),
        if (_traits != null) "traits": jsonValue(_traits),
        if (_custom_metadata != null)
          "custom_metadata": jsonValue(_custom_metadata),
      };
}

/// JSON model for JavaScript SDK `passports.CreateTemplateRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateTemplateRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _slug;
  String get slug => _slug as String;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final bool? _is_default;
  bool? get is_default => _is_default;
  final List<CreateTemplateFieldRequest>? _fields;
  List<CreateTemplateFieldRequest>? get fields => _fields;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateTemplateRequest(
      {required String name,
      String? description,
      required String slug,
      String? icon_url,
      bool? is_default,
      List<CreateTemplateFieldRequest>? fields})
      : _name = name,
        _description = description,
        _slug = slug,
        _icon_url = icon_url,
        _is_default = is_default,
        _fields = fields,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateTemplateRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _is_default =
            json["is_default"] == null ? null : json["is_default"] as bool,
        _fields = json["fields"] == null
            ? null
            : (json["fields"] as List<Object?>)
                .map((item) =>
                    CreateTemplateFieldRequest.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        "slug": jsonValue(_slug),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_is_default != null) "is_default": jsonValue(_is_default),
        if (_fields != null) "fields": jsonValue(_fields),
      };
}

/// JSON model for JavaScript SDK `passports.CreateTemplateFieldRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateTemplateFieldRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _field_key;
  String get field_key => _field_key as String;
  final String? _description;
  String? get description => _description;
  final String? _data_type;
  String? get data_type => _data_type;
  final Object? _default_value;
  Object? get default_value => _default_value;
  final String? _formula;
  String? get formula => _formula;
  final String? _formula_type;
  String? get formula_type => _formula_type;
  final String? _aggregation;
  String? get aggregation => _aggregation;
  final Map<String, Object?>? _event_filter;
  Map<String, Object?>? get event_filter => _event_filter;
  final String? _display_format;
  String? get display_format => _display_format;
  final String? _icon;
  String? get icon => _icon;
  final String? _color;
  String? get color => _color;
  final num? _sort_order;
  num? get sort_order => _sort_order;
  final bool? _is_visible;
  bool? get is_visible => _is_visible;
  final bool? _is_computed;
  bool? get is_computed => _is_computed;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateTemplateFieldRequest(
      {required String name,
      required String field_key,
      String? description,
      String? data_type,
      Object? default_value,
      String? formula,
      String? formula_type,
      String? aggregation,
      Map<String, Object?>? event_filter,
      String? display_format,
      String? icon,
      String? color,
      num? sort_order,
      bool? is_visible,
      bool? is_computed})
      : _name = name,
        _field_key = field_key,
        _description = description,
        _data_type = data_type,
        _default_value = default_value,
        _formula = formula,
        _formula_type = formula_type,
        _aggregation = aggregation,
        _event_filter = event_filter,
        _display_format = display_format,
        _icon = icon,
        _color = color,
        _sort_order = sort_order,
        _is_visible = is_visible,
        _is_computed = is_computed,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateTemplateFieldRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _field_key =
            json["field_key"] == null ? null : json["field_key"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _data_type =
            json["data_type"] == null ? null : json["data_type"] as String,
        _default_value = json["default_value"],
        _formula = json["formula"] == null ? null : json["formula"] as String,
        _formula_type = json["formula_type"] == null
            ? null
            : json["formula_type"] as String,
        _aggregation =
            json["aggregation"] == null ? null : json["aggregation"] as String,
        _event_filter = json["event_filter"] == null
            ? null
            : asJsonMap(json["event_filter"]),
        _display_format = json["display_format"] == null
            ? null
            : json["display_format"] as String,
        _icon = json["icon"] == null ? null : json["icon"] as String,
        _color = json["color"] == null ? null : json["color"] as String,
        _sort_order =
            json["sort_order"] == null ? null : json["sort_order"] as num,
        _is_visible =
            json["is_visible"] == null ? null : json["is_visible"] as bool,
        _is_computed =
            json["is_computed"] == null ? null : json["is_computed"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        "field_key": jsonValue(_field_key),
        if (_description != null) "description": jsonValue(_description),
        if (_data_type != null) "data_type": jsonValue(_data_type),
        if (_default_value != null) "default_value": jsonValue(_default_value),
        if (_formula != null) "formula": jsonValue(_formula),
        if (_formula_type != null) "formula_type": jsonValue(_formula_type),
        if (_aggregation != null) "aggregation": jsonValue(_aggregation),
        if (_event_filter != null) "event_filter": jsonValue(_event_filter),
        if (_display_format != null)
          "display_format": jsonValue(_display_format),
        if (_icon != null) "icon": jsonValue(_icon),
        if (_color != null) "color": jsonValue(_color),
        if (_sort_order != null) "sort_order": jsonValue(_sort_order),
        if (_is_visible != null) "is_visible": jsonValue(_is_visible),
        if (_is_computed != null) "is_computed": jsonValue(_is_computed),
      };
}

/// JSON model for JavaScript SDK `passports.CreateBadgeRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateBadgeRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _badge_id;
  String get badge_id => _badge_id as String;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _rarity;
  String? get rarity => _rarity;
  final Map<String, Object?>? _requirements;
  Map<String, Object?>? get requirements => _requirements;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateBadgeRequest(
      {required String badge_id,
      required String name,
      String? description,
      String? icon_url,
      String? rarity,
      Map<String, Object?>? requirements})
      : _badge_id = badge_id,
        _name = name,
        _description = description,
        _icon_url = icon_url,
        _rarity = rarity,
        _requirements = requirements,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateBadgeRequest.fromJson(JsonMap json)
      : _badge_id =
            json["badge_id"] == null ? null : json["badge_id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _rarity = json["rarity"] == null ? null : json["rarity"] as String,
        _requirements = json["requirements"] == null
            ? null
            : asJsonMap(json["requirements"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "badge_id": jsonValue(_badge_id),
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_rarity != null) "rarity": jsonValue(_rarity),
        if (_requirements != null) "requirements": jsonValue(_requirements),
      };
}

/// JSON model for JavaScript SDK `passports.CreateAchievementRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateAchievementRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _achievement_id;
  String get achievement_id => _achievement_id as String;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _category;
  String? get category => _category;
  final num? _points_reward;
  num? get points_reward => _points_reward;
  final Map<String, Object?>? _requirements;
  Map<String, Object?>? get requirements => _requirements;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateAchievementRequest(
      {required String achievement_id,
      required String name,
      String? description,
      String? category,
      num? points_reward,
      Map<String, Object?>? requirements})
      : _achievement_id = achievement_id,
        _name = name,
        _description = description,
        _category = category,
        _points_reward = points_reward,
        _requirements = requirements,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateAchievementRequest.fromJson(JsonMap json)
      : _achievement_id = json["achievement_id"] == null
            ? null
            : json["achievement_id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _points_reward =
            json["points_reward"] == null ? null : json["points_reward"] as num,
        _requirements = json["requirements"] == null
            ? null
            : asJsonMap(json["requirements"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "achievement_id": jsonValue(_achievement_id),
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        if (_category != null) "category": jsonValue(_category),
        if (_points_reward != null) "points_reward": jsonValue(_points_reward),
        if (_requirements != null) "requirements": jsonValue(_requirements),
      };
}

/// JSON model for JavaScript SDK `passports.ListOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListOptions implements JsonModel {
  final JsonMap? _originalJson;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListOptions({num? limit, num? offset})
      : _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListOptions.fromJson(JsonMap json)
      : _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `passports.PassportV2Data`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class PassportV2Data implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final PassportDefinition? _passport;
  PassportDefinition get passport => _passport as PassportDefinition;
  final Map<String, PassportFieldValue>? _data;
  Map<String, PassportFieldValue> get data =>
      _data as Map<String, PassportFieldValue>;
  final List<Milestone>? _milestones;
  List<Milestone> get milestones => _milestones as List<Milestone>;
  final String? _generated_at;
  String get generated_at => _generated_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const PassportV2Data(
      {required String user_id,
      required PassportDefinition passport,
      required Map<String, PassportFieldValue> data,
      required List<Milestone> milestones,
      required String generated_at})
      : _user_id = user_id,
        _passport = passport,
        _data = data,
        _milestones = milestones,
        _generated_at = generated_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  PassportV2Data.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _passport = json["passport"] == null
            ? null
            : PassportDefinition.fromJson(asJsonMap(json["passport"])),
        _data = json["data"] == null
            ? null
            : asJsonMap(json["data"]).map((key, value) =>
                MapEntry(key, PassportFieldValue.fromJson(asJsonMap(value)))),
        _milestones = json["milestones"] == null
            ? null
            : (json["milestones"] as List<Object?>)
                .map((item) => Milestone.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _generated_at = json["generated_at"] == null
            ? null
            : json["generated_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "passport": jsonValue(_passport),
        "data": jsonValue(_data),
        "milestones": jsonValue(_milestones),
        "generated_at": jsonValue(_generated_at),
      };
}

/// JSON model for JavaScript SDK `passports.PassportFieldValue`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class PassportFieldValue implements JsonModel {
  final JsonMap? _originalJson;
  final String? _label;
  String get label => _label as String;
  final Object? _value;
  Object? get value => _value;
  final String? _format;
  String? get format => _format;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const PassportFieldValue(
      {required String label, required Object? value, String? format})
      : _label = label,
        _value = value,
        _format = format,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  PassportFieldValue.fromJson(JsonMap json)
      : _label = json["label"] == null ? null : json["label"] as String,
        _value = json["value"],
        _format = json["format"] == null ? null : json["format"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "label": jsonValue(_label),
        "value": jsonValue(_value),
        if (_format != null) "format": jsonValue(_format),
      };
}

/// JSON model for JavaScript SDK `passports.PassportDefinition`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class PassportDefinition implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _slug;
  String? get slug => _slug;
  final String? _data_view_id;
  String? get data_view_id => _data_view_id;
  final String? _data_view_name;
  String? get data_view_name => _data_view_name;
  final List<String>? _display_columns;
  List<String> get display_columns => _display_columns as List<String>;
  final Map<String, String>? _column_labels;
  Map<String, String> get column_labels =>
      _column_labels as Map<String, String>;
  final Map<String, String>? _column_formats;
  Map<String, String> get column_formats =>
      _column_formats as Map<String, String>;
  final bool? _is_default;
  bool get is_default => _is_default as bool;
  final bool? _is_active;
  bool get is_active => _is_active as bool;
  final bool? _is_public;
  bool get is_public => _is_public as bool;
  final String? _created_at;
  String get created_at => _created_at as String;
  final num? _threshold_count;
  num get threshold_count => _threshold_count as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const PassportDefinition(
      {required String id,
      required String tenant_id,
      required String name,
      String? description,
      String? slug,
      String? data_view_id,
      String? data_view_name,
      required List<String> display_columns,
      required Map<String, String> column_labels,
      required Map<String, String> column_formats,
      required bool is_default,
      required bool is_active,
      required bool is_public,
      required String created_at,
      required num threshold_count})
      : _id = id,
        _tenant_id = tenant_id,
        _name = name,
        _description = description,
        _slug = slug,
        _data_view_id = data_view_id,
        _data_view_name = data_view_name,
        _display_columns = display_columns,
        _column_labels = column_labels,
        _column_formats = column_formats,
        _is_default = is_default,
        _is_active = is_active,
        _is_public = is_public,
        _created_at = created_at,
        _threshold_count = threshold_count,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  PassportDefinition.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _data_view_id = json["data_view_id"] == null
            ? null
            : json["data_view_id"] as String,
        _data_view_name = json["data_view_name"] == null
            ? null
            : json["data_view_name"] as String,
        _display_columns = json["display_columns"] == null
            ? null
            : (json["display_columns"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _column_labels = json["column_labels"] == null
            ? null
            : asJsonMap(json["column_labels"])
                .map((key, value) => MapEntry(key, value as String)),
        _column_formats = json["column_formats"] == null
            ? null
            : asJsonMap(json["column_formats"])
                .map((key, value) => MapEntry(key, value as String)),
        _is_default =
            json["is_default"] == null ? null : json["is_default"] as bool,
        _is_active =
            json["is_active"] == null ? null : json["is_active"] as bool,
        _is_public =
            json["is_public"] == null ? null : json["is_public"] as bool,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _threshold_count = json["threshold_count"] == null
            ? null
            : json["threshold_count"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "tenant_id": jsonValue(_tenant_id),
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        if (_slug != null) "slug": jsonValue(_slug),
        if (_data_view_id != null) "data_view_id": jsonValue(_data_view_id),
        if (_data_view_name != null)
          "data_view_name": jsonValue(_data_view_name),
        "display_columns": jsonValue(_display_columns),
        "column_labels": jsonValue(_column_labels),
        "column_formats": jsonValue(_column_formats),
        "is_default": jsonValue(_is_default),
        "is_active": jsonValue(_is_active),
        "is_public": jsonValue(_is_public),
        "created_at": jsonValue(_created_at),
        "threshold_count": jsonValue(_threshold_count),
      };
}

/// JSON model for JavaScript SDK `passports.Milestone`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Milestone implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _milestone_type;
  String get milestone_type => _milestone_type as String;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _badge_color;
  String? get badge_color => _badge_color;
  final num? _points_reward;
  num get points_reward => _points_reward as num;
  final String? _triggered_at;
  String get triggered_at => _triggered_at as String;
  final Object? _value_at_trigger;
  Object? get value_at_trigger => _value_at_trigger;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Milestone(
      {required String id,
      required String name,
      String? description,
      required String milestone_type,
      String? icon_url,
      String? badge_color,
      required num points_reward,
      required String triggered_at,
      Object? value_at_trigger})
      : _id = id,
        _name = name,
        _description = description,
        _milestone_type = milestone_type,
        _icon_url = icon_url,
        _badge_color = badge_color,
        _points_reward = points_reward,
        _triggered_at = triggered_at,
        _value_at_trigger = value_at_trigger,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Milestone.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _milestone_type = json["milestone_type"] == null
            ? null
            : json["milestone_type"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _badge_color =
            json["badge_color"] == null ? null : json["badge_color"] as String,
        _points_reward =
            json["points_reward"] == null ? null : json["points_reward"] as num,
        _triggered_at = json["triggered_at"] == null
            ? null
            : json["triggered_at"] as String,
        _value_at_trigger = json["value_at_trigger"],
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        "milestone_type": jsonValue(_milestone_type),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_badge_color != null) "badge_color": jsonValue(_badge_color),
        "points_reward": jsonValue(_points_reward),
        "triggered_at": jsonValue(_triggered_at),
        if (_value_at_trigger != null)
          "value_at_trigger": jsonValue(_value_at_trigger),
      };
}

/// JSON model for JavaScript SDK `passports.AvailableView`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class AvailableView implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _view_name;
  String get view_name => _view_name as String;
  final String? _description;
  String? get description => _description;
  final bool? _is_builtin;
  bool get is_builtin => _is_builtin as bool;
  final bool? _is_custom_computation;
  bool? get is_custom_computation => _is_custom_computation;
  final String? _view_type;
  String? get view_type => _view_type;
  final List<ViewColumn>? _columns;
  List<ViewColumn> get columns => _columns as List<ViewColumn>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const AvailableView(
      {required String id,
      required String name,
      required String view_name,
      String? description,
      required bool is_builtin,
      bool? is_custom_computation,
      String? view_type,
      required List<ViewColumn> columns})
      : _id = id,
        _name = name,
        _view_name = view_name,
        _description = description,
        _is_builtin = is_builtin,
        _is_custom_computation = is_custom_computation,
        _view_type = view_type,
        _columns = columns,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  AvailableView.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _view_name =
            json["view_name"] == null ? null : json["view_name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _is_builtin =
            json["is_builtin"] == null ? null : json["is_builtin"] as bool,
        _is_custom_computation = json["is_custom_computation"] == null
            ? null
            : json["is_custom_computation"] as bool,
        _view_type =
            json["view_type"] == null ? null : json["view_type"] as String,
        _columns = json["columns"] == null
            ? null
            : (json["columns"] as List<Object?>)
                .map((item) => ViewColumn.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "view_name": jsonValue(_view_name),
        if (_description != null) "description": jsonValue(_description),
        "is_builtin": jsonValue(_is_builtin),
        if (_is_custom_computation != null)
          "is_custom_computation": jsonValue(_is_custom_computation),
        if (_view_type != null) "view_type": jsonValue(_view_type),
        "columns": jsonValue(_columns),
      };
}

/// JSON model for JavaScript SDK `passports.ViewColumn`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ViewColumn implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _type;
  String get type => _type as String;
  final String? _computation_type;
  String? get computation_type => _computation_type;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ViewColumn(
      {required String name, required String type, String? computation_type})
      : _name = name,
        _type = type,
        _computation_type = computation_type,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ViewColumn.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _type = json["type"] == null ? null : json["type"] as String,
        _computation_type = json["computation_type"] == null
            ? null
            : json["computation_type"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        "type": jsonValue(_type),
        if (_computation_type != null)
          "computation_type": jsonValue(_computation_type),
      };
}

/// JSON model for JavaScript SDK `passports.CreatePassportDefinitionRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreatePassportDefinitionRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _slug;
  String? get slug => _slug;
  final String? _data_view_id;
  String? get data_view_id => _data_view_id;
  final List<String>? _display_columns;
  List<String>? get display_columns => _display_columns;
  final Map<String, String>? _column_labels;
  Map<String, String>? get column_labels => _column_labels;
  final Map<String, String>? _column_formats;
  Map<String, String>? get column_formats => _column_formats;
  final bool? _is_default;
  bool? get is_default => _is_default;
  final bool? _is_public;
  bool? get is_public => _is_public;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreatePassportDefinitionRequest(
      {required String name,
      String? description,
      String? slug,
      String? data_view_id,
      List<String>? display_columns,
      Map<String, String>? column_labels,
      Map<String, String>? column_formats,
      bool? is_default,
      bool? is_public})
      : _name = name,
        _description = description,
        _slug = slug,
        _data_view_id = data_view_id,
        _display_columns = display_columns,
        _column_labels = column_labels,
        _column_formats = column_formats,
        _is_default = is_default,
        _is_public = is_public,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreatePassportDefinitionRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _data_view_id = json["data_view_id"] == null
            ? null
            : json["data_view_id"] as String,
        _display_columns = json["display_columns"] == null
            ? null
            : (json["display_columns"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _column_labels = json["column_labels"] == null
            ? null
            : asJsonMap(json["column_labels"])
                .map((key, value) => MapEntry(key, value as String)),
        _column_formats = json["column_formats"] == null
            ? null
            : asJsonMap(json["column_formats"])
                .map((key, value) => MapEntry(key, value as String)),
        _is_default =
            json["is_default"] == null ? null : json["is_default"] as bool,
        _is_public =
            json["is_public"] == null ? null : json["is_public"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        if (_slug != null) "slug": jsonValue(_slug),
        if (_data_view_id != null) "data_view_id": jsonValue(_data_view_id),
        if (_display_columns != null)
          "display_columns": jsonValue(_display_columns),
        if (_column_labels != null) "column_labels": jsonValue(_column_labels),
        if (_column_formats != null)
          "column_formats": jsonValue(_column_formats),
        if (_is_default != null) "is_default": jsonValue(_is_default),
        if (_is_public != null) "is_public": jsonValue(_is_public),
      };
}

/// JSON model for JavaScript SDK `wallets.Wallet`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Wallet implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_id;
  String get wallet_id => _wallet_id as String;
  final String? _address;
  String get address => _address as String;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _wallet_type;
  String get wallet_type => _wallet_type as String;
  final String? _network;
  String get network => _network as String;
  final String? _name;
  String? get name => _name;
  final String? _status;
  String get status => _status as String;
  final String? _created_at;
  String get created_at => _created_at as String;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;
  final bool? _supports_export;
  bool? get supports_export => _supports_export;
  final String? _owner_wallet_id;
  String? get owner_wallet_id => _owner_wallet_id;
  final bool? _is_deployed;
  bool? get is_deployed => _is_deployed;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Wallet(
      {required String wallet_id,
      required String address,
      required String user_id,
      required String wallet_type,
      required String network,
      String? name,
      required String status,
      required String created_at,
      Map<String, Object?>? metadata,
      bool? supports_export,
      String? owner_wallet_id,
      bool? is_deployed})
      : _wallet_id = wallet_id,
        _address = address,
        _user_id = user_id,
        _wallet_type = wallet_type,
        _network = network,
        _name = name,
        _status = status,
        _created_at = created_at,
        _metadata = metadata,
        _supports_export = supports_export,
        _owner_wallet_id = owner_wallet_id,
        _is_deployed = is_deployed,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Wallet.fromJson(JsonMap json)
      : _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _address = json["address"] == null ? null : json["address"] as String,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _wallet_type =
            json["wallet_type"] == null ? null : json["wallet_type"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _supports_export = json["supports_export"] == null
            ? null
            : json["supports_export"] as bool,
        _owner_wallet_id = json["owner_wallet_id"] == null
            ? null
            : json["owner_wallet_id"] as String,
        _is_deployed =
            json["is_deployed"] == null ? null : json["is_deployed"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_id": jsonValue(_wallet_id),
        "address": jsonValue(_address),
        "user_id": jsonValue(_user_id),
        "wallet_type": jsonValue(_wallet_type),
        "network": jsonValue(_network),
        if (_name != null) "name": jsonValue(_name),
        "status": jsonValue(_status),
        "created_at": jsonValue(_created_at),
        if (_metadata != null) "metadata": jsonValue(_metadata),
        if (_supports_export != null)
          "supports_export": jsonValue(_supports_export),
        if (_owner_wallet_id != null)
          "owner_wallet_id": jsonValue(_owner_wallet_id),
        if (_is_deployed != null) "is_deployed": jsonValue(_is_deployed),
      };
}

/// JSON model for JavaScript SDK `wallets.DualWallets`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DualWallets implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final Wallet? _asset_wallet;
  Wallet get asset_wallet => _asset_wallet as Wallet;
  final Wallet? _smart_wallet;
  Wallet get smart_wallet => _smart_wallet as Wallet;
  final String? _network;
  String get network => _network as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DualWallets(
      {required String user_id,
      required Wallet asset_wallet,
      required Wallet smart_wallet,
      required String network})
      : _user_id = user_id,
        _asset_wallet = asset_wallet,
        _smart_wallet = smart_wallet,
        _network = network,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DualWallets.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _asset_wallet = json["asset_wallet"] == null
            ? null
            : Wallet.fromJson(asJsonMap(json["asset_wallet"])),
        _smart_wallet = json["smart_wallet"] == null
            ? null
            : Wallet.fromJson(asJsonMap(json["smart_wallet"])),
        _network = json["network"] == null ? null : json["network"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "asset_wallet": jsonValue(_asset_wallet),
        "smart_wallet": jsonValue(_smart_wallet),
        "network": jsonValue(_network),
      };
}

/// JSON model for JavaScript SDK `wallets.WalletBalance`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class WalletBalance implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_id;
  String get wallet_id => _wallet_id as String;
  final String? _address;
  String get address => _address as String;
  final String? _network;
  String get network => _network as String;
  final List<TokenBalance>? _balances;
  List<TokenBalance> get balances => _balances as List<TokenBalance>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const WalletBalance(
      {required String wallet_id,
      required String address,
      required String network,
      required List<TokenBalance> balances})
      : _wallet_id = wallet_id,
        _address = address,
        _network = network,
        _balances = balances,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  WalletBalance.fromJson(JsonMap json)
      : _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _address = json["address"] == null ? null : json["address"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _balances = json["balances"] == null
            ? null
            : (json["balances"] as List<Object?>)
                .map((item) => TokenBalance.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_id": jsonValue(_wallet_id),
        "address": jsonValue(_address),
        "network": jsonValue(_network),
        "balances": jsonValue(_balances),
      };
}

/// JSON model for JavaScript SDK `wallets.TokenBalance`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class TokenBalance implements JsonModel {
  final JsonMap? _originalJson;
  final String? _token;
  String get token => _token as String;
  final String? _symbol;
  String get symbol => _symbol as String;
  final String? _balance;
  String get balance => _balance as String;
  final num? _decimals;
  num get decimals => _decimals as num;
  final num? _usd_value;
  num? get usd_value => _usd_value;
  final String? _raw_balance;
  String? get raw_balance => _raw_balance;
  final String? _contract_address;
  String? get contract_address => _contract_address;
  final String? _name;
  String? get name => _name;
  final String? _logo_url;
  String? get logo_url => _logo_url;
  final String? _source;
  String get source => _source as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const TokenBalance(
      {required String token,
      required String symbol,
      required String balance,
      required num decimals,
      num? usd_value,
      String? raw_balance,
      String? contract_address,
      String? name,
      String? logo_url,
      required String source})
      : _token = token,
        _symbol = symbol,
        _balance = balance,
        _decimals = decimals,
        _usd_value = usd_value,
        _raw_balance = raw_balance,
        _contract_address = contract_address,
        _name = name,
        _logo_url = logo_url,
        _source = source,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  TokenBalance.fromJson(JsonMap json)
      : _token = json["token"] == null ? null : json["token"] as String,
        _symbol = json["symbol"] == null ? null : json["symbol"] as String,
        _balance = json["balance"] == null ? null : json["balance"] as String,
        _decimals = json["decimals"] == null ? null : json["decimals"] as num,
        _usd_value =
            json["usd_value"] == null ? null : json["usd_value"] as num,
        _raw_balance =
            json["raw_balance"] == null ? null : json["raw_balance"] as String,
        _contract_address = json["contract_address"] == null
            ? null
            : json["contract_address"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _logo_url =
            json["logo_url"] == null ? null : json["logo_url"] as String,
        _source = json["source"] == null ? null : json["source"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "token": jsonValue(_token),
        "symbol": jsonValue(_symbol),
        "balance": jsonValue(_balance),
        "decimals": jsonValue(_decimals),
        if (_usd_value != null) "usd_value": jsonValue(_usd_value),
        if (_raw_balance != null) "raw_balance": jsonValue(_raw_balance),
        if (_contract_address != null)
          "contract_address": jsonValue(_contract_address),
        if (_name != null) "name": jsonValue(_name),
        if (_logo_url != null) "logo_url": jsonValue(_logo_url),
        "source": jsonValue(_source),
      };
}

/// JSON model for JavaScript SDK `wallets.NFT`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class NFT implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _wallet_id;
  String get wallet_id => _wallet_id as String;
  final String? _contract_address;
  String get contract_address => _contract_address as String;
  final String? _token_id;
  String get token_id => _token_id as String;
  final String? _network;
  String get network => _network as String;
  final String? _name;
  String? get name => _name;
  final String? _description;
  String? get description => _description;
  final String? _image_url;
  String? get image_url => _image_url;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;
  final String? _source;
  String get source => _source as String;
  final String? _acquired_at;
  String get acquired_at => _acquired_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const NFT(
      {required String id,
      required String wallet_id,
      required String contract_address,
      required String token_id,
      required String network,
      String? name,
      String? description,
      String? image_url,
      Map<String, Object?>? metadata,
      required String source,
      required String acquired_at})
      : _id = id,
        _wallet_id = wallet_id,
        _contract_address = contract_address,
        _token_id = token_id,
        _network = network,
        _name = name,
        _description = description,
        _image_url = image_url,
        _metadata = metadata,
        _source = source,
        _acquired_at = acquired_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  NFT.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _contract_address = json["contract_address"] == null
            ? null
            : json["contract_address"] as String,
        _token_id =
            json["token_id"] == null ? null : json["token_id"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _image_url =
            json["image_url"] == null ? null : json["image_url"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _source = json["source"] == null ? null : json["source"] as String,
        _acquired_at =
            json["acquired_at"] == null ? null : json["acquired_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "wallet_id": jsonValue(_wallet_id),
        "contract_address": jsonValue(_contract_address),
        "token_id": jsonValue(_token_id),
        "network": jsonValue(_network),
        if (_name != null) "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        if (_image_url != null) "image_url": jsonValue(_image_url),
        if (_metadata != null) "metadata": jsonValue(_metadata),
        "source": jsonValue(_source),
        "acquired_at": jsonValue(_acquired_at),
      };
}

/// JSON model for JavaScript SDK `wallets.SwapQuote`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SwapQuote implements JsonModel {
  final JsonMap? _originalJson;
  final String? _from_token;
  String get from_token => _from_token as String;
  final String? _to_token;
  String get to_token => _to_token as String;
  final String? _from_amount;
  String get from_amount => _from_amount as String;
  final String? _to_amount;
  String get to_amount => _to_amount as String;
  final String? _min_to_amount;
  String get min_to_amount => _min_to_amount as String;
  final String? _exchange_rate;
  String get exchange_rate => _exchange_rate as String;
  final String? _quote_id;
  String get quote_id => _quote_id as String;
  final num? _slippage_bps;
  num get slippage_bps => _slippage_bps as num;
  final String? _network;
  String get network => _network as String;
  final bool? _liquidity_available;
  bool get liquidity_available => _liquidity_available as bool;
  final String? _expires_at;
  String get expires_at => _expires_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SwapQuote(
      {required String from_token,
      required String to_token,
      required String from_amount,
      required String to_amount,
      required String min_to_amount,
      required String exchange_rate,
      required String quote_id,
      required num slippage_bps,
      required String network,
      required bool liquidity_available,
      required String expires_at})
      : _from_token = from_token,
        _to_token = to_token,
        _from_amount = from_amount,
        _to_amount = to_amount,
        _min_to_amount = min_to_amount,
        _exchange_rate = exchange_rate,
        _quote_id = quote_id,
        _slippage_bps = slippage_bps,
        _network = network,
        _liquidity_available = liquidity_available,
        _expires_at = expires_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SwapQuote.fromJson(JsonMap json)
      : _from_token =
            json["from_token"] == null ? null : json["from_token"] as String,
        _to_token =
            json["to_token"] == null ? null : json["to_token"] as String,
        _from_amount =
            json["from_amount"] == null ? null : json["from_amount"] as String,
        _to_amount =
            json["to_amount"] == null ? null : json["to_amount"] as String,
        _min_to_amount = json["min_to_amount"] == null
            ? null
            : json["min_to_amount"] as String,
        _exchange_rate = json["exchange_rate"] == null
            ? null
            : json["exchange_rate"] as String,
        _quote_id =
            json["quote_id"] == null ? null : json["quote_id"] as String,
        _slippage_bps =
            json["slippage_bps"] == null ? null : json["slippage_bps"] as num,
        _network = json["network"] == null ? null : json["network"] as String,
        _liquidity_available = json["liquidity_available"] == null
            ? null
            : json["liquidity_available"] as bool,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "from_token": jsonValue(_from_token),
        "to_token": jsonValue(_to_token),
        "from_amount": jsonValue(_from_amount),
        "to_amount": jsonValue(_to_amount),
        "min_to_amount": jsonValue(_min_to_amount),
        "exchange_rate": jsonValue(_exchange_rate),
        "quote_id": jsonValue(_quote_id),
        "slippage_bps": jsonValue(_slippage_bps),
        "network": jsonValue(_network),
        "liquidity_available": jsonValue(_liquidity_available),
        "expires_at": jsonValue(_expires_at),
      };
}

/// JSON model for JavaScript SDK `wallets.SwapResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SwapResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _transaction_hash;
  String get transaction_hash => _transaction_hash as String;
  final String? _status;
  String get status => _status as String;
  final String? _from_token;
  String get from_token => _from_token as String;
  final String? _to_token;
  String get to_token => _to_token as String;
  final String? _from_amount;
  String get from_amount => _from_amount as String;
  final String? _to_amount;
  String get to_amount => _to_amount as String;
  final String? _gas_used;
  String get gas_used => _gas_used as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SwapResult(
      {required String transaction_hash,
      required String status,
      required String from_token,
      required String to_token,
      required String from_amount,
      required String to_amount,
      required String gas_used})
      : _transaction_hash = transaction_hash,
        _status = status,
        _from_token = from_token,
        _to_token = to_token,
        _from_amount = from_amount,
        _to_amount = to_amount,
        _gas_used = gas_used,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SwapResult.fromJson(JsonMap json)
      : _transaction_hash = json["transaction_hash"] == null
            ? null
            : json["transaction_hash"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _from_token =
            json["from_token"] == null ? null : json["from_token"] as String,
        _to_token =
            json["to_token"] == null ? null : json["to_token"] as String,
        _from_amount =
            json["from_amount"] == null ? null : json["from_amount"] as String,
        _to_amount =
            json["to_amount"] == null ? null : json["to_amount"] as String,
        _gas_used =
            json["gas_used"] == null ? null : json["gas_used"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "transaction_hash": jsonValue(_transaction_hash),
        "status": jsonValue(_status),
        "from_token": jsonValue(_from_token),
        "to_token": jsonValue(_to_token),
        "from_amount": jsonValue(_from_amount),
        "to_amount": jsonValue(_to_amount),
        "gas_used": jsonValue(_gas_used),
      };
}

/// JSON model for JavaScript SDK `wallets.WalletStats`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class WalletStats implements JsonModel {
  final JsonMap? _originalJson;
  final num? _total_wallets;
  num get total_wallets => _total_wallets as num;
  final Map<String, num>? _by_type;
  Map<String, num> get by_type => _by_type as Map<String, num>;
  final Map<String, num>? _by_network;
  Map<String, num> get by_network => _by_network as Map<String, num>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const WalletStats(
      {required num total_wallets,
      required Map<String, num> by_type,
      required Map<String, num> by_network})
      : _total_wallets = total_wallets,
        _by_type = by_type,
        _by_network = by_network,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  WalletStats.fromJson(JsonMap json)
      : _total_wallets =
            json["total_wallets"] == null ? null : json["total_wallets"] as num,
        _by_type = json["by_type"] == null
            ? null
            : asJsonMap(json["by_type"])
                .map((key, value) => MapEntry(key, value as num)),
        _by_network = json["by_network"] == null
            ? null
            : asJsonMap(json["by_network"])
                .map((key, value) => MapEntry(key, value as num)),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "total_wallets": jsonValue(_total_wallets),
        "by_type": jsonValue(_by_type),
        "by_network": jsonValue(_by_network),
      };
}

/// JSON model for JavaScript SDK `wallets.Transaction`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Transaction implements JsonModel {
  final JsonMap? _originalJson;
  final String? _hash;
  String get hash => _hash as String;
  final String? _type;
  String get type => _type as String;
  final String? _from;
  String get from => _from as String;
  final String? _to;
  String get to => _to as String;
  final Object? _value;
  Object? get value => _value;
  final String? _asset;
  String get asset => _asset as String;
  final String? _category;
  String get category => _category as String;
  final String? _block_num;
  String get block_num => _block_num as String;
  final String? _timestamp;
  String get timestamp => _timestamp as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Transaction(
      {required String hash,
      required String type,
      required String from,
      required String to,
      required Object? value,
      required String asset,
      required String category,
      required String block_num,
      required String timestamp})
      : _hash = hash,
        _type = type,
        _from = from,
        _to = to,
        _value = value,
        _asset = asset,
        _category = category,
        _block_num = block_num,
        _timestamp = timestamp,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Transaction.fromJson(JsonMap json)
      : _hash = json["hash"] == null ? null : json["hash"] as String,
        _type = json["type"] == null ? null : json["type"] as String,
        _from = json["from"] == null ? null : json["from"] as String,
        _to = json["to"] == null ? null : json["to"] as String,
        _value = json["value"],
        _asset = json["asset"] == null ? null : json["asset"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _block_num =
            json["block_num"] == null ? null : json["block_num"] as String,
        _timestamp =
            json["timestamp"] == null ? null : json["timestamp"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "hash": jsonValue(_hash),
        "type": jsonValue(_type),
        "from": jsonValue(_from),
        "to": jsonValue(_to),
        "value": jsonValue(_value),
        "asset": jsonValue(_asset),
        "category": jsonValue(_category),
        "block_num": jsonValue(_block_num),
        "timestamp": jsonValue(_timestamp),
      };
}

/// JSON model for JavaScript SDK `wallets.TransactionHistory`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class TransactionHistory implements JsonModel {
  final JsonMap? _originalJson;
  final String? _address;
  String get address => _address as String;
  final String? _network;
  String get network => _network as String;
  final num? _total_sent;
  num get total_sent => _total_sent as num;
  final num? _total_received;
  num get total_received => _total_received as num;
  final List<Transaction>? _transactions;
  List<Transaction> get transactions => _transactions as List<Transaction>;
  final String? _error;
  String? get error => _error;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const TransactionHistory(
      {required String address,
      required String network,
      required num total_sent,
      required num total_received,
      required List<Transaction> transactions,
      String? error})
      : _address = address,
        _network = network,
        _total_sent = total_sent,
        _total_received = total_received,
        _transactions = transactions,
        _error = error,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  TransactionHistory.fromJson(JsonMap json)
      : _address = json["address"] == null ? null : json["address"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _total_sent =
            json["total_sent"] == null ? null : json["total_sent"] as num,
        _total_received = json["total_received"] == null
            ? null
            : json["total_received"] as num,
        _transactions = json["transactions"] == null
            ? null
            : (json["transactions"] as List<Object?>)
                .map((item) => Transaction.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _error = json["error"] == null ? null : json["error"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "address": jsonValue(_address),
        "network": jsonValue(_network),
        "total_sent": jsonValue(_total_sent),
        "total_received": jsonValue(_total_received),
        "transactions": jsonValue(_transactions),
        if (_error != null) "error": jsonValue(_error),
      };
}

/// JSON model for JavaScript SDK `wallets.ComprehensiveWalletInfo`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ComprehensiveWalletInfo implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_id;
  String get wallet_id => _wallet_id as String;
  final String? _address;
  String get address => _address as String;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _wallet_type;
  String get wallet_type => _wallet_type as String;
  final String? _network;
  String get network => _network as String;
  final String? _name;
  String? get name => _name;
  final String? _status;
  String get status => _status as String;
  final bool? _supports_export;
  bool get supports_export => _supports_export as bool;
  final String? _created_at;
  String get created_at => _created_at as String;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;
  final String? _owner_wallet_id;
  String? get owner_wallet_id => _owner_wallet_id;
  final String? _owner_address;
  String? get owner_address => _owner_address;
  final bool? _is_deployed;
  bool? get is_deployed => _is_deployed;
  final ComprehensiveWalletInfoBalances? _balances;
  ComprehensiveWalletInfoBalances? get balances => _balances;
  final ComprehensiveWalletInfoNfts? _nfts;
  ComprehensiveWalletInfoNfts? get nfts => _nfts;
  final ComprehensiveWalletInfoActivity? _activity;
  ComprehensiveWalletInfoActivity? get activity => _activity;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ComprehensiveWalletInfo(
      {required String wallet_id,
      required String address,
      required String user_id,
      required String wallet_type,
      required String network,
      String? name,
      required String status,
      required bool supports_export,
      required String created_at,
      Map<String, Object?>? metadata,
      String? owner_wallet_id,
      String? owner_address,
      bool? is_deployed,
      ComprehensiveWalletInfoBalances? balances,
      ComprehensiveWalletInfoNfts? nfts,
      ComprehensiveWalletInfoActivity? activity})
      : _wallet_id = wallet_id,
        _address = address,
        _user_id = user_id,
        _wallet_type = wallet_type,
        _network = network,
        _name = name,
        _status = status,
        _supports_export = supports_export,
        _created_at = created_at,
        _metadata = metadata,
        _owner_wallet_id = owner_wallet_id,
        _owner_address = owner_address,
        _is_deployed = is_deployed,
        _balances = balances,
        _nfts = nfts,
        _activity = activity,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ComprehensiveWalletInfo.fromJson(JsonMap json)
      : _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _address = json["address"] == null ? null : json["address"] as String,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _wallet_type =
            json["wallet_type"] == null ? null : json["wallet_type"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _supports_export = json["supports_export"] == null
            ? null
            : json["supports_export"] as bool,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _owner_wallet_id = json["owner_wallet_id"] == null
            ? null
            : json["owner_wallet_id"] as String,
        _owner_address = json["owner_address"] == null
            ? null
            : json["owner_address"] as String,
        _is_deployed =
            json["is_deployed"] == null ? null : json["is_deployed"] as bool,
        _balances = json["balances"] == null
            ? null
            : ComprehensiveWalletInfoBalances.fromJson(
                asJsonMap(json["balances"])),
        _nfts = json["nfts"] == null
            ? null
            : ComprehensiveWalletInfoNfts.fromJson(asJsonMap(json["nfts"])),
        _activity = json["activity"] == null
            ? null
            : ComprehensiveWalletInfoActivity.fromJson(
                asJsonMap(json["activity"])),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_id": jsonValue(_wallet_id),
        "address": jsonValue(_address),
        "user_id": jsonValue(_user_id),
        "wallet_type": jsonValue(_wallet_type),
        "network": jsonValue(_network),
        if (_name != null) "name": jsonValue(_name),
        "status": jsonValue(_status),
        "supports_export": jsonValue(_supports_export),
        "created_at": jsonValue(_created_at),
        if (_metadata != null) "metadata": jsonValue(_metadata),
        if (_owner_wallet_id != null)
          "owner_wallet_id": jsonValue(_owner_wallet_id),
        if (_owner_address != null) "owner_address": jsonValue(_owner_address),
        if (_is_deployed != null) "is_deployed": jsonValue(_is_deployed),
        if (_balances != null) "balances": jsonValue(_balances),
        if (_nfts != null) "nfts": jsonValue(_nfts),
        if (_activity != null) "activity": jsonValue(_activity),
      };
}

/// JSON model for JavaScript SDK `wallets.UserWalletSummary`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserWalletSummary implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final num? _total_wallets;
  num get total_wallets => _total_wallets as num;
  final num? _total_nfts;
  num get total_nfts => _total_nfts as num;
  final num? _total_swaps;
  num get total_swaps => _total_swaps as num;
  final List<UserWalletSummaryWalletsItem>? _wallets;
  List<UserWalletSummaryWalletsItem> get wallets =>
      _wallets as List<UserWalletSummaryWalletsItem>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserWalletSummary(
      {required String user_id,
      required num total_wallets,
      required num total_nfts,
      required num total_swaps,
      required List<UserWalletSummaryWalletsItem> wallets})
      : _user_id = user_id,
        _total_wallets = total_wallets,
        _total_nfts = total_nfts,
        _total_swaps = total_swaps,
        _wallets = wallets,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserWalletSummary.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _total_wallets =
            json["total_wallets"] == null ? null : json["total_wallets"] as num,
        _total_nfts =
            json["total_nfts"] == null ? null : json["total_nfts"] as num,
        _total_swaps =
            json["total_swaps"] == null ? null : json["total_swaps"] as num,
        _wallets = json["wallets"] == null
            ? null
            : (json["wallets"] as List<Object?>)
                .map((item) =>
                    UserWalletSummaryWalletsItem.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "total_wallets": jsonValue(_total_wallets),
        "total_nfts": jsonValue(_total_nfts),
        "total_swaps": jsonValue(_total_swaps),
        "wallets": jsonValue(_wallets),
      };
}

/// JSON model for JavaScript SDK `wallets.CreateWalletRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateWalletRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _wallet_type;
  String? get wallet_type => _wallet_type;
  final String? _network;
  String? get network => _network;
  final String? _name;
  String? get name => _name;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateWalletRequest(
      {required String user_id,
      String? wallet_type,
      String? network,
      String? name,
      Map<String, Object?>? metadata})
      : _user_id = user_id,
        _wallet_type = wallet_type,
        _network = network,
        _name = name,
        _metadata = metadata,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateWalletRequest.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _wallet_type =
            json["wallet_type"] == null ? null : json["wallet_type"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        if (_wallet_type != null) "wallet_type": jsonValue(_wallet_type),
        if (_network != null) "network": jsonValue(_network),
        if (_name != null) "name": jsonValue(_name),
        if (_metadata != null) "metadata": jsonValue(_metadata),
      };
}

/// JSON model for JavaScript SDK `wallets.CreateDualWalletsRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateDualWalletsRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _network;
  String? get network => _network;
  final String? _name_prefix;
  String? get name_prefix => _name_prefix;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateDualWalletsRequest(
      {required String user_id, String? network, String? name_prefix})
      : _user_id = user_id,
        _network = network,
        _name_prefix = name_prefix,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateDualWalletsRequest.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _name_prefix =
            json["name_prefix"] == null ? null : json["name_prefix"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        if (_network != null) "network": jsonValue(_network),
        if (_name_prefix != null) "name_prefix": jsonValue(_name_prefix),
      };
}

/// JSON model for JavaScript SDK `wallets.SwapQuoteRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SwapQuoteRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _from_token;
  String get from_token => _from_token as String;
  final String? _to_token;
  String get to_token => _to_token as String;
  final String? _from_amount;
  String get from_amount => _from_amount as String;
  final String? _network;
  String? get network => _network;
  final num? _slippage_bps;
  num? get slippage_bps => _slippage_bps;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SwapQuoteRequest(
      {required String from_token,
      required String to_token,
      required String from_amount,
      String? network,
      num? slippage_bps})
      : _from_token = from_token,
        _to_token = to_token,
        _from_amount = from_amount,
        _network = network,
        _slippage_bps = slippage_bps,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SwapQuoteRequest.fromJson(JsonMap json)
      : _from_token =
            json["from_token"] == null ? null : json["from_token"] as String,
        _to_token =
            json["to_token"] == null ? null : json["to_token"] as String,
        _from_amount =
            json["from_amount"] == null ? null : json["from_amount"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _slippage_bps =
            json["slippage_bps"] == null ? null : json["slippage_bps"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "from_token": jsonValue(_from_token),
        "to_token": jsonValue(_to_token),
        "from_amount": jsonValue(_from_amount),
        if (_network != null) "network": jsonValue(_network),
        if (_slippage_bps != null) "slippage_bps": jsonValue(_slippage_bps),
      };
}

/// JSON model for JavaScript SDK `wallets.ExecuteSwapRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ExecuteSwapRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_id;
  String get wallet_id => _wallet_id as String;
  final String? _from_token;
  String get from_token => _from_token as String;
  final String? _to_token;
  String get to_token => _to_token as String;
  final String? _from_amount;
  String get from_amount => _from_amount as String;
  final String? _network;
  String? get network => _network;
  final num? _slippage_bps;
  num? get slippage_bps => _slippage_bps;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ExecuteSwapRequest(
      {required String wallet_id,
      required String from_token,
      required String to_token,
      required String from_amount,
      String? network,
      num? slippage_bps})
      : _wallet_id = wallet_id,
        _from_token = from_token,
        _to_token = to_token,
        _from_amount = from_amount,
        _network = network,
        _slippage_bps = slippage_bps,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ExecuteSwapRequest.fromJson(JsonMap json)
      : _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _from_token =
            json["from_token"] == null ? null : json["from_token"] as String,
        _to_token =
            json["to_token"] == null ? null : json["to_token"] as String,
        _from_amount =
            json["from_amount"] == null ? null : json["from_amount"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _slippage_bps =
            json["slippage_bps"] == null ? null : json["slippage_bps"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_id": jsonValue(_wallet_id),
        "from_token": jsonValue(_from_token),
        "to_token": jsonValue(_to_token),
        "from_amount": jsonValue(_from_amount),
        if (_network != null) "network": jsonValue(_network),
        if (_slippage_bps != null) "slippage_bps": jsonValue(_slippage_bps),
      };
}

/// JSON model for JavaScript SDK `wallets.AddNFTRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class AddNFTRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _contract_address;
  String get contract_address => _contract_address as String;
  final String? _token_id;
  String get token_id => _token_id as String;
  final String? _network;
  String get network => _network as String;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;
  final String? _source;
  String? get source => _source;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const AddNFTRequest(
      {required String contract_address,
      required String token_id,
      required String network,
      Map<String, Object?>? metadata,
      String? source})
      : _contract_address = contract_address,
        _token_id = token_id,
        _network = network,
        _metadata = metadata,
        _source = source,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  AddNFTRequest.fromJson(JsonMap json)
      : _contract_address = json["contract_address"] == null
            ? null
            : json["contract_address"] as String,
        _token_id =
            json["token_id"] == null ? null : json["token_id"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _source = json["source"] == null ? null : json["source"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "contract_address": jsonValue(_contract_address),
        "token_id": jsonValue(_token_id),
        "network": jsonValue(_network),
        if (_metadata != null) "metadata": jsonValue(_metadata),
        if (_source != null) "source": jsonValue(_source),
      };
}

/// JSON model for JavaScript SDK `wallets.TransferRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class TransferRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _from_address;

  /// Source wallet address (required if wallet_id not provided)
  String? get from_address => _from_address;
  final String? _wallet_id;

  /// Source wallet ID (alternative to from_address)
  String? get wallet_id => _wallet_id;
  final String? _to_address;

  /// Destination address
  String get to_address => _to_address as String;
  final String? _amount;

  /// Amount to transfer (in token units, e.g., "0.1" for 0.1 ETH)
  String get amount => _amount as String;
  final String? _token;

  /// Token symbol (default: "ETH")
  String? get token => _token;
  final String? _network;

  /// Network (default: "base-sepolia")
  String? get network => _network;
  final String? _contract_address;

  /// Contract address for custom ERC-20 tokens
  String? get contract_address => _contract_address;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const TransferRequest(
      {String? from_address,
      String? wallet_id,
      required String to_address,
      required String amount,
      String? token,
      String? network,
      String? contract_address})
      : _from_address = from_address,
        _wallet_id = wallet_id,
        _to_address = to_address,
        _amount = amount,
        _token = token,
        _network = network,
        _contract_address = contract_address,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  TransferRequest.fromJson(JsonMap json)
      : _from_address = json["from_address"] == null
            ? null
            : json["from_address"] as String,
        _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _to_address =
            json["to_address"] == null ? null : json["to_address"] as String,
        _amount = json["amount"] == null ? null : json["amount"] as String,
        _token = json["token"] == null ? null : json["token"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _contract_address = json["contract_address"] == null
            ? null
            : json["contract_address"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_from_address != null) "from_address": jsonValue(_from_address),
        if (_wallet_id != null) "wallet_id": jsonValue(_wallet_id),
        "to_address": jsonValue(_to_address),
        "amount": jsonValue(_amount),
        if (_token != null) "token": jsonValue(_token),
        if (_network != null) "network": jsonValue(_network),
        if (_contract_address != null)
          "contract_address": jsonValue(_contract_address),
      };
}

/// JSON model for JavaScript SDK `wallets.TransferResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class TransferResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _tx_hash;
  String get tx_hash => _tx_hash as String;
  final String? _from;
  String get from => _from as String;
  final String? _to;
  String get to => _to as String;
  final String? _amount;
  String get amount => _amount as String;
  final String? _token;
  String get token => _token as String;
  final String? _contract_address;
  String? get contract_address => _contract_address;
  final String? _network;
  String get network => _network as String;
  final String? _status;
  String get status => _status as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const TransferResult(
      {required String tx_hash,
      required String from,
      required String to,
      required String amount,
      required String token,
      String? contract_address,
      required String network,
      required String status})
      : _tx_hash = tx_hash,
        _from = from,
        _to = to,
        _amount = amount,
        _token = token,
        _contract_address = contract_address,
        _network = network,
        _status = status,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  TransferResult.fromJson(JsonMap json)
      : _tx_hash = json["tx_hash"] == null ? null : json["tx_hash"] as String,
        _from = json["from"] == null ? null : json["from"] as String,
        _to = json["to"] == null ? null : json["to"] as String,
        _amount = json["amount"] == null ? null : json["amount"] as String,
        _token = json["token"] == null ? null : json["token"] as String,
        _contract_address = json["contract_address"] == null
            ? null
            : json["contract_address"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "tx_hash": jsonValue(_tx_hash),
        "from": jsonValue(_from),
        "to": jsonValue(_to),
        "amount": jsonValue(_amount),
        "token": jsonValue(_token),
        if (_contract_address != null)
          "contract_address": jsonValue(_contract_address),
        "network": jsonValue(_network),
        "status": jsonValue(_status),
      };
}

/// JSON model for JavaScript SDK `wallets.Token`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Token implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _contract_address;
  String get contract_address => _contract_address as String;
  final String? _network;
  String get network => _network as String;
  final String? _symbol;
  String get symbol => _symbol as String;
  final String? _name;
  String get name => _name as String;
  final num? _decimals;
  num get decimals => _decimals as num;
  final String? _logo_url;
  String? get logo_url => _logo_url;
  final String? _color;
  String? get color => _color;
  final String? _coingecko_id;
  String? get coingecko_id => _coingecko_id;
  final String? _coinmarketcap_id;
  String? get coinmarketcap_id => _coinmarketcap_id;
  final String? _token_standard;
  String get token_standard => _token_standard as String;
  final bool? _is_native_wrapper;
  bool get is_native_wrapper => _is_native_wrapper as bool;
  final bool? _is_verified;
  bool get is_verified => _is_verified as bool;
  final bool? _is_active;
  bool get is_active => _is_active as bool;
  final bool? _is_hidden;
  bool? get is_hidden => _is_hidden;
  final num? _display_order;
  num get display_order => _display_order as num;
  final bool? _is_global;
  bool get is_global => _is_global as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Token(
      {required String id,
      required String contract_address,
      required String network,
      required String symbol,
      required String name,
      required num decimals,
      String? logo_url,
      String? color,
      String? coingecko_id,
      String? coinmarketcap_id,
      required String token_standard,
      required bool is_native_wrapper,
      required bool is_verified,
      required bool is_active,
      bool? is_hidden,
      required num display_order,
      required bool is_global})
      : _id = id,
        _contract_address = contract_address,
        _network = network,
        _symbol = symbol,
        _name = name,
        _decimals = decimals,
        _logo_url = logo_url,
        _color = color,
        _coingecko_id = coingecko_id,
        _coinmarketcap_id = coinmarketcap_id,
        _token_standard = token_standard,
        _is_native_wrapper = is_native_wrapper,
        _is_verified = is_verified,
        _is_active = is_active,
        _is_hidden = is_hidden,
        _display_order = display_order,
        _is_global = is_global,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Token.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _contract_address = json["contract_address"] == null
            ? null
            : json["contract_address"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _symbol = json["symbol"] == null ? null : json["symbol"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _decimals = json["decimals"] == null ? null : json["decimals"] as num,
        _logo_url =
            json["logo_url"] == null ? null : json["logo_url"] as String,
        _color = json["color"] == null ? null : json["color"] as String,
        _coingecko_id = json["coingecko_id"] == null
            ? null
            : json["coingecko_id"] as String,
        _coinmarketcap_id = json["coinmarketcap_id"] == null
            ? null
            : json["coinmarketcap_id"] as String,
        _token_standard = json["token_standard"] == null
            ? null
            : json["token_standard"] as String,
        _is_native_wrapper = json["is_native_wrapper"] == null
            ? null
            : json["is_native_wrapper"] as bool,
        _is_verified =
            json["is_verified"] == null ? null : json["is_verified"] as bool,
        _is_active =
            json["is_active"] == null ? null : json["is_active"] as bool,
        _is_hidden =
            json["is_hidden"] == null ? null : json["is_hidden"] as bool,
        _display_order =
            json["display_order"] == null ? null : json["display_order"] as num,
        _is_global =
            json["is_global"] == null ? null : json["is_global"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "contract_address": jsonValue(_contract_address),
        "network": jsonValue(_network),
        "symbol": jsonValue(_symbol),
        "name": jsonValue(_name),
        "decimals": jsonValue(_decimals),
        if (_logo_url != null) "logo_url": jsonValue(_logo_url),
        if (_color != null) "color": jsonValue(_color),
        if (_coingecko_id != null) "coingecko_id": jsonValue(_coingecko_id),
        if (_coinmarketcap_id != null)
          "coinmarketcap_id": jsonValue(_coinmarketcap_id),
        "token_standard": jsonValue(_token_standard),
        "is_native_wrapper": jsonValue(_is_native_wrapper),
        "is_verified": jsonValue(_is_verified),
        "is_active": jsonValue(_is_active),
        if (_is_hidden != null) "is_hidden": jsonValue(_is_hidden),
        "display_order": jsonValue(_display_order),
        "is_global": jsonValue(_is_global),
      };
}

/// JSON model for JavaScript SDK `wallets.CreateTokenRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateTokenRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _contract_address;
  String get contract_address => _contract_address as String;
  final String? _network;
  String get network => _network as String;
  final String? _symbol;
  String get symbol => _symbol as String;
  final String? _name;
  String get name => _name as String;
  final num? _decimals;
  num? get decimals => _decimals;
  final String? _logo_url;
  String? get logo_url => _logo_url;
  final String? _color;
  String? get color => _color;
  final String? _coingecko_id;
  String? get coingecko_id => _coingecko_id;
  final String? _coinmarketcap_id;
  String? get coinmarketcap_id => _coinmarketcap_id;
  final String? _custom_price_feed_url;
  String? get custom_price_feed_url => _custom_price_feed_url;
  final bool? _is_native_wrapper;
  bool? get is_native_wrapper => _is_native_wrapper;
  final num? _display_order;
  num? get display_order => _display_order;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateTokenRequest(
      {required String contract_address,
      required String network,
      required String symbol,
      required String name,
      num? decimals,
      String? logo_url,
      String? color,
      String? coingecko_id,
      String? coinmarketcap_id,
      String? custom_price_feed_url,
      bool? is_native_wrapper,
      num? display_order})
      : _contract_address = contract_address,
        _network = network,
        _symbol = symbol,
        _name = name,
        _decimals = decimals,
        _logo_url = logo_url,
        _color = color,
        _coingecko_id = coingecko_id,
        _coinmarketcap_id = coinmarketcap_id,
        _custom_price_feed_url = custom_price_feed_url,
        _is_native_wrapper = is_native_wrapper,
        _display_order = display_order,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateTokenRequest.fromJson(JsonMap json)
      : _contract_address = json["contract_address"] == null
            ? null
            : json["contract_address"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _symbol = json["symbol"] == null ? null : json["symbol"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _decimals = json["decimals"] == null ? null : json["decimals"] as num,
        _logo_url =
            json["logo_url"] == null ? null : json["logo_url"] as String,
        _color = json["color"] == null ? null : json["color"] as String,
        _coingecko_id = json["coingecko_id"] == null
            ? null
            : json["coingecko_id"] as String,
        _coinmarketcap_id = json["coinmarketcap_id"] == null
            ? null
            : json["coinmarketcap_id"] as String,
        _custom_price_feed_url = json["custom_price_feed_url"] == null
            ? null
            : json["custom_price_feed_url"] as String,
        _is_native_wrapper = json["is_native_wrapper"] == null
            ? null
            : json["is_native_wrapper"] as bool,
        _display_order =
            json["display_order"] == null ? null : json["display_order"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "contract_address": jsonValue(_contract_address),
        "network": jsonValue(_network),
        "symbol": jsonValue(_symbol),
        "name": jsonValue(_name),
        if (_decimals != null) "decimals": jsonValue(_decimals),
        if (_logo_url != null) "logo_url": jsonValue(_logo_url),
        if (_color != null) "color": jsonValue(_color),
        if (_coingecko_id != null) "coingecko_id": jsonValue(_coingecko_id),
        if (_coinmarketcap_id != null)
          "coinmarketcap_id": jsonValue(_coinmarketcap_id),
        if (_custom_price_feed_url != null)
          "custom_price_feed_url": jsonValue(_custom_price_feed_url),
        if (_is_native_wrapper != null)
          "is_native_wrapper": jsonValue(_is_native_wrapper),
        if (_display_order != null) "display_order": jsonValue(_display_order),
      };
}

/// JSON model for JavaScript SDK `wallets.UpdateTokenRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UpdateTokenRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _symbol;
  String? get symbol => _symbol;
  final String? _name;
  String? get name => _name;
  final num? _decimals;
  num? get decimals => _decimals;
  final String? _logo_url;
  String? get logo_url => _logo_url;
  final String? _color;
  String? get color => _color;
  final String? _coingecko_id;
  String? get coingecko_id => _coingecko_id;
  final String? _coinmarketcap_id;
  String? get coinmarketcap_id => _coinmarketcap_id;
  final String? _custom_price_feed_url;
  String? get custom_price_feed_url => _custom_price_feed_url;
  final bool? _is_active;
  bool? get is_active => _is_active;
  final bool? _is_hidden;
  bool? get is_hidden => _is_hidden;
  final num? _display_order;
  num? get display_order => _display_order;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UpdateTokenRequest(
      {String? symbol,
      String? name,
      num? decimals,
      String? logo_url,
      String? color,
      String? coingecko_id,
      String? coinmarketcap_id,
      String? custom_price_feed_url,
      bool? is_active,
      bool? is_hidden,
      num? display_order})
      : _symbol = symbol,
        _name = name,
        _decimals = decimals,
        _logo_url = logo_url,
        _color = color,
        _coingecko_id = coingecko_id,
        _coinmarketcap_id = coinmarketcap_id,
        _custom_price_feed_url = custom_price_feed_url,
        _is_active = is_active,
        _is_hidden = is_hidden,
        _display_order = display_order,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UpdateTokenRequest.fromJson(JsonMap json)
      : _symbol = json["symbol"] == null ? null : json["symbol"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _decimals = json["decimals"] == null ? null : json["decimals"] as num,
        _logo_url =
            json["logo_url"] == null ? null : json["logo_url"] as String,
        _color = json["color"] == null ? null : json["color"] as String,
        _coingecko_id = json["coingecko_id"] == null
            ? null
            : json["coingecko_id"] as String,
        _coinmarketcap_id = json["coinmarketcap_id"] == null
            ? null
            : json["coinmarketcap_id"] as String,
        _custom_price_feed_url = json["custom_price_feed_url"] == null
            ? null
            : json["custom_price_feed_url"] as String,
        _is_active =
            json["is_active"] == null ? null : json["is_active"] as bool,
        _is_hidden =
            json["is_hidden"] == null ? null : json["is_hidden"] as bool,
        _display_order =
            json["display_order"] == null ? null : json["display_order"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_symbol != null) "symbol": jsonValue(_symbol),
        if (_name != null) "name": jsonValue(_name),
        if (_decimals != null) "decimals": jsonValue(_decimals),
        if (_logo_url != null) "logo_url": jsonValue(_logo_url),
        if (_color != null) "color": jsonValue(_color),
        if (_coingecko_id != null) "coingecko_id": jsonValue(_coingecko_id),
        if (_coinmarketcap_id != null)
          "coinmarketcap_id": jsonValue(_coinmarketcap_id),
        if (_custom_price_feed_url != null)
          "custom_price_feed_url": jsonValue(_custom_price_feed_url),
        if (_is_active != null) "is_active": jsonValue(_is_active),
        if (_is_hidden != null) "is_hidden": jsonValue(_is_hidden),
        if (_display_order != null) "display_order": jsonValue(_display_order),
      };
}

/// JSON model for JavaScript SDK `wallets.WalletBalanceResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class WalletBalanceResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _address;
  String get address => _address as String;
  final String? _network;
  String get network => _network as String;
  final String? _native_balance;
  String get native_balance => _native_balance as String;
  final String? _native_symbol;
  String get native_symbol => _native_symbol as String;
  final List<TokenBalance>? _balances;
  List<TokenBalance> get balances => _balances as List<TokenBalance>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const WalletBalanceResponse(
      {required String address,
      required String network,
      required String native_balance,
      required String native_symbol,
      required List<TokenBalance> balances})
      : _address = address,
        _network = network,
        _native_balance = native_balance,
        _native_symbol = native_symbol,
        _balances = balances,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  WalletBalanceResponse.fromJson(JsonMap json)
      : _address = json["address"] == null ? null : json["address"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _native_balance = json["native_balance"] == null
            ? null
            : json["native_balance"] as String,
        _native_symbol = json["native_symbol"] == null
            ? null
            : json["native_symbol"] as String,
        _balances = json["balances"] == null
            ? null
            : (json["balances"] as List<Object?>)
                .map((item) => TokenBalance.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "address": jsonValue(_address),
        "network": jsonValue(_network),
        "native_balance": jsonValue(_native_balance),
        "native_symbol": jsonValue(_native_symbol),
        "balances": jsonValue(_balances),
      };
}

/// JSON model for JavaScript SDK `wallets.UserWithWallets`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserWithWallets implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final List<UserWithWalletsWalletsItem>? _wallets;
  List<UserWithWalletsWalletsItem> get wallets =>
      _wallets as List<UserWithWalletsWalletsItem>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserWithWallets(
      {required String user_id,
      required List<UserWithWalletsWalletsItem> wallets})
      : _user_id = user_id,
        _wallets = wallets,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserWithWallets.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _wallets = json["wallets"] == null
            ? null
            : (json["wallets"] as List<Object?>)
                .map((item) =>
                    UserWithWalletsWalletsItem.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "wallets": jsonValue(_wallets),
      };
}

/// JSON model for JavaScript SDK `wallets.UsersWithWalletsResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UsersWithWalletsResponse implements JsonModel {
  final JsonMap? _originalJson;
  final List<UserWithWallets>? _users;
  List<UserWithWallets> get users => _users as List<UserWithWallets>;
  final num? _total;
  num get total => _total as num;
  final num? _limit;
  num get limit => _limit as num;
  final num? _offset;
  num get offset => _offset as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UsersWithWalletsResponse(
      {required List<UserWithWallets> users,
      required num total,
      required num limit,
      required num offset})
      : _users = users,
        _total = total,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UsersWithWalletsResponse.fromJson(JsonMap json)
      : _users = json["users"] == null
            ? null
            : (json["users"] as List<Object?>)
                .map((item) => UserWithWallets.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total = json["total"] == null ? null : json["total"] as num,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "users": jsonValue(_users),
        "total": jsonValue(_total),
        "limit": jsonValue(_limit),
        "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `users.EndUser`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EndUser implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _external_id;
  String get external_id => _external_id as String;
  final String? _email;
  String? get email => _email;
  final String? _first_name;
  String? get first_name => _first_name;
  final String? _last_name;
  String? get last_name => _last_name;
  final String? _display_name;
  String? get display_name => _display_name;
  final String? _avatar_url;
  String? get avatar_url => _avatar_url;
  final String? _phone;
  String? get phone => _phone;
  final String? _date_of_birth;
  String? get date_of_birth => _date_of_birth;
  final String? _country;
  String? get country => _country;
  final String? _city;
  String? get city => _city;
  final String? _timezone;
  String? get timezone => _timezone;
  final String? _language;
  String? get language => _language;
  final String? _bio;
  String? get bio => _bio;
  final String? _wallet_address;
  String? get wallet_address => _wallet_address;
  final String? _wallet_source;
  String? get wallet_source => _wallet_source;
  final String? _cdp_wallet_address;
  String? get cdp_wallet_address => _cdp_wallet_address;
  final String? _wallet_linked_at;
  String? get wallet_linked_at => _wallet_linked_at;
  final String? _status;
  String get status => _status as String;
  final num? _total_events;
  num get total_events => _total_events as num;
  final String? _first_event_at;
  String? get first_event_at => _first_event_at;
  final String? _last_event_at;
  String? get last_event_at => _last_event_at;
  final List<String>? _event_types;
  List<String> get event_types => _event_types as List<String>;
  final List<String>? _segments;
  List<String> get segments => _segments as List<String>;
  final Map<String, Object?>? _tags;
  Map<String, Object?> get tags => _tags as Map<String, Object?>;
  final num? _points_balance;
  num get points_balance => _points_balance as num;
  final num? _lifetime_points;
  num get lifetime_points => _lifetime_points as num;
  final Map<String, Object?>? _attributes;
  Map<String, Object?> get attributes => _attributes as Map<String, Object?>;
  final String? _created_at;
  String get created_at => _created_at as String;
  final String? _discovered_at;
  String? get discovered_at => _discovered_at;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EndUser(
      {required String id,
      required String external_id,
      String? email,
      String? first_name,
      String? last_name,
      String? display_name,
      String? avatar_url,
      String? phone,
      String? date_of_birth,
      String? country,
      String? city,
      String? timezone,
      String? language,
      String? bio,
      String? wallet_address,
      String? wallet_source,
      String? cdp_wallet_address,
      String? wallet_linked_at,
      required String status,
      required num total_events,
      String? first_event_at,
      String? last_event_at,
      required List<String> event_types,
      required List<String> segments,
      required Map<String, Object?> tags,
      required num points_balance,
      required num lifetime_points,
      required Map<String, Object?> attributes,
      required String created_at,
      String? discovered_at})
      : _id = id,
        _external_id = external_id,
        _email = email,
        _first_name = first_name,
        _last_name = last_name,
        _display_name = display_name,
        _avatar_url = avatar_url,
        _phone = phone,
        _date_of_birth = date_of_birth,
        _country = country,
        _city = city,
        _timezone = timezone,
        _language = language,
        _bio = bio,
        _wallet_address = wallet_address,
        _wallet_source = wallet_source,
        _cdp_wallet_address = cdp_wallet_address,
        _wallet_linked_at = wallet_linked_at,
        _status = status,
        _total_events = total_events,
        _first_event_at = first_event_at,
        _last_event_at = last_event_at,
        _event_types = event_types,
        _segments = segments,
        _tags = tags,
        _points_balance = points_balance,
        _lifetime_points = lifetime_points,
        _attributes = attributes,
        _created_at = created_at,
        _discovered_at = discovered_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EndUser.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _external_id =
            json["external_id"] == null ? null : json["external_id"] as String,
        _email = json["email"] == null ? null : json["email"] as String,
        _first_name =
            json["first_name"] == null ? null : json["first_name"] as String,
        _last_name =
            json["last_name"] == null ? null : json["last_name"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _avatar_url =
            json["avatar_url"] == null ? null : json["avatar_url"] as String,
        _phone = json["phone"] == null ? null : json["phone"] as String,
        _date_of_birth = json["date_of_birth"] == null
            ? null
            : json["date_of_birth"] as String,
        _country = json["country"] == null ? null : json["country"] as String,
        _city = json["city"] == null ? null : json["city"] as String,
        _timezone =
            json["timezone"] == null ? null : json["timezone"] as String,
        _language =
            json["language"] == null ? null : json["language"] as String,
        _bio = json["bio"] == null ? null : json["bio"] as String,
        _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _wallet_source = json["wallet_source"] == null
            ? null
            : json["wallet_source"] as String,
        _cdp_wallet_address = json["cdp_wallet_address"] == null
            ? null
            : json["cdp_wallet_address"] as String,
        _wallet_linked_at = json["wallet_linked_at"] == null
            ? null
            : json["wallet_linked_at"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _total_events =
            json["total_events"] == null ? null : json["total_events"] as num,
        _first_event_at = json["first_event_at"] == null
            ? null
            : json["first_event_at"] as String,
        _last_event_at = json["last_event_at"] == null
            ? null
            : json["last_event_at"] as String,
        _event_types = json["event_types"] == null
            ? null
            : (json["event_types"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _segments = json["segments"] == null
            ? null
            : (json["segments"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _tags = json["tags"] == null ? null : asJsonMap(json["tags"]),
        _points_balance = json["points_balance"] == null
            ? null
            : json["points_balance"] as num,
        _lifetime_points = json["lifetime_points"] == null
            ? null
            : json["lifetime_points"] as num,
        _attributes =
            json["attributes"] == null ? null : asJsonMap(json["attributes"]),
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _discovered_at = json["discovered_at"] == null
            ? null
            : json["discovered_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "external_id": jsonValue(_external_id),
        if (_email != null) "email": jsonValue(_email),
        if (_first_name != null) "first_name": jsonValue(_first_name),
        if (_last_name != null) "last_name": jsonValue(_last_name),
        if (_display_name != null) "display_name": jsonValue(_display_name),
        if (_avatar_url != null) "avatar_url": jsonValue(_avatar_url),
        if (_phone != null) "phone": jsonValue(_phone),
        if (_date_of_birth != null) "date_of_birth": jsonValue(_date_of_birth),
        if (_country != null) "country": jsonValue(_country),
        if (_city != null) "city": jsonValue(_city),
        if (_timezone != null) "timezone": jsonValue(_timezone),
        if (_language != null) "language": jsonValue(_language),
        if (_bio != null) "bio": jsonValue(_bio),
        if (_wallet_address != null)
          "wallet_address": jsonValue(_wallet_address),
        if (_wallet_source != null) "wallet_source": jsonValue(_wallet_source),
        if (_cdp_wallet_address != null)
          "cdp_wallet_address": jsonValue(_cdp_wallet_address),
        if (_wallet_linked_at != null)
          "wallet_linked_at": jsonValue(_wallet_linked_at),
        "status": jsonValue(_status),
        "total_events": jsonValue(_total_events),
        if (_first_event_at != null)
          "first_event_at": jsonValue(_first_event_at),
        if (_last_event_at != null) "last_event_at": jsonValue(_last_event_at),
        "event_types": jsonValue(_event_types),
        "segments": jsonValue(_segments),
        "tags": jsonValue(_tags),
        "points_balance": jsonValue(_points_balance),
        "lifetime_points": jsonValue(_lifetime_points),
        "attributes": jsonValue(_attributes),
        "created_at": jsonValue(_created_at),
        if (_discovered_at != null) "discovered_at": jsonValue(_discovered_at),
      };
}

/// JSON model for JavaScript SDK `users.EndUserListResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EndUserListResponse implements JsonModel {
  final JsonMap? _originalJson;
  final List<EndUser>? _users;
  List<EndUser> get users => _users as List<EndUser>;
  final num? _total;
  num get total => _total as num;
  final num? _page;
  num get page => _page as num;
  final num? _page_size;
  num get page_size => _page_size as num;
  final bool? _has_more;
  bool get has_more => _has_more as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EndUserListResponse(
      {required List<EndUser> users,
      required num total,
      required num page,
      required num page_size,
      required bool has_more})
      : _users = users,
        _total = total,
        _page = page,
        _page_size = page_size,
        _has_more = has_more,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EndUserListResponse.fromJson(JsonMap json)
      : _users = json["users"] == null
            ? null
            : (json["users"] as List<Object?>)
                .map((item) => EndUser.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total = json["total"] == null ? null : json["total"] as num,
        _page = json["page"] == null ? null : json["page"] as num,
        _page_size =
            json["page_size"] == null ? null : json["page_size"] as num,
        _has_more = json["has_more"] == null ? null : json["has_more"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "users": jsonValue(_users),
        "total": jsonValue(_total),
        "page": jsonValue(_page),
        "page_size": jsonValue(_page_size),
        "has_more": jsonValue(_has_more),
      };
}

/// JSON model for JavaScript SDK `users.UserActivity`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserActivity implements JsonModel {
  final JsonMap? _originalJson;
  final String? _event_id;
  String get event_id => _event_id as String;
  final String? _event_type;
  String get event_type => _event_type as String;
  final String? _timestamp;
  String get timestamp => _timestamp as String;
  final Map<String, Object?>? _data;
  Map<String, Object?> get data => _data as Map<String, Object?>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserActivity(
      {required String event_id,
      required String event_type,
      required String timestamp,
      required Map<String, Object?> data})
      : _event_id = event_id,
        _event_type = event_type,
        _timestamp = timestamp,
        _data = data,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserActivity.fromJson(JsonMap json)
      : _event_id =
            json["event_id"] == null ? null : json["event_id"] as String,
        _event_type =
            json["event_type"] == null ? null : json["event_type"] as String,
        _timestamp =
            json["timestamp"] == null ? null : json["timestamp"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "event_id": jsonValue(_event_id),
        "event_type": jsonValue(_event_type),
        "timestamp": jsonValue(_timestamp),
        "data": jsonValue(_data),
      };
}

/// JSON model for JavaScript SDK `users.UserActivityResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserActivityResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final List<UserActivity>? _activities;
  List<UserActivity> get activities => _activities as List<UserActivity>;
  final num? _total;
  num get total => _total as num;
  final num? _page;
  num get page => _page as num;
  final num? _page_size;
  num get page_size => _page_size as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserActivityResponse(
      {required String user_id,
      required List<UserActivity> activities,
      required num total,
      required num page,
      required num page_size})
      : _user_id = user_id,
        _activities = activities,
        _total = total,
        _page = page,
        _page_size = page_size,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserActivityResponse.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _activities = json["activities"] == null
            ? null
            : (json["activities"] as List<Object?>)
                .map((item) => UserActivity.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total = json["total"] == null ? null : json["total"] as num,
        _page = json["page"] == null ? null : json["page"] as num,
        _page_size =
            json["page_size"] == null ? null : json["page_size"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "activities": jsonValue(_activities),
        "total": jsonValue(_total),
        "page": jsonValue(_page),
        "page_size": jsonValue(_page_size),
      };
}

/// JSON model for JavaScript SDK `users.CreateEndUserRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateEndUserRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _external_id;
  String get external_id => _external_id as String;
  final String? _email;
  String? get email => _email;
  final String? _first_name;
  String? get first_name => _first_name;
  final String? _last_name;
  String? get last_name => _last_name;
  final String? _display_name;
  String? get display_name => _display_name;
  final String? _phone;
  String? get phone => _phone;
  final String? _date_of_birth;
  String? get date_of_birth => _date_of_birth;
  final String? _country;
  String? get country => _country;
  final String? _city;
  String? get city => _city;
  final String? _timezone;
  String? get timezone => _timezone;
  final String? _language;
  String? get language => _language;
  final String? _bio;
  String? get bio => _bio;
  final String? _wallet_address;
  String? get wallet_address => _wallet_address;
  final List<String>? _segments;
  List<String>? get segments => _segments;
  final Map<String, Object?>? _tags;
  Map<String, Object?>? get tags => _tags;
  final Map<String, Object?>? _attributes;
  Map<String, Object?>? get attributes => _attributes;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateEndUserRequest(
      {required String external_id,
      String? email,
      String? first_name,
      String? last_name,
      String? display_name,
      String? phone,
      String? date_of_birth,
      String? country,
      String? city,
      String? timezone,
      String? language,
      String? bio,
      String? wallet_address,
      List<String>? segments,
      Map<String, Object?>? tags,
      Map<String, Object?>? attributes})
      : _external_id = external_id,
        _email = email,
        _first_name = first_name,
        _last_name = last_name,
        _display_name = display_name,
        _phone = phone,
        _date_of_birth = date_of_birth,
        _country = country,
        _city = city,
        _timezone = timezone,
        _language = language,
        _bio = bio,
        _wallet_address = wallet_address,
        _segments = segments,
        _tags = tags,
        _attributes = attributes,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateEndUserRequest.fromJson(JsonMap json)
      : _external_id =
            json["external_id"] == null ? null : json["external_id"] as String,
        _email = json["email"] == null ? null : json["email"] as String,
        _first_name =
            json["first_name"] == null ? null : json["first_name"] as String,
        _last_name =
            json["last_name"] == null ? null : json["last_name"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _phone = json["phone"] == null ? null : json["phone"] as String,
        _date_of_birth = json["date_of_birth"] == null
            ? null
            : json["date_of_birth"] as String,
        _country = json["country"] == null ? null : json["country"] as String,
        _city = json["city"] == null ? null : json["city"] as String,
        _timezone =
            json["timezone"] == null ? null : json["timezone"] as String,
        _language =
            json["language"] == null ? null : json["language"] as String,
        _bio = json["bio"] == null ? null : json["bio"] as String,
        _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _segments = json["segments"] == null
            ? null
            : (json["segments"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _tags = json["tags"] == null ? null : asJsonMap(json["tags"]),
        _attributes =
            json["attributes"] == null ? null : asJsonMap(json["attributes"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "external_id": jsonValue(_external_id),
        if (_email != null) "email": jsonValue(_email),
        if (_first_name != null) "first_name": jsonValue(_first_name),
        if (_last_name != null) "last_name": jsonValue(_last_name),
        if (_display_name != null) "display_name": jsonValue(_display_name),
        if (_phone != null) "phone": jsonValue(_phone),
        if (_date_of_birth != null) "date_of_birth": jsonValue(_date_of_birth),
        if (_country != null) "country": jsonValue(_country),
        if (_city != null) "city": jsonValue(_city),
        if (_timezone != null) "timezone": jsonValue(_timezone),
        if (_language != null) "language": jsonValue(_language),
        if (_bio != null) "bio": jsonValue(_bio),
        if (_wallet_address != null)
          "wallet_address": jsonValue(_wallet_address),
        if (_segments != null) "segments": jsonValue(_segments),
        if (_tags != null) "tags": jsonValue(_tags),
        if (_attributes != null) "attributes": jsonValue(_attributes),
      };
}

/// JSON model for JavaScript SDK `users.UpdateEndUserRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UpdateEndUserRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _email;
  String? get email => _email;
  final String? _first_name;
  String? get first_name => _first_name;
  final String? _last_name;
  String? get last_name => _last_name;
  final String? _display_name;
  String? get display_name => _display_name;
  final String? _avatar_url;
  String? get avatar_url => _avatar_url;
  final String? _phone;
  String? get phone => _phone;
  final String? _date_of_birth;
  String? get date_of_birth => _date_of_birth;
  final String? _country;
  String? get country => _country;
  final String? _city;
  String? get city => _city;
  final String? _timezone;
  String? get timezone => _timezone;
  final String? _language;
  String? get language => _language;
  final String? _bio;
  String? get bio => _bio;
  final List<String>? _segments;
  List<String>? get segments => _segments;
  final Map<String, Object?>? _tags;
  Map<String, Object?>? get tags => _tags;
  final Map<String, Object?>? _attributes;
  Map<String, Object?>? get attributes => _attributes;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UpdateEndUserRequest(
      {String? email,
      String? first_name,
      String? last_name,
      String? display_name,
      String? avatar_url,
      String? phone,
      String? date_of_birth,
      String? country,
      String? city,
      String? timezone,
      String? language,
      String? bio,
      List<String>? segments,
      Map<String, Object?>? tags,
      Map<String, Object?>? attributes})
      : _email = email,
        _first_name = first_name,
        _last_name = last_name,
        _display_name = display_name,
        _avatar_url = avatar_url,
        _phone = phone,
        _date_of_birth = date_of_birth,
        _country = country,
        _city = city,
        _timezone = timezone,
        _language = language,
        _bio = bio,
        _segments = segments,
        _tags = tags,
        _attributes = attributes,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UpdateEndUserRequest.fromJson(JsonMap json)
      : _email = json["email"] == null ? null : json["email"] as String,
        _first_name =
            json["first_name"] == null ? null : json["first_name"] as String,
        _last_name =
            json["last_name"] == null ? null : json["last_name"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _avatar_url =
            json["avatar_url"] == null ? null : json["avatar_url"] as String,
        _phone = json["phone"] == null ? null : json["phone"] as String,
        _date_of_birth = json["date_of_birth"] == null
            ? null
            : json["date_of_birth"] as String,
        _country = json["country"] == null ? null : json["country"] as String,
        _city = json["city"] == null ? null : json["city"] as String,
        _timezone =
            json["timezone"] == null ? null : json["timezone"] as String,
        _language =
            json["language"] == null ? null : json["language"] as String,
        _bio = json["bio"] == null ? null : json["bio"] as String,
        _segments = json["segments"] == null
            ? null
            : (json["segments"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _tags = json["tags"] == null ? null : asJsonMap(json["tags"]),
        _attributes =
            json["attributes"] == null ? null : asJsonMap(json["attributes"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_email != null) "email": jsonValue(_email),
        if (_first_name != null) "first_name": jsonValue(_first_name),
        if (_last_name != null) "last_name": jsonValue(_last_name),
        if (_display_name != null) "display_name": jsonValue(_display_name),
        if (_avatar_url != null) "avatar_url": jsonValue(_avatar_url),
        if (_phone != null) "phone": jsonValue(_phone),
        if (_date_of_birth != null) "date_of_birth": jsonValue(_date_of_birth),
        if (_country != null) "country": jsonValue(_country),
        if (_city != null) "city": jsonValue(_city),
        if (_timezone != null) "timezone": jsonValue(_timezone),
        if (_language != null) "language": jsonValue(_language),
        if (_bio != null) "bio": jsonValue(_bio),
        if (_segments != null) "segments": jsonValue(_segments),
        if (_tags != null) "tags": jsonValue(_tags),
        if (_attributes != null) "attributes": jsonValue(_attributes),
      };
}

/// JSON model for JavaScript SDK `users.ListEndUsersOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListEndUsersOptions implements JsonModel {
  final JsonMap? _originalJson;
  final num? _page;
  num? get page => _page;
  final num? _page_size;
  num? get page_size => _page_size;
  final String? _search;
  String? get search => _search;
  final String? _status;
  String? get status => _status;
  final String? _segment;
  String? get segment => _segment;
  final bool? _has_wallet;
  bool? get has_wallet => _has_wallet;
  final num? _min_events;
  num? get min_events => _min_events;
  final String? _sort_by;
  String? get sort_by => _sort_by;
  final String? _sort_order;
  String? get sort_order => _sort_order;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListEndUsersOptions(
      {num? page,
      num? page_size,
      String? search,
      String? status,
      String? segment,
      bool? has_wallet,
      num? min_events,
      String? sort_by,
      String? sort_order})
      : _page = page,
        _page_size = page_size,
        _search = search,
        _status = status,
        _segment = segment,
        _has_wallet = has_wallet,
        _min_events = min_events,
        _sort_by = sort_by,
        _sort_order = sort_order,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListEndUsersOptions.fromJson(JsonMap json)
      : _page = json["page"] == null ? null : json["page"] as num,
        _page_size =
            json["page_size"] == null ? null : json["page_size"] as num,
        _search = json["search"] == null ? null : json["search"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _segment = json["segment"] == null ? null : json["segment"] as String,
        _has_wallet =
            json["has_wallet"] == null ? null : json["has_wallet"] as bool,
        _min_events =
            json["min_events"] == null ? null : json["min_events"] as num,
        _sort_by = json["sort_by"] == null ? null : json["sort_by"] as String,
        _sort_order =
            json["sort_order"] == null ? null : json["sort_order"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_page != null) "page": jsonValue(_page),
        if (_page_size != null) "page_size": jsonValue(_page_size),
        if (_search != null) "search": jsonValue(_search),
        if (_status != null) "status": jsonValue(_status),
        if (_segment != null) "segment": jsonValue(_segment),
        if (_has_wallet != null) "has_wallet": jsonValue(_has_wallet),
        if (_min_events != null) "min_events": jsonValue(_min_events),
        if (_sort_by != null) "sort_by": jsonValue(_sort_by),
        if (_sort_order != null) "sort_order": jsonValue(_sort_order),
      };
}

/// JSON model for JavaScript SDK `users.LinkWalletRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class LinkWalletRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_address;
  String? get wallet_address => _wallet_address;
  final String? _wallet_source;
  String? get wallet_source => _wallet_source;
  final String? _signature;
  String? get signature => _signature;
  final bool? _restore_cdp_wallet;
  bool? get restore_cdp_wallet => _restore_cdp_wallet;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const LinkWalletRequest(
      {String? wallet_address,
      String? wallet_source,
      String? signature,
      bool? restore_cdp_wallet})
      : _wallet_address = wallet_address,
        _wallet_source = wallet_source,
        _signature = signature,
        _restore_cdp_wallet = restore_cdp_wallet,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  LinkWalletRequest.fromJson(JsonMap json)
      : _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _wallet_source = json["wallet_source"] == null
            ? null
            : json["wallet_source"] as String,
        _signature =
            json["signature"] == null ? null : json["signature"] as String,
        _restore_cdp_wallet = json["restore_cdp_wallet"] == null
            ? null
            : json["restore_cdp_wallet"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_wallet_address != null)
          "wallet_address": jsonValue(_wallet_address),
        if (_wallet_source != null) "wallet_source": jsonValue(_wallet_source),
        if (_signature != null) "signature": jsonValue(_signature),
        if (_restore_cdp_wallet != null)
          "restore_cdp_wallet": jsonValue(_restore_cdp_wallet),
      };
}

/// JSON model for JavaScript SDK `users.MergeUsersRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class MergeUsersRequest implements JsonModel {
  final JsonMap? _originalJson;
  final List<String>? _source_user_ids;
  List<String> get source_user_ids => _source_user_ids as List<String>;
  final String? _target_user_id;
  String get target_user_id => _target_user_id as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const MergeUsersRequest(
      {required List<String> source_user_ids, required String target_user_id})
      : _source_user_ids = source_user_ids,
        _target_user_id = target_user_id,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  MergeUsersRequest.fromJson(JsonMap json)
      : _source_user_ids = json["source_user_ids"] == null
            ? null
            : (json["source_user_ids"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _target_user_id = json["target_user_id"] == null
            ? null
            : json["target_user_id"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "source_user_ids": jsonValue(_source_user_ids),
        "target_user_id": jsonValue(_target_user_id),
      };
}

/// JSON model for JavaScript SDK `users.CreateWalletRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateUserWalletRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_type;
  String? get wallet_type => _wallet_type;
  final String? _network;
  String? get network => _network;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateUserWalletRequest({String? wallet_type, String? network})
      : _wallet_type = wallet_type,
        _network = network,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateUserWalletRequest.fromJson(JsonMap json)
      : _wallet_type =
            json["wallet_type"] == null ? null : json["wallet_type"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_wallet_type != null) "wallet_type": jsonValue(_wallet_type),
        if (_network != null) "network": jsonValue(_network),
      };
}

/// JSON model for JavaScript SDK `users.RegisterWalletRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class RegisterWalletRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_address;
  String get wallet_address => _wallet_address as String;
  final String? _signature;
  String? get signature => _signature;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const RegisterWalletRequest(
      {required String wallet_address, String? signature})
      : _wallet_address = wallet_address,
        _signature = signature,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  RegisterWalletRequest.fromJson(JsonMap json)
      : _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _signature =
            json["signature"] == null ? null : json["signature"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_address": jsonValue(_wallet_address),
        if (_signature != null) "signature": jsonValue(_signature),
      };
}

/// JSON model for JavaScript SDK `users.UserReward`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserReward implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _reward_name;
  String get reward_name => _reward_name as String;
  final String? _reward_type;
  String get reward_type => _reward_type as String;
  final num? _value;
  num? get value => _value;
  final String? _value_currency;
  String? get value_currency => _value_currency;
  final String? _status;
  String get status => _status as String;
  final String? _earned_at;
  String? get earned_at => _earned_at;
  final String? _distributed_at;
  String? get distributed_at => _distributed_at;
  final num? _nft_token_id;
  num? get nft_token_id => _nft_token_id;
  final String? _nft_tx_hash;
  String? get nft_tx_hash => _nft_tx_hash;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserReward(
      {required String id,
      required String reward_name,
      required String reward_type,
      num? value,
      String? value_currency,
      required String status,
      String? earned_at,
      String? distributed_at,
      num? nft_token_id,
      String? nft_tx_hash})
      : _id = id,
        _reward_name = reward_name,
        _reward_type = reward_type,
        _value = value,
        _value_currency = value_currency,
        _status = status,
        _earned_at = earned_at,
        _distributed_at = distributed_at,
        _nft_token_id = nft_token_id,
        _nft_tx_hash = nft_tx_hash,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserReward.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _reward_name =
            json["reward_name"] == null ? null : json["reward_name"] as String,
        _reward_type =
            json["reward_type"] == null ? null : json["reward_type"] as String,
        _value = json["value"] == null ? null : json["value"] as num,
        _value_currency = json["value_currency"] == null
            ? null
            : json["value_currency"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _earned_at =
            json["earned_at"] == null ? null : json["earned_at"] as String,
        _distributed_at = json["distributed_at"] == null
            ? null
            : json["distributed_at"] as String,
        _nft_token_id =
            json["nft_token_id"] == null ? null : json["nft_token_id"] as num,
        _nft_tx_hash =
            json["nft_tx_hash"] == null ? null : json["nft_tx_hash"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "reward_name": jsonValue(_reward_name),
        "reward_type": jsonValue(_reward_type),
        if (_value != null) "value": jsonValue(_value),
        if (_value_currency != null)
          "value_currency": jsonValue(_value_currency),
        "status": jsonValue(_status),
        if (_earned_at != null) "earned_at": jsonValue(_earned_at),
        if (_distributed_at != null)
          "distributed_at": jsonValue(_distributed_at),
        if (_nft_token_id != null) "nft_token_id": jsonValue(_nft_token_id),
        if (_nft_tx_hash != null) "nft_tx_hash": jsonValue(_nft_tx_hash),
      };
}

/// JSON model for JavaScript SDK `users.UserRewardsResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserRewardsResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final List<UserReward>? _rewards;
  List<UserReward> get rewards => _rewards as List<UserReward>;
  final num? _total;
  num get total => _total as num;
  final num? _page;
  num get page => _page as num;
  final num? _page_size;
  num get page_size => _page_size as num;
  final bool? _has_more;
  bool get has_more => _has_more as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserRewardsResponse(
      {required String user_id,
      required List<UserReward> rewards,
      required num total,
      required num page,
      required num page_size,
      required bool has_more})
      : _user_id = user_id,
        _rewards = rewards,
        _total = total,
        _page = page,
        _page_size = page_size,
        _has_more = has_more,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserRewardsResponse.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _rewards = json["rewards"] == null
            ? null
            : (json["rewards"] as List<Object?>)
                .map((item) => UserReward.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total = json["total"] == null ? null : json["total"] as num,
        _page = json["page"] == null ? null : json["page"] as num,
        _page_size =
            json["page_size"] == null ? null : json["page_size"] as num,
        _has_more = json["has_more"] == null ? null : json["has_more"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "rewards": jsonValue(_rewards),
        "total": jsonValue(_total),
        "page": jsonValue(_page),
        "page_size": jsonValue(_page_size),
        "has_more": jsonValue(_has_more),
      };
}

/// JSON model for JavaScript SDK `users.GDPRDeletionRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class GDPRDeletionRequest implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _confirm;
  bool get confirm => _confirm as bool;
  final bool? _delete_events;
  bool? get delete_events => _delete_events;
  final bool? _delete_wallets;
  bool? get delete_wallets => _delete_wallets;
  final String? _reason;
  String? get reason => _reason;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const GDPRDeletionRequest(
      {required bool confirm,
      bool? delete_events,
      bool? delete_wallets,
      String? reason})
      : _confirm = confirm,
        _delete_events = delete_events,
        _delete_wallets = delete_wallets,
        _reason = reason,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  GDPRDeletionRequest.fromJson(JsonMap json)
      : _confirm = json["confirm"] == null ? null : json["confirm"] as bool,
        _delete_events = json["delete_events"] == null
            ? null
            : json["delete_events"] as bool,
        _delete_wallets = json["delete_wallets"] == null
            ? null
            : json["delete_wallets"] as bool,
        _reason = json["reason"] == null ? null : json["reason"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "confirm": jsonValue(_confirm),
        if (_delete_events != null) "delete_events": jsonValue(_delete_events),
        if (_delete_wallets != null)
          "delete_wallets": jsonValue(_delete_wallets),
        if (_reason != null) "reason": jsonValue(_reason),
      };
}

/// JSON model for JavaScript SDK `users.GDPRDeletionResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class GDPRDeletionResponse implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _success;
  bool get success => _success as bool;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _external_id;
  String get external_id => _external_id as String;
  final Map<String, num>? _deleted_records;
  Map<String, num> get deleted_records => _deleted_records as Map<String, num>;
  final String? _merkle_warning;
  String? get merkle_warning => _merkle_warning;
  final String? _audit_id;
  String? get audit_id => _audit_id;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const GDPRDeletionResponse(
      {required bool success,
      required String user_id,
      required String external_id,
      required Map<String, num> deleted_records,
      String? merkle_warning,
      String? audit_id})
      : _success = success,
        _user_id = user_id,
        _external_id = external_id,
        _deleted_records = deleted_records,
        _merkle_warning = merkle_warning,
        _audit_id = audit_id,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  GDPRDeletionResponse.fromJson(JsonMap json)
      : _success = json["success"] == null ? null : json["success"] as bool,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _external_id =
            json["external_id"] == null ? null : json["external_id"] as String,
        _deleted_records = json["deleted_records"] == null
            ? null
            : asJsonMap(json["deleted_records"])
                .map((key, value) => MapEntry(key, value as num)),
        _merkle_warning = json["merkle_warning"] == null
            ? null
            : json["merkle_warning"] as String,
        _audit_id =
            json["audit_id"] == null ? null : json["audit_id"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "success": jsonValue(_success),
        "user_id": jsonValue(_user_id),
        "external_id": jsonValue(_external_id),
        "deleted_records": jsonValue(_deleted_records),
        if (_merkle_warning != null)
          "merkle_warning": jsonValue(_merkle_warning),
        if (_audit_id != null) "audit_id": jsonValue(_audit_id),
      };
}

/// JSON model for JavaScript SDK `users.GDPRPreviewResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class GDPRPreviewResponse implements JsonModel {
  final JsonMap? _originalJson;
  final Map<String, Object?>? _user;
  Map<String, Object?> get user => _user as Map<String, Object?>;
  final Map<String, num>? _would_delete;
  Map<String, num> get would_delete => _would_delete as Map<String, num>;
  final String? _merkle_warning;
  String? get merkle_warning => _merkle_warning;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const GDPRPreviewResponse(
      {required Map<String, Object?> user,
      required Map<String, num> would_delete,
      String? merkle_warning})
      : _user = user,
        _would_delete = would_delete,
        _merkle_warning = merkle_warning,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  GDPRPreviewResponse.fromJson(JsonMap json)
      : _user = json["user"] == null ? null : asJsonMap(json["user"]),
        _would_delete = json["would_delete"] == null
            ? null
            : asJsonMap(json["would_delete"])
                .map((key, value) => MapEntry(key, value as num)),
        _merkle_warning = json["merkle_warning"] == null
            ? null
            : json["merkle_warning"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user": jsonValue(_user),
        "would_delete": jsonValue(_would_delete),
        if (_merkle_warning != null)
          "merkle_warning": jsonValue(_merkle_warning),
      };
}

/// JSON model for JavaScript SDK `users.WalletCreationResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class WalletCreationResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _success;
  bool get success => _success as bool;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _wallet_address;
  String get wallet_address => _wallet_address as String;
  final String? _wallet_type;
  String? get wallet_type => _wallet_type;
  final String? _network;
  String? get network => _network;
  final String? _source;
  String get source => _source as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const WalletCreationResult(
      {required bool success,
      required String user_id,
      required String wallet_address,
      String? wallet_type,
      String? network,
      required String source})
      : _success = success,
        _user_id = user_id,
        _wallet_address = wallet_address,
        _wallet_type = wallet_type,
        _network = network,
        _source = source,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  WalletCreationResult.fromJson(JsonMap json)
      : _success = json["success"] == null ? null : json["success"] as bool,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _wallet_type =
            json["wallet_type"] == null ? null : json["wallet_type"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _source = json["source"] == null ? null : json["source"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "success": jsonValue(_success),
        "user_id": jsonValue(_user_id),
        "wallet_address": jsonValue(_wallet_address),
        if (_wallet_type != null) "wallet_type": jsonValue(_wallet_type),
        if (_network != null) "network": jsonValue(_network),
        "source": jsonValue(_source),
      };
}

/// JSON model for JavaScript SDK `users.EnsureWalletResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EnsureWalletResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final EnsureWalletResultAssetWallet? _asset_wallet;
  EnsureWalletResultAssetWallet get asset_wallet =>
      _asset_wallet as EnsureWalletResultAssetWallet;
  final EnsureWalletResultSmartWallet? _smart_wallet;
  EnsureWalletResultSmartWallet get smart_wallet =>
      _smart_wallet as EnsureWalletResultSmartWallet;
  final String? _network;
  String get network => _network as String;
  final bool? _created;
  bool get created => _created as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EnsureWalletResult(
      {required String user_id,
      required EnsureWalletResultAssetWallet asset_wallet,
      required EnsureWalletResultSmartWallet smart_wallet,
      required String network,
      required bool created})
      : _user_id = user_id,
        _asset_wallet = asset_wallet,
        _smart_wallet = smart_wallet,
        _network = network,
        _created = created,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EnsureWalletResult.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _asset_wallet = json["asset_wallet"] == null
            ? null
            : EnsureWalletResultAssetWallet.fromJson(
                asJsonMap(json["asset_wallet"])),
        _smart_wallet = json["smart_wallet"] == null
            ? null
            : EnsureWalletResultSmartWallet.fromJson(
                asJsonMap(json["smart_wallet"])),
        _network = json["network"] == null ? null : json["network"] as String,
        _created = json["created"] == null ? null : json["created"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "asset_wallet": jsonValue(_asset_wallet),
        "smart_wallet": jsonValue(_smart_wallet),
        "network": jsonValue(_network),
        "created": jsonValue(_created),
      };
}

/// JSON model for JavaScript SDK `users.SetProfileRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SetProfileRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _email;
  String? get email => _email;
  final String? _first_name;
  String? get first_name => _first_name;
  final String? _last_name;
  String? get last_name => _last_name;
  final String? _display_name;
  String? get display_name => _display_name;
  final String? _avatar_url;
  String? get avatar_url => _avatar_url;
  final String? _phone;
  String? get phone => _phone;
  final String? _date_of_birth;
  String? get date_of_birth => _date_of_birth;
  final String? _country;
  String? get country => _country;
  final String? _city;
  String? get city => _city;
  final String? _timezone;
  String? get timezone => _timezone;
  final String? _language;
  String? get language => _language;
  final String? _bio;
  String? get bio => _bio;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SetProfileRequest(
      {String? email,
      String? first_name,
      String? last_name,
      String? display_name,
      String? avatar_url,
      String? phone,
      String? date_of_birth,
      String? country,
      String? city,
      String? timezone,
      String? language,
      String? bio})
      : _email = email,
        _first_name = first_name,
        _last_name = last_name,
        _display_name = display_name,
        _avatar_url = avatar_url,
        _phone = phone,
        _date_of_birth = date_of_birth,
        _country = country,
        _city = city,
        _timezone = timezone,
        _language = language,
        _bio = bio,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SetProfileRequest.fromJson(JsonMap json)
      : _email = json["email"] == null ? null : json["email"] as String,
        _first_name =
            json["first_name"] == null ? null : json["first_name"] as String,
        _last_name =
            json["last_name"] == null ? null : json["last_name"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _avatar_url =
            json["avatar_url"] == null ? null : json["avatar_url"] as String,
        _phone = json["phone"] == null ? null : json["phone"] as String,
        _date_of_birth = json["date_of_birth"] == null
            ? null
            : json["date_of_birth"] as String,
        _country = json["country"] == null ? null : json["country"] as String,
        _city = json["city"] == null ? null : json["city"] as String,
        _timezone =
            json["timezone"] == null ? null : json["timezone"] as String,
        _language =
            json["language"] == null ? null : json["language"] as String,
        _bio = json["bio"] == null ? null : json["bio"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_email != null) "email": jsonValue(_email),
        if (_first_name != null) "first_name": jsonValue(_first_name),
        if (_last_name != null) "last_name": jsonValue(_last_name),
        if (_display_name != null) "display_name": jsonValue(_display_name),
        if (_avatar_url != null) "avatar_url": jsonValue(_avatar_url),
        if (_phone != null) "phone": jsonValue(_phone),
        if (_date_of_birth != null) "date_of_birth": jsonValue(_date_of_birth),
        if (_country != null) "country": jsonValue(_country),
        if (_city != null) "city": jsonValue(_city),
        if (_timezone != null) "timezone": jsonValue(_timezone),
        if (_language != null) "language": jsonValue(_language),
        if (_bio != null) "bio": jsonValue(_bio),
      };
}

/// JSON model for JavaScript SDK `rewards.RewardDefinition`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class RewardDefinition implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _slug;
  String get slug => _slug as String;
  final String? _description;
  String? get description => _description;
  final String? _reward_type;
  String get reward_type => _reward_type as String;
  final num? _value;
  num? get value => _value;
  final String? _value_currency;
  String? get value_currency => _value_currency;
  final String? _token_contract_address;
  String? get token_contract_address => _token_contract_address;
  final String? _token_symbol;
  String? get token_symbol => _token_symbol;
  final num? _token_decimals;
  num get token_decimals => _token_decimals as num;
  final String? _token_chain;
  String get token_chain => _token_chain as String;
  final String? _nft_minting_strategy;
  String? get nft_minting_strategy => _nft_minting_strategy;
  final num? _nft_pre_mint_count;
  num? get nft_pre_mint_count => _nft_pre_mint_count;
  final num? _nft_minted_pool_count;
  num get nft_minted_pool_count => _nft_minted_pool_count as num;
  final bool? _nft_is_soulbound;
  bool get nft_is_soulbound => _nft_is_soulbound as bool;
  final String? _passport_threshold_id;
  String? get passport_threshold_id => _passport_threshold_id;
  final String? _trigger_type;
  String get trigger_type => _trigger_type as String;
  final Map<String, Object?>? _trigger_config;
  Map<String, Object?>? get trigger_config => _trigger_config;
  final num? _max_per_user;
  num? get max_per_user => _max_per_user;
  final num? _max_total;
  num? get max_total => _max_total;
  final num? _current_issued;
  num get current_issued => _current_issued as num;
  final bool? _is_active;
  bool get is_active => _is_active as bool;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _badge_color;
  String? get badge_color => _badge_color;
  final bool? _attest_on_earn;
  bool get attest_on_earn => _attest_on_earn as bool;
  final String? _anchoring_mode;
  String get anchoring_mode => _anchoring_mode as String;
  final String? _created_at;
  String get created_at => _created_at as String;
  final List<String>? _voucher_product_ids;
  List<String>? get voucher_product_ids => _voucher_product_ids;
  final String? _voucher_campaign_id;
  String? get voucher_campaign_id => _voucher_campaign_id;
  final String? _voucher_language;

  /// ISO-639-1 language of the voucher redemption page.
  String? get voucher_language => _voucher_language;
  final String? _voucher_message;

  /// Message shown on the voucher redemption page.
  String? get voucher_message => _voucher_message;
  final List<String>? _voucher_delivery_methods;

  /// Allowed claim-time delivery methods (`link`, `email`, `sms`).
  List<String>? get voucher_delivery_methods => _voucher_delivery_methods;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const RewardDefinition(
      {required String id,
      required String name,
      required String slug,
      String? description,
      required String reward_type,
      num? value,
      String? value_currency,
      String? token_contract_address,
      String? token_symbol,
      required num token_decimals,
      required String token_chain,
      String? nft_minting_strategy,
      num? nft_pre_mint_count,
      required num nft_minted_pool_count,
      required bool nft_is_soulbound,
      String? passport_threshold_id,
      required String trigger_type,
      Map<String, Object?>? trigger_config,
      num? max_per_user,
      num? max_total,
      required num current_issued,
      required bool is_active,
      String? icon_url,
      String? badge_color,
      required bool attest_on_earn,
      required String anchoring_mode,
      required String created_at,
      List<String>? voucher_product_ids,
      String? voucher_campaign_id,
      String? voucher_language,
      String? voucher_message,
      List<String>? voucher_delivery_methods})
      : _id = id,
        _name = name,
        _slug = slug,
        _description = description,
        _reward_type = reward_type,
        _value = value,
        _value_currency = value_currency,
        _token_contract_address = token_contract_address,
        _token_symbol = token_symbol,
        _token_decimals = token_decimals,
        _token_chain = token_chain,
        _nft_minting_strategy = nft_minting_strategy,
        _nft_pre_mint_count = nft_pre_mint_count,
        _nft_minted_pool_count = nft_minted_pool_count,
        _nft_is_soulbound = nft_is_soulbound,
        _passport_threshold_id = passport_threshold_id,
        _trigger_type = trigger_type,
        _trigger_config = trigger_config,
        _max_per_user = max_per_user,
        _max_total = max_total,
        _current_issued = current_issued,
        _is_active = is_active,
        _icon_url = icon_url,
        _badge_color = badge_color,
        _attest_on_earn = attest_on_earn,
        _anchoring_mode = anchoring_mode,
        _created_at = created_at,
        _voucher_product_ids = voucher_product_ids,
        _voucher_campaign_id = voucher_campaign_id,
        _voucher_language = voucher_language,
        _voucher_message = voucher_message,
        _voucher_delivery_methods = voucher_delivery_methods,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  RewardDefinition.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _reward_type =
            json["reward_type"] == null ? null : json["reward_type"] as String,
        _value = json["value"] == null ? null : json["value"] as num,
        _value_currency = json["value_currency"] == null
            ? null
            : json["value_currency"] as String,
        _token_contract_address = json["token_contract_address"] == null
            ? null
            : json["token_contract_address"] as String,
        _token_symbol = json["token_symbol"] == null
            ? null
            : json["token_symbol"] as String,
        _token_decimals = json["token_decimals"] == null
            ? null
            : json["token_decimals"] as num,
        _token_chain =
            json["token_chain"] == null ? null : json["token_chain"] as String,
        _nft_minting_strategy = json["nft_minting_strategy"] == null
            ? null
            : json["nft_minting_strategy"] as String,
        _nft_pre_mint_count = json["nft_pre_mint_count"] == null
            ? null
            : json["nft_pre_mint_count"] as num,
        _nft_minted_pool_count = json["nft_minted_pool_count"] == null
            ? null
            : json["nft_minted_pool_count"] as num,
        _nft_is_soulbound = json["nft_is_soulbound"] == null
            ? null
            : json["nft_is_soulbound"] as bool,
        _passport_threshold_id = json["passport_threshold_id"] == null
            ? null
            : json["passport_threshold_id"] as String,
        _trigger_type = json["trigger_type"] == null
            ? null
            : json["trigger_type"] as String,
        _trigger_config = json["trigger_config"] == null
            ? null
            : asJsonMap(json["trigger_config"]),
        _max_per_user =
            json["max_per_user"] == null ? null : json["max_per_user"] as num,
        _max_total =
            json["max_total"] == null ? null : json["max_total"] as num,
        _current_issued = json["current_issued"] == null
            ? null
            : json["current_issued"] as num,
        _is_active =
            json["is_active"] == null ? null : json["is_active"] as bool,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _badge_color =
            json["badge_color"] == null ? null : json["badge_color"] as String,
        _attest_on_earn = json["attest_on_earn"] == null
            ? null
            : json["attest_on_earn"] as bool,
        _anchoring_mode = json["anchoring_mode"] == null
            ? null
            : json["anchoring_mode"] as String,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _voucher_product_ids = json["voucher_product_ids"] == null
            ? null
            : (json["voucher_product_ids"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _voucher_campaign_id = json["voucher_campaign_id"] == null
            ? null
            : json["voucher_campaign_id"] as String,
        _voucher_language = json["voucher_language"] == null
            ? null
            : json["voucher_language"] as String,
        _voucher_message = json["voucher_message"] == null
            ? null
            : json["voucher_message"] as String,
        _voucher_delivery_methods = json["voucher_delivery_methods"] == null
            ? null
            : (json["voucher_delivery_methods"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "slug": jsonValue(_slug),
        if (_description != null) "description": jsonValue(_description),
        "reward_type": jsonValue(_reward_type),
        if (_value != null) "value": jsonValue(_value),
        if (_value_currency != null)
          "value_currency": jsonValue(_value_currency),
        if (_token_contract_address != null)
          "token_contract_address": jsonValue(_token_contract_address),
        if (_token_symbol != null) "token_symbol": jsonValue(_token_symbol),
        "token_decimals": jsonValue(_token_decimals),
        "token_chain": jsonValue(_token_chain),
        if (_nft_minting_strategy != null)
          "nft_minting_strategy": jsonValue(_nft_minting_strategy),
        if (_nft_pre_mint_count != null)
          "nft_pre_mint_count": jsonValue(_nft_pre_mint_count),
        "nft_minted_pool_count": jsonValue(_nft_minted_pool_count),
        "nft_is_soulbound": jsonValue(_nft_is_soulbound),
        if (_passport_threshold_id != null)
          "passport_threshold_id": jsonValue(_passport_threshold_id),
        "trigger_type": jsonValue(_trigger_type),
        if (_trigger_config != null)
          "trigger_config": jsonValue(_trigger_config),
        if (_max_per_user != null) "max_per_user": jsonValue(_max_per_user),
        if (_max_total != null) "max_total": jsonValue(_max_total),
        "current_issued": jsonValue(_current_issued),
        "is_active": jsonValue(_is_active),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_badge_color != null) "badge_color": jsonValue(_badge_color),
        "attest_on_earn": jsonValue(_attest_on_earn),
        "anchoring_mode": jsonValue(_anchoring_mode),
        "created_at": jsonValue(_created_at),
        if (_voucher_product_ids != null)
          "voucher_product_ids": jsonValue(_voucher_product_ids),
        if (_voucher_campaign_id != null)
          "voucher_campaign_id": jsonValue(_voucher_campaign_id),
        if (_voucher_language != null)
          "voucher_language": jsonValue(_voucher_language),
        if (_voucher_message != null)
          "voucher_message": jsonValue(_voucher_message),
        if (_voucher_delivery_methods != null)
          "voucher_delivery_methods": jsonValue(_voucher_delivery_methods),
      };
}

/// JSON model for JavaScript SDK `rewards.EarnedReward`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EarnedReward implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _user_external_id;
  String get user_external_id => _user_external_id as String;
  final String? _reward_name;
  String get reward_name => _reward_name as String;
  final String? _reward_type;
  String get reward_type => _reward_type as String;
  final String? _status;
  String get status => _status as String;
  final num? _nft_token_id;
  num? get nft_token_id => _nft_token_id;
  final String? _nft_tx_hash;
  String? get nft_tx_hash => _nft_tx_hash;
  final String? _attestation_id;
  String? get attestation_id => _attestation_id;
  final String? _attestation_status;
  String? get attestation_status => _attestation_status;
  final String? _earned_at;
  String get earned_at => _earned_at as String;
  final String? _distributed_at;
  String? get distributed_at => _distributed_at;
  final String? _voucher_order_id;
  String? get voucher_order_id => _voucher_order_id;
  final String? _voucher_delivery_method;

  /// `link`, `email` or `sms`; null until the voucher is ordered.
  String? get voucher_delivery_method => _voucher_delivery_method;
  final String? _voucher_delivery_status;

  /// `pending`, `delivered`, `failed`, `canceled`, `flagged` or `blocked`.
  String? get voucher_delivery_status => _voucher_delivery_status;
  final String? _voucher_delivery_failure;

  /// Provider failure reason, e.g. `invalid_email`.
  String? get voucher_delivery_failure => _voucher_delivery_failure;
  final String? _voucher_status_updated_at;
  String? get voucher_status_updated_at => _voucher_status_updated_at;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EarnedReward(
      {required String id,
      required String user_id,
      required String user_external_id,
      required String reward_name,
      required String reward_type,
      required String status,
      num? nft_token_id,
      String? nft_tx_hash,
      String? attestation_id,
      String? attestation_status,
      required String earned_at,
      String? distributed_at,
      String? voucher_order_id,
      String? voucher_delivery_method,
      String? voucher_delivery_status,
      String? voucher_delivery_failure,
      String? voucher_status_updated_at})
      : _id = id,
        _user_id = user_id,
        _user_external_id = user_external_id,
        _reward_name = reward_name,
        _reward_type = reward_type,
        _status = status,
        _nft_token_id = nft_token_id,
        _nft_tx_hash = nft_tx_hash,
        _attestation_id = attestation_id,
        _attestation_status = attestation_status,
        _earned_at = earned_at,
        _distributed_at = distributed_at,
        _voucher_order_id = voucher_order_id,
        _voucher_delivery_method = voucher_delivery_method,
        _voucher_delivery_status = voucher_delivery_status,
        _voucher_delivery_failure = voucher_delivery_failure,
        _voucher_status_updated_at = voucher_status_updated_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EarnedReward.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _user_external_id = json["user_external_id"] == null
            ? null
            : json["user_external_id"] as String,
        _reward_name =
            json["reward_name"] == null ? null : json["reward_name"] as String,
        _reward_type =
            json["reward_type"] == null ? null : json["reward_type"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _nft_token_id =
            json["nft_token_id"] == null ? null : json["nft_token_id"] as num,
        _nft_tx_hash =
            json["nft_tx_hash"] == null ? null : json["nft_tx_hash"] as String,
        _attestation_id = json["attestation_id"] == null
            ? null
            : json["attestation_id"] as String,
        _attestation_status = json["attestation_status"] == null
            ? null
            : json["attestation_status"] as String,
        _earned_at =
            json["earned_at"] == null ? null : json["earned_at"] as String,
        _distributed_at = json["distributed_at"] == null
            ? null
            : json["distributed_at"] as String,
        _voucher_order_id = json["voucher_order_id"] == null
            ? null
            : json["voucher_order_id"] as String,
        _voucher_delivery_method = json["voucher_delivery_method"] == null
            ? null
            : json["voucher_delivery_method"] as String,
        _voucher_delivery_status = json["voucher_delivery_status"] == null
            ? null
            : json["voucher_delivery_status"] as String,
        _voucher_delivery_failure = json["voucher_delivery_failure"] == null
            ? null
            : json["voucher_delivery_failure"] as String,
        _voucher_status_updated_at = json["voucher_status_updated_at"] == null
            ? null
            : json["voucher_status_updated_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "user_id": jsonValue(_user_id),
        "user_external_id": jsonValue(_user_external_id),
        "reward_name": jsonValue(_reward_name),
        "reward_type": jsonValue(_reward_type),
        "status": jsonValue(_status),
        if (_nft_token_id != null) "nft_token_id": jsonValue(_nft_token_id),
        if (_nft_tx_hash != null) "nft_tx_hash": jsonValue(_nft_tx_hash),
        if (_attestation_id != null)
          "attestation_id": jsonValue(_attestation_id),
        if (_attestation_status != null)
          "attestation_status": jsonValue(_attestation_status),
        "earned_at": jsonValue(_earned_at),
        if (_distributed_at != null)
          "distributed_at": jsonValue(_distributed_at),
        if (_voucher_order_id != null)
          "voucher_order_id": jsonValue(_voucher_order_id),
        if (_voucher_delivery_method != null)
          "voucher_delivery_method": jsonValue(_voucher_delivery_method),
        if (_voucher_delivery_status != null)
          "voucher_delivery_status": jsonValue(_voucher_delivery_status),
        if (_voucher_delivery_failure != null)
          "voucher_delivery_failure": jsonValue(_voucher_delivery_failure),
        if (_voucher_status_updated_at != null)
          "voucher_status_updated_at": jsonValue(_voucher_status_updated_at),
      };
}

/// JSON model for JavaScript SDK `rewards.UserReward`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class RewardUserReward implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _reward_name;
  String get reward_name => _reward_name as String;
  final String? _reward_type;
  String get reward_type => _reward_type as String;
  final String? _category;
  String? get category => _category;
  final String? _slug;
  String? get slug => _slug;
  final String? _description;
  String? get description => _description;
  final String? _status;
  String get status => _status as String;
  final num? _value;
  num? get value => _value;
  final String? _value_currency;
  String? get value_currency => _value_currency;
  final String? _image_url;
  String? get image_url => _image_url;
  final String? _badge_color;
  String? get badge_color => _badge_color;
  final num? _nft_token_id;
  num? get nft_token_id => _nft_token_id;
  final String? _nft_tx_hash;
  String? get nft_tx_hash => _nft_tx_hash;
  final String? _earned_at;
  String get earned_at => _earned_at as String;
  final String? _distributed_at;
  String? get distributed_at => _distributed_at;
  final String? _expires_at;
  String? get expires_at => _expires_at;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const RewardUserReward(
      {required String id,
      required String reward_name,
      required String reward_type,
      String? category,
      String? slug,
      String? description,
      required String status,
      num? value,
      String? value_currency,
      String? image_url,
      String? badge_color,
      num? nft_token_id,
      String? nft_tx_hash,
      required String earned_at,
      String? distributed_at,
      String? expires_at})
      : _id = id,
        _reward_name = reward_name,
        _reward_type = reward_type,
        _category = category,
        _slug = slug,
        _description = description,
        _status = status,
        _value = value,
        _value_currency = value_currency,
        _image_url = image_url,
        _badge_color = badge_color,
        _nft_token_id = nft_token_id,
        _nft_tx_hash = nft_tx_hash,
        _earned_at = earned_at,
        _distributed_at = distributed_at,
        _expires_at = expires_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  RewardUserReward.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _reward_name =
            json["reward_name"] == null ? null : json["reward_name"] as String,
        _reward_type =
            json["reward_type"] == null ? null : json["reward_type"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _value = json["value"] == null ? null : json["value"] as num,
        _value_currency = json["value_currency"] == null
            ? null
            : json["value_currency"] as String,
        _image_url =
            json["image_url"] == null ? null : json["image_url"] as String,
        _badge_color =
            json["badge_color"] == null ? null : json["badge_color"] as String,
        _nft_token_id =
            json["nft_token_id"] == null ? null : json["nft_token_id"] as num,
        _nft_tx_hash =
            json["nft_tx_hash"] == null ? null : json["nft_tx_hash"] as String,
        _earned_at =
            json["earned_at"] == null ? null : json["earned_at"] as String,
        _distributed_at = json["distributed_at"] == null
            ? null
            : json["distributed_at"] as String,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "reward_name": jsonValue(_reward_name),
        "reward_type": jsonValue(_reward_type),
        if (_category != null) "category": jsonValue(_category),
        if (_slug != null) "slug": jsonValue(_slug),
        if (_description != null) "description": jsonValue(_description),
        "status": jsonValue(_status),
        if (_value != null) "value": jsonValue(_value),
        if (_value_currency != null)
          "value_currency": jsonValue(_value_currency),
        if (_image_url != null) "image_url": jsonValue(_image_url),
        if (_badge_color != null) "badge_color": jsonValue(_badge_color),
        if (_nft_token_id != null) "nft_token_id": jsonValue(_nft_token_id),
        if (_nft_tx_hash != null) "nft_tx_hash": jsonValue(_nft_tx_hash),
        "earned_at": jsonValue(_earned_at),
        if (_distributed_at != null)
          "distributed_at": jsonValue(_distributed_at),
        if (_expires_at != null) "expires_at": jsonValue(_expires_at),
      };
}

/// JSON model for JavaScript SDK `rewards.RewardAsset`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class RewardAsset implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _definition_id;
  String get definition_id => _definition_id as String;
  final String? _asset_type;
  String get asset_type => _asset_type as String;
  final String? _file_path;
  String get file_path => _file_path as String;
  final String? _mime_type;
  String get mime_type => _mime_type as String;
  final num? _file_size;
  num get file_size => _file_size as num;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const RewardAsset(
      {required String id,
      required String definition_id,
      required String asset_type,
      required String file_path,
      required String mime_type,
      required num file_size,
      Map<String, Object?>? metadata,
      required String created_at})
      : _id = id,
        _definition_id = definition_id,
        _asset_type = asset_type,
        _file_path = file_path,
        _mime_type = mime_type,
        _file_size = file_size,
        _metadata = metadata,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  RewardAsset.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _definition_id = json["definition_id"] == null
            ? null
            : json["definition_id"] as String,
        _asset_type =
            json["asset_type"] == null ? null : json["asset_type"] as String,
        _file_path =
            json["file_path"] == null ? null : json["file_path"] as String,
        _mime_type =
            json["mime_type"] == null ? null : json["mime_type"] as String,
        _file_size =
            json["file_size"] == null ? null : json["file_size"] as num,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "definition_id": jsonValue(_definition_id),
        "asset_type": jsonValue(_asset_type),
        "file_path": jsonValue(_file_path),
        "mime_type": jsonValue(_mime_type),
        "file_size": jsonValue(_file_size),
        if (_metadata != null) "metadata": jsonValue(_metadata),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `rewards.CreateRewardDefinitionRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateRewardDefinitionRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _slug;
  String get slug => _slug as String;
  final String? _description;
  String? get description => _description;
  final String? _campaign_id;
  String? get campaign_id => _campaign_id;
  final String? _reward_type;
  String? get reward_type => _reward_type;
  final num? _value;
  num? get value => _value;
  final String? _value_currency;
  String? get value_currency => _value_currency;
  final String? _token_contract_address;
  String? get token_contract_address => _token_contract_address;
  final String? _token_symbol;
  String? get token_symbol => _token_symbol;
  final num? _token_decimals;
  num? get token_decimals => _token_decimals;
  final String? _token_chain;
  String? get token_chain => _token_chain;
  final Map<String, Object?>? _nft_metadata_template;
  Map<String, Object?>? get nft_metadata_template => _nft_metadata_template;
  final bool? _nft_is_soulbound;
  bool? get nft_is_soulbound => _nft_is_soulbound;
  final num? _nft_validity_days;
  num? get nft_validity_days => _nft_validity_days;
  final String? _nft_minting_strategy;
  String? get nft_minting_strategy => _nft_minting_strategy;
  final num? _nft_pre_mint_count;
  num? get nft_pre_mint_count => _nft_pre_mint_count;
  final String? _passport_threshold_id;
  String? get passport_threshold_id => _passport_threshold_id;
  final String? _trigger_type;
  String? get trigger_type => _trigger_type;
  final Map<String, Object?>? _trigger_config;
  Map<String, Object?>? get trigger_config => _trigger_config;
  final num? _max_per_user;
  num? get max_per_user => _max_per_user;
  final num? _max_total;
  num? get max_total => _max_total;
  final bool? _is_active;
  bool? get is_active => _is_active;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _badge_color;
  String? get badge_color => _badge_color;
  final bool? _is_public;
  bool? get is_public => _is_public;
  final bool? _attest_on_earn;
  bool? get attest_on_earn => _attest_on_earn;
  final String? _anchoring_mode;
  String? get anchoring_mode => _anchoring_mode;
  final List<String>? _voucher_product_ids;
  List<String>? get voucher_product_ids => _voucher_product_ids;
  final String? _voucher_campaign_id;
  String? get voucher_campaign_id => _voucher_campaign_id;
  final String? _voucher_language;

  /// 2-letter ISO-639-1 code translating the redemption page (e.g. `fr`).
  String? get voucher_language => _voucher_language;
  final String? _voucher_message;

  /// Message (max 1000 chars) shown on the redemption page.
  String? get voucher_message => _voucher_message;
  final List<String>? _voucher_delivery_methods;

  /// Allowed claim-time delivery methods (`link`, `email`, `sms`); omitted
  /// means `["link"]`. Email/SMS buy the gift card when the fan claims.
  List<String>? get voucher_delivery_methods => _voucher_delivery_methods;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateRewardDefinitionRequest(
      {required String name,
      required String slug,
      String? description,
      String? campaign_id,
      String? reward_type,
      num? value,
      String? value_currency,
      String? token_contract_address,
      String? token_symbol,
      num? token_decimals,
      String? token_chain,
      Map<String, Object?>? nft_metadata_template,
      bool? nft_is_soulbound,
      num? nft_validity_days,
      String? nft_minting_strategy,
      num? nft_pre_mint_count,
      String? passport_threshold_id,
      String? trigger_type,
      Map<String, Object?>? trigger_config,
      num? max_per_user,
      num? max_total,
      bool? is_active,
      String? icon_url,
      String? badge_color,
      bool? is_public,
      bool? attest_on_earn,
      String? anchoring_mode,
      List<String>? voucher_product_ids,
      String? voucher_campaign_id,
      String? voucher_language,
      String? voucher_message,
      List<String>? voucher_delivery_methods})
      : _name = name,
        _slug = slug,
        _description = description,
        _campaign_id = campaign_id,
        _reward_type = reward_type,
        _value = value,
        _value_currency = value_currency,
        _token_contract_address = token_contract_address,
        _token_symbol = token_symbol,
        _token_decimals = token_decimals,
        _token_chain = token_chain,
        _nft_metadata_template = nft_metadata_template,
        _nft_is_soulbound = nft_is_soulbound,
        _nft_validity_days = nft_validity_days,
        _nft_minting_strategy = nft_minting_strategy,
        _nft_pre_mint_count = nft_pre_mint_count,
        _passport_threshold_id = passport_threshold_id,
        _trigger_type = trigger_type,
        _trigger_config = trigger_config,
        _max_per_user = max_per_user,
        _max_total = max_total,
        _is_active = is_active,
        _icon_url = icon_url,
        _badge_color = badge_color,
        _is_public = is_public,
        _attest_on_earn = attest_on_earn,
        _anchoring_mode = anchoring_mode,
        _voucher_product_ids = voucher_product_ids,
        _voucher_campaign_id = voucher_campaign_id,
        _voucher_language = voucher_language,
        _voucher_message = voucher_message,
        _voucher_delivery_methods = voucher_delivery_methods,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateRewardDefinitionRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _campaign_id =
            json["campaign_id"] == null ? null : json["campaign_id"] as String,
        _reward_type =
            json["reward_type"] == null ? null : json["reward_type"] as String,
        _value = json["value"] == null ? null : json["value"] as num,
        _value_currency = json["value_currency"] == null
            ? null
            : json["value_currency"] as String,
        _token_contract_address = json["token_contract_address"] == null
            ? null
            : json["token_contract_address"] as String,
        _token_symbol = json["token_symbol"] == null
            ? null
            : json["token_symbol"] as String,
        _token_decimals = json["token_decimals"] == null
            ? null
            : json["token_decimals"] as num,
        _token_chain =
            json["token_chain"] == null ? null : json["token_chain"] as String,
        _nft_metadata_template = json["nft_metadata_template"] == null
            ? null
            : asJsonMap(json["nft_metadata_template"]),
        _nft_is_soulbound = json["nft_is_soulbound"] == null
            ? null
            : json["nft_is_soulbound"] as bool,
        _nft_validity_days = json["nft_validity_days"] == null
            ? null
            : json["nft_validity_days"] as num,
        _nft_minting_strategy = json["nft_minting_strategy"] == null
            ? null
            : json["nft_minting_strategy"] as String,
        _nft_pre_mint_count = json["nft_pre_mint_count"] == null
            ? null
            : json["nft_pre_mint_count"] as num,
        _passport_threshold_id = json["passport_threshold_id"] == null
            ? null
            : json["passport_threshold_id"] as String,
        _trigger_type = json["trigger_type"] == null
            ? null
            : json["trigger_type"] as String,
        _trigger_config = json["trigger_config"] == null
            ? null
            : asJsonMap(json["trigger_config"]),
        _max_per_user =
            json["max_per_user"] == null ? null : json["max_per_user"] as num,
        _max_total =
            json["max_total"] == null ? null : json["max_total"] as num,
        _is_active =
            json["is_active"] == null ? null : json["is_active"] as bool,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _badge_color =
            json["badge_color"] == null ? null : json["badge_color"] as String,
        _is_public =
            json["is_public"] == null ? null : json["is_public"] as bool,
        _attest_on_earn = json["attest_on_earn"] == null
            ? null
            : json["attest_on_earn"] as bool,
        _anchoring_mode = json["anchoring_mode"] == null
            ? null
            : json["anchoring_mode"] as String,
        _voucher_product_ids = json["voucher_product_ids"] == null
            ? null
            : (json["voucher_product_ids"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _voucher_campaign_id = json["voucher_campaign_id"] == null
            ? null
            : json["voucher_campaign_id"] as String,
        _voucher_language = json["voucher_language"] == null
            ? null
            : json["voucher_language"] as String,
        _voucher_message = json["voucher_message"] == null
            ? null
            : json["voucher_message"] as String,
        _voucher_delivery_methods = json["voucher_delivery_methods"] == null
            ? null
            : (json["voucher_delivery_methods"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        "slug": jsonValue(_slug),
        if (_description != null) "description": jsonValue(_description),
        if (_campaign_id != null) "campaign_id": jsonValue(_campaign_id),
        if (_reward_type != null) "reward_type": jsonValue(_reward_type),
        if (_value != null) "value": jsonValue(_value),
        if (_value_currency != null)
          "value_currency": jsonValue(_value_currency),
        if (_token_contract_address != null)
          "token_contract_address": jsonValue(_token_contract_address),
        if (_token_symbol != null) "token_symbol": jsonValue(_token_symbol),
        if (_token_decimals != null)
          "token_decimals": jsonValue(_token_decimals),
        if (_token_chain != null) "token_chain": jsonValue(_token_chain),
        if (_nft_metadata_template != null)
          "nft_metadata_template": jsonValue(_nft_metadata_template),
        if (_nft_is_soulbound != null)
          "nft_is_soulbound": jsonValue(_nft_is_soulbound),
        if (_nft_validity_days != null)
          "nft_validity_days": jsonValue(_nft_validity_days),
        if (_nft_minting_strategy != null)
          "nft_minting_strategy": jsonValue(_nft_minting_strategy),
        if (_nft_pre_mint_count != null)
          "nft_pre_mint_count": jsonValue(_nft_pre_mint_count),
        if (_passport_threshold_id != null)
          "passport_threshold_id": jsonValue(_passport_threshold_id),
        if (_trigger_type != null) "trigger_type": jsonValue(_trigger_type),
        if (_trigger_config != null)
          "trigger_config": jsonValue(_trigger_config),
        if (_max_per_user != null) "max_per_user": jsonValue(_max_per_user),
        if (_max_total != null) "max_total": jsonValue(_max_total),
        if (_is_active != null) "is_active": jsonValue(_is_active),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_badge_color != null) "badge_color": jsonValue(_badge_color),
        if (_is_public != null) "is_public": jsonValue(_is_public),
        if (_attest_on_earn != null)
          "attest_on_earn": jsonValue(_attest_on_earn),
        if (_anchoring_mode != null)
          "anchoring_mode": jsonValue(_anchoring_mode),
        if (_voucher_product_ids != null)
          "voucher_product_ids": jsonValue(_voucher_product_ids),
        if (_voucher_campaign_id != null)
          "voucher_campaign_id": jsonValue(_voucher_campaign_id),
        if (_voucher_language != null)
          "voucher_language": jsonValue(_voucher_language),
        if (_voucher_message != null)
          "voucher_message": jsonValue(_voucher_message),
        if (_voucher_delivery_methods != null)
          "voucher_delivery_methods": jsonValue(_voucher_delivery_methods),
      };
}

/// JSON model for JavaScript SDK `rewards.ManualRewardRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ManualRewardRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _definition_id;
  String get definition_id => _definition_id as String;
  final List<String>? _user_ids;
  List<String> get user_ids => _user_ids as List<String>;
  final Map<String, Object?>? _trigger_data;
  Map<String, Object?>? get trigger_data => _trigger_data;
  final bool? _distribute_immediately;
  bool? get distribute_immediately => _distribute_immediately;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ManualRewardRequest(
      {required String definition_id,
      required List<String> user_ids,
      Map<String, Object?>? trigger_data,
      bool? distribute_immediately})
      : _definition_id = definition_id,
        _user_ids = user_ids,
        _trigger_data = trigger_data,
        _distribute_immediately = distribute_immediately,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ManualRewardRequest.fromJson(JsonMap json)
      : _definition_id = json["definition_id"] == null
            ? null
            : json["definition_id"] as String,
        _user_ids = json["user_ids"] == null
            ? null
            : (json["user_ids"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _trigger_data = json["trigger_data"] == null
            ? null
            : asJsonMap(json["trigger_data"]),
        _distribute_immediately = json["distribute_immediately"] == null
            ? null
            : json["distribute_immediately"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "definition_id": jsonValue(_definition_id),
        "user_ids": jsonValue(_user_ids),
        if (_trigger_data != null) "trigger_data": jsonValue(_trigger_data),
        if (_distribute_immediately != null)
          "distribute_immediately": jsonValue(_distribute_immediately),
      };
}

/// JSON model for JavaScript SDK `rewards.ClaimNFTResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ClaimNFTResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _success;
  bool get success => _success as bool;
  final String? _reward_id;
  String get reward_id => _reward_id as String;
  final num? _token_id;
  num? get token_id => _token_id;
  final String? _tx_hash;
  String get tx_hash => _tx_hash as String;
  final String? _wallet_address;
  String get wallet_address => _wallet_address as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ClaimNFTResult(
      {required bool success,
      required String reward_id,
      num? token_id,
      required String tx_hash,
      required String wallet_address})
      : _success = success,
        _reward_id = reward_id,
        _token_id = token_id,
        _tx_hash = tx_hash,
        _wallet_address = wallet_address,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ClaimNFTResult.fromJson(JsonMap json)
      : _success = json["success"] == null ? null : json["success"] as bool,
        _reward_id =
            json["reward_id"] == null ? null : json["reward_id"] as String,
        _token_id = json["token_id"] == null ? null : json["token_id"] as num,
        _tx_hash = json["tx_hash"] == null ? null : json["tx_hash"] as String,
        _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "success": jsonValue(_success),
        "reward_id": jsonValue(_reward_id),
        if (_token_id != null) "token_id": jsonValue(_token_id),
        "tx_hash": jsonValue(_tx_hash),
        "wallet_address": jsonValue(_wallet_address),
      };
}

/// JSON model for the voucher (gift card) claim response.
///
/// [redemption_url] is a secret, single-use-style link: open it directly and
/// never persist, log or cache it. Each claim call returns a fresh link.
class ClaimVoucherResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _success;
  bool get success => _success as bool;
  final String? _reward_id;
  String get reward_id => _reward_id as String;
  final String? _status;
  String get status => _status as String;
  final String? _redemption_url;

  /// Null for email/SMS delivery (the provider sends the voucher).
  String? get redemption_url => _redemption_url;
  final String? _expires_at;
  String? get expires_at => _expires_at;
  final String? _delivery_method;

  /// `link`, `email` or `sms`.
  String? get delivery_method => _delivery_method;
  final String? _delivery_status;

  /// `pending`, `delivered`, `failed`, `canceled`, `flagged` or `blocked`.
  String? get delivery_status => _delivery_status;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ClaimVoucherResult(
      {required bool success,
      required String reward_id,
      required String status,
      String? redemption_url,
      String? expires_at,
      String? delivery_method,
      String? delivery_status})
      : _success = success,
        _reward_id = reward_id,
        _status = status,
        _redemption_url = redemption_url,
        _expires_at = expires_at,
        _delivery_method = delivery_method,
        _delivery_status = delivery_status,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ClaimVoucherResult.fromJson(JsonMap json)
      : _success = json["success"] == null ? null : json["success"] as bool,
        _reward_id =
            json["reward_id"] == null ? null : json["reward_id"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _redemption_url = json["redemption_url"] == null
            ? null
            : json["redemption_url"] as String,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _delivery_method = json["delivery_method"] == null
            ? null
            : json["delivery_method"] as String,
        _delivery_status = json["delivery_status"] == null
            ? null
            : json["delivery_status"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "success": jsonValue(_success),
        "reward_id": jsonValue(_reward_id),
        "status": jsonValue(_status),
        if (_redemption_url != null)
          "redemption_url": jsonValue(_redemption_url),
        if (_expires_at != null) "expires_at": jsonValue(_expires_at),
        if (_delivery_method != null)
          "delivery_method": jsonValue(_delivery_method),
        if (_delivery_status != null)
          "delivery_status": jsonValue(_delivery_status),
      };
}

/// How a voucher is delivered when claimed (`claimVoucher`).
///
/// [method] is `link`, `email` or `sms` (see `voucherDeliveryLink` etc.).
/// `email` requires [email]; `sms` requires an E.164 [phone]; [name] is an
/// optional greeting. Contact details are passed straight to the voucher
/// provider and are never stored by Proofchain or this SDK.
class VoucherDelivery implements JsonModel {
  final String method;
  final String? email;
  final String? phone;
  final String? name;

  const VoucherDelivery(
      {required this.method, this.email, this.phone, this.name});

  /// Encodes the delivery, omitting null contact fields.
  @override
  JsonMap toJson() => {
        "method": method,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
        if (name != null) "name": name,
      };
}

/// Face-value band a voucher product accepts for one currency.
class VoucherProductSku implements JsonModel {
  final JsonMap? _originalJson;
  final num? _min;
  num get min => _min as num;
  final num? _max;
  num get max => _max as num;
  final String? _currency_code;
  String get currency_code => _currency_code as String;

  /// Creates a model from typed fields.
  const VoucherProductSku(
      {required num min, required num max, required String currency_code})
      : _min = min,
        _max = max,
        _currency_code = currency_code,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  VoucherProductSku.fromJson(JsonMap json)
      : _min = json["min"] == null ? null : json["min"] as num,
        _max = json["max"] == null ? null : json["max"] as num,
        _currency_code = json["currency_code"] == null
            ? null
            : json["currency_code"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "min": jsonValue(_min),
        "max": jsonValue(_max),
        "currency_code": jsonValue(_currency_code),
      };
}

/// Voucher catalog product usable in `voucher_product_ids`.
///
/// Several product ids (or `voucherAllFeeFree`) let the fan choose on the
/// redemption page.
class VoucherProduct implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _category;
  String get category => _category as String;
  final String? _subcategory;
  String? get subcategory => _subcategory;
  final String? _image_url;
  String? get image_url => _image_url;
  final List<String>? _currency_codes;
  List<String> get currency_codes => _currency_codes as List<String>;
  final List<String>? _countries;
  List<String> get countries => _countries as List<String>;
  final List<VoucherProductSku>? _skus;
  List<VoucherProductSku> get skus => _skus as List<VoucherProductSku>;
  final String? _description;
  String? get description => _description;
  final String? _disclosure;

  /// Provider legal HTML. Untrusted: sanitize before rendering.
  String? get disclosure => _disclosure;
  final String? _usage_instructions;
  String? get usage_instructions => _usage_instructions;
  final bool? _fee_free;

  /// Whether the product carries no fee; `false` when absent.
  bool get fee_free => _fee_free ?? false;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const VoucherProduct(
      {required String id,
      required String name,
      required String category,
      String? subcategory,
      String? image_url,
      required List<String> currency_codes,
      required List<String> countries,
      required List<VoucherProductSku> skus,
      String? description,
      String? disclosure,
      String? usage_instructions,
      bool fee_free = false})
      : _id = id,
        _name = name,
        _category = category,
        _subcategory = subcategory,
        _image_url = image_url,
        _currency_codes = currency_codes,
        _countries = countries,
        _skus = skus,
        _description = description,
        _disclosure = disclosure,
        _usage_instructions = usage_instructions,
        _fee_free = fee_free,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  VoucherProduct.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _subcategory =
            json["subcategory"] == null ? null : json["subcategory"] as String,
        _image_url =
            json["image_url"] == null ? null : json["image_url"] as String,
        _currency_codes = json["currency_codes"] == null
            ? null
            : (json["currency_codes"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _countries = json["countries"] == null
            ? null
            : (json["countries"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _skus = json["skus"] == null
            ? null
            : (json["skus"] as List<Object?>)
                .map((item) => VoucherProductSku.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _description =
            json["description"] == null ? null : json["description"] as String,
        _disclosure =
            json["disclosure"] == null ? null : json["disclosure"] as String,
        _usage_instructions = json["usage_instructions"] == null
            ? null
            : json["usage_instructions"] as String,
        _fee_free = json["fee_free"] == null ? null : json["fee_free"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "category": jsonValue(_category),
        if (_subcategory != null) "subcategory": jsonValue(_subcategory),
        if (_image_url != null) "image_url": jsonValue(_image_url),
        "currency_codes": jsonValue(_currency_codes),
        "countries": jsonValue(_countries),
        "skus": jsonValue(_skus),
        if (_description != null) "description": jsonValue(_description),
        if (_disclosure != null) "disclosure": jsonValue(_disclosure),
        if (_usage_instructions != null)
          "usage_instructions": jsonValue(_usage_instructions),
        "fee_free": fee_free,
      };
}

/// JSON model for JavaScript SDK `rewards.DistributeResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DistributeResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _success;
  bool get success => _success as bool;
  final String? _reward_id;
  String get reward_id => _reward_id as String;
  final String? _message;
  String get message => _message as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DistributeResult(
      {required bool success,
      required String reward_id,
      required String message})
      : _success = success,
        _reward_id = reward_id,
        _message = message,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DistributeResult.fromJson(JsonMap json)
      : _success = json["success"] == null ? null : json["success"] as bool,
        _reward_id =
            json["reward_id"] == null ? null : json["reward_id"] as String,
        _message = json["message"] == null ? null : json["message"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "success": jsonValue(_success),
        "reward_id": jsonValue(_reward_id),
        "message": jsonValue(_message),
      };
}

/// JSON model for JavaScript SDK `rewards.RevokeResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class RevokeResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _success;
  bool get success => _success as bool;
  final String? _reward_id;
  String get reward_id => _reward_id as String;
  final String? _status;
  String get status => _status as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const RevokeResult(
      {required bool success,
      required String reward_id,
      required String status})
      : _success = success,
        _reward_id = reward_id,
        _status = status,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  RevokeResult.fromJson(JsonMap json)
      : _success = json["success"] == null ? null : json["success"] as bool,
        _reward_id =
            json["reward_id"] == null ? null : json["reward_id"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "success": jsonValue(_success),
        "reward_id": jsonValue(_reward_id),
        "status": jsonValue(_status),
      };
}

/// JSON model for JavaScript SDK `rewards.RewardAttestationResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class RewardAttestationResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _attestation_id;
  String get attestation_id => _attestation_id as String;
  final String? _attestation_uid;
  String get attestation_uid => _attestation_uid as String;
  final String? _status;
  String get status => _status as String;
  final String? _signature;
  String? get signature => _signature;
  final String? _tx_hash;
  String? get tx_hash => _tx_hash;
  final String? _subject_address;
  String get subject_address => _subject_address as String;
  final String? _reward_id;
  String get reward_id => _reward_id as String;
  final String? _reward_name;
  String get reward_name => _reward_name as String;
  final String? _earned_at;
  String get earned_at => _earned_at as String;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const RewardAttestationResult(
      {required String attestation_id,
      required String attestation_uid,
      required String status,
      String? signature,
      String? tx_hash,
      required String subject_address,
      required String reward_id,
      required String reward_name,
      required String earned_at,
      required String created_at})
      : _attestation_id = attestation_id,
        _attestation_uid = attestation_uid,
        _status = status,
        _signature = signature,
        _tx_hash = tx_hash,
        _subject_address = subject_address,
        _reward_id = reward_id,
        _reward_name = reward_name,
        _earned_at = earned_at,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  RewardAttestationResult.fromJson(JsonMap json)
      : _attestation_id = json["attestation_id"] == null
            ? null
            : json["attestation_id"] as String,
        _attestation_uid = json["attestation_uid"] == null
            ? null
            : json["attestation_uid"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _signature =
            json["signature"] == null ? null : json["signature"] as String,
        _tx_hash = json["tx_hash"] == null ? null : json["tx_hash"] as String,
        _subject_address = json["subject_address"] == null
            ? null
            : json["subject_address"] as String,
        _reward_id =
            json["reward_id"] == null ? null : json["reward_id"] as String,
        _reward_name =
            json["reward_name"] == null ? null : json["reward_name"] as String,
        _earned_at =
            json["earned_at"] == null ? null : json["earned_at"] as String,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "attestation_id": jsonValue(_attestation_id),
        "attestation_uid": jsonValue(_attestation_uid),
        "status": jsonValue(_status),
        if (_signature != null) "signature": jsonValue(_signature),
        if (_tx_hash != null) "tx_hash": jsonValue(_tx_hash),
        "subject_address": jsonValue(_subject_address),
        "reward_id": jsonValue(_reward_id),
        "reward_name": jsonValue(_reward_name),
        "earned_at": jsonValue(_earned_at),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `rewards.AnchorResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class AnchorResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _success;
  bool get success => _success as bool;
  final String? _reward_id;
  String get reward_id => _reward_id as String;
  final String? _attestation_id;
  String get attestation_id => _attestation_id as String;
  final String? _tx_hash;
  String get tx_hash => _tx_hash as String;
  final String? _status;
  String get status => _status as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const AnchorResult(
      {required bool success,
      required String reward_id,
      required String attestation_id,
      required String tx_hash,
      required String status})
      : _success = success,
        _reward_id = reward_id,
        _attestation_id = attestation_id,
        _tx_hash = tx_hash,
        _status = status,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  AnchorResult.fromJson(JsonMap json)
      : _success = json["success"] == null ? null : json["success"] as bool,
        _reward_id =
            json["reward_id"] == null ? null : json["reward_id"] as String,
        _attestation_id = json["attestation_id"] == null
            ? null
            : json["attestation_id"] as String,
        _tx_hash = json["tx_hash"] == null ? null : json["tx_hash"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "success": jsonValue(_success),
        "reward_id": jsonValue(_reward_id),
        "attestation_id": jsonValue(_attestation_id),
        "tx_hash": jsonValue(_tx_hash),
        "status": jsonValue(_status),
      };
}

/// JSON model for JavaScript SDK `rewards.VerifyResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class RewardVerifyResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _is_valid;
  bool get is_valid => _is_valid as bool;
  final String? _attestation_uid;
  String get attestation_uid => _attestation_uid as String;
  final String? _status;
  String get status => _status as String;
  final String? _subject_address;
  String get subject_address => _subject_address as String;
  final String? _attester_address;
  String get attester_address => _attester_address as String;
  final String? _signature_type;
  String get signature_type => _signature_type as String;
  final bool? _on_chain;
  bool get on_chain => _on_chain as bool;
  final String? _tx_hash;
  String? get tx_hash => _tx_hash;
  final String? _reward_id;
  String get reward_id => _reward_id as String;
  final String? _reward_name;
  String get reward_name => _reward_name as String;
  final String? _earned_at;
  String? get earned_at => _earned_at;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const RewardVerifyResult(
      {required bool is_valid,
      required String attestation_uid,
      required String status,
      required String subject_address,
      required String attester_address,
      required String signature_type,
      required bool on_chain,
      String? tx_hash,
      required String reward_id,
      required String reward_name,
      String? earned_at})
      : _is_valid = is_valid,
        _attestation_uid = attestation_uid,
        _status = status,
        _subject_address = subject_address,
        _attester_address = attester_address,
        _signature_type = signature_type,
        _on_chain = on_chain,
        _tx_hash = tx_hash,
        _reward_id = reward_id,
        _reward_name = reward_name,
        _earned_at = earned_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  RewardVerifyResult.fromJson(JsonMap json)
      : _is_valid = json["is_valid"] == null ? null : json["is_valid"] as bool,
        _attestation_uid = json["attestation_uid"] == null
            ? null
            : json["attestation_uid"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _subject_address = json["subject_address"] == null
            ? null
            : json["subject_address"] as String,
        _attester_address = json["attester_address"] == null
            ? null
            : json["attester_address"] as String,
        _signature_type = json["signature_type"] == null
            ? null
            : json["signature_type"] as String,
        _on_chain = json["on_chain"] == null ? null : json["on_chain"] as bool,
        _tx_hash = json["tx_hash"] == null ? null : json["tx_hash"] as String,
        _reward_id =
            json["reward_id"] == null ? null : json["reward_id"] as String,
        _reward_name =
            json["reward_name"] == null ? null : json["reward_name"] as String,
        _earned_at =
            json["earned_at"] == null ? null : json["earned_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "is_valid": jsonValue(_is_valid),
        "attestation_uid": jsonValue(_attestation_uid),
        "status": jsonValue(_status),
        "subject_address": jsonValue(_subject_address),
        "attester_address": jsonValue(_attester_address),
        "signature_type": jsonValue(_signature_type),
        "on_chain": jsonValue(_on_chain),
        if (_tx_hash != null) "tx_hash": jsonValue(_tx_hash),
        "reward_id": jsonValue(_reward_id),
        "reward_name": jsonValue(_reward_name),
        if (_earned_at != null) "earned_at": jsonValue(_earned_at),
      };
}

/// JSON model for JavaScript SDK `rewards.ListRewardsOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListRewardsOptions implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _is_active;
  bool? get is_active => _is_active;
  final String? _reward_type;
  String? get reward_type => _reward_type;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListRewardsOptions(
      {bool? is_active, String? reward_type, num? limit, num? offset})
      : _is_active = is_active,
        _reward_type = reward_type,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListRewardsOptions.fromJson(JsonMap json)
      : _is_active =
            json["is_active"] == null ? null : json["is_active"] as bool,
        _reward_type =
            json["reward_type"] == null ? null : json["reward_type"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_is_active != null) "is_active": jsonValue(_is_active),
        if (_reward_type != null) "reward_type": jsonValue(_reward_type),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `quests.Quest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Quest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _slug;
  String get slug => _slug as String;
  final String? _description;
  String? get description => _description;
  final String? _short_description;
  String? get short_description => _short_description;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _banner_url;
  String? get banner_url => _banner_url;
  final String? _category;
  String? get category => _category;
  final String? _difficulty;
  String? get difficulty => _difficulty;
  final String? _estimated_time;
  String? get estimated_time => _estimated_time;
  final String? _quest_type;
  String? get quest_type => _quest_type;
  final String? _action_url;

  /// Quest-level CTA target. With cta_type 'deferred' this is the FALLBACK.
  String? get action_url => _action_url;
  final QuestCtaType? _cta_type;

  /// Defaults to 'static' — older API builds omit it entirely.
  QuestCtaType? get cta_type => _cta_type;
  final String? _cta_link_url;

  /// Path to pass to resolveCtaLink(). Present only when cta_type is 'deferred'.
  String? get cta_link_url => _cta_link_url;
  final String? _cta_resolver;

  /// Provider key, for quest-builder round-tripping. Fan clients ignore it.
  String? get cta_resolver => _cta_resolver;
  final bool? _is_ordered;
  bool get is_ordered => _is_ordered as bool;
  final bool? _is_repeatable;
  bool get is_repeatable => _is_repeatable as bool;
  final num? _repeat_cooldown_hours;
  num? get repeat_cooldown_hours => _repeat_cooldown_hours;
  final num? _max_completions_per_user;
  num? get max_completions_per_user => _max_completions_per_user;
  final String? _starts_at;
  String? get starts_at => _starts_at;
  final String? _ends_at;
  String? get ends_at => _ends_at;
  final num? _time_limit_hours;
  num? get time_limit_hours => _time_limit_hours;
  final bool? _expire_on_end;

  /// When true, auto-expire all in-progress users when ends_at passes.
  bool? get expire_on_end => _expire_on_end;
  final List<String>? _prerequisite_quest_ids;
  List<String> get prerequisite_quest_ids =>
      _prerequisite_quest_ids as List<String>;
  final num? _max_participants;
  num? get max_participants => _max_participants;
  final num? _max_completions;
  num? get max_completions => _max_completions;
  final String? _reward_definition_id;
  String? get reward_definition_id => _reward_definition_id;
  final num? _reward_points;
  num? get reward_points => _reward_points;
  final String? _reward_mode;
  String get reward_mode => _reward_mode as String;
  final bool? _wallet_required;

  /// Whether the quest needs the fan to have a blockchain address before it can
  /// pay out — it carries a token or NFT reward, or a `wallet_holds` step.
  /// Derived server-side from the quest's rewards and steps.
  ///
  /// A UX signal, not an enforcement precondition: the claim still succeeds for
  /// a fan with no wallet, and the reward defers until one is linked. Use it to
  /// prompt for wallet setup BEFORE the fan earns something that then sits
  /// pending.
  ///
  /// Pair it with `GET /wallets/me` — `can_receive_assets` (can a reward land
  /// today) and `can_link_wallet` (may this fan create a wallet in their region
  /// at all). Do not prompt when `can_link_wallet` is false.
  bool? get wallet_required => _wallet_required;
  final bool? _is_public;
  bool get is_public => _is_public as bool;
  final bool? _is_featured;
  bool get is_featured => _is_featured as bool;
  final num? _display_order;

  /// Sort weight for ordering quests (lower = first). Default 0.
  num get display_order => _display_order as num;
  final List<String>? _tags;
  List<String> get tags => _tags as List<String>;
  final String? _status;
  String get status => _status as String;
  final bool? _is_visible_when_paused;

  /// Paused quests with this true stay in the catalog — render a paused
  /// state, do not hide the card. Omitted by older API builds.
  bool? get is_visible_when_paused => _is_visible_when_paused;
  final String? _pause_mode;

  /// 'freeze' = nothing counts toward the quest; 'block_joins' = in-progress
  /// fans finish, no new joins.
  String? get pause_mode => _pause_mode;
  final String? _paused_reason;

  /// Why the quest was paused ('manual', 'budget_exhausted').
  String? get paused_reason => _paused_reason;
  final num? _max_reward_issuances;

  /// Reward budget (cap on total issued rewards / summed value). Null = uncapped.
  num? get max_reward_issuances => _max_reward_issuances;
  final num? _reward_budget_value;
  num? get reward_budget_value => _reward_budget_value;
  final String? _reward_budget_currency;
  String? get reward_budget_currency => _reward_budget_currency;
  final num? _reward_value_spent;
  num? get reward_value_spent => _reward_value_spent;
  final num? _reward_issuances_count;
  num? get reward_issuances_count => _reward_issuances_count;
  final num? _remaining_participant_spots;

  /// Remaining capacity per axis; null = unbounded on that axis.
  num? get remaining_participant_spots => _remaining_participant_spots;
  final num? _remaining_completion_slots;
  num? get remaining_completion_slots => _remaining_completion_slots;
  final num? _remaining_budget_slots;
  num? get remaining_budget_slots => _remaining_budget_slots;
  final num? _available_spots;

  /// Min of the non-null remaining_* values — render "N spots left". Null = unbounded.
  num? get available_spots => _available_spots;
  final List<QuestStep>? _steps;
  List<QuestStep> get steps => _steps as List<QuestStep>;
  final num? _total_participants;
  num get total_participants => _total_participants as num;
  final num? _total_completions;
  num get total_completions => _total_completions as num;
  final String? _created_at;
  String get created_at => _created_at as String;
  final String? _updated_at;
  String get updated_at => _updated_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Quest(
      {required String id,
      required String name,
      required String slug,
      String? description,
      String? short_description,
      String? icon_url,
      String? banner_url,
      String? category,
      String? difficulty,
      String? estimated_time,
      String? quest_type,
      String? action_url,
      QuestCtaType? cta_type,
      String? cta_link_url,
      String? cta_resolver,
      required bool is_ordered,
      required bool is_repeatable,
      num? repeat_cooldown_hours,
      num? max_completions_per_user,
      String? starts_at,
      String? ends_at,
      num? time_limit_hours,
      bool? expire_on_end,
      required List<String> prerequisite_quest_ids,
      num? max_participants,
      num? max_completions,
      String? reward_definition_id,
      num? reward_points,
      required String reward_mode,
      bool? wallet_required,
      required bool is_public,
      required bool is_featured,
      required num display_order,
      required List<String> tags,
      required String status,
      bool? is_visible_when_paused,
      String? pause_mode,
      String? paused_reason,
      num? max_reward_issuances,
      num? reward_budget_value,
      String? reward_budget_currency,
      num? reward_value_spent,
      num? reward_issuances_count,
      num? remaining_participant_spots,
      num? remaining_completion_slots,
      num? remaining_budget_slots,
      num? available_spots,
      required List<QuestStep> steps,
      required num total_participants,
      required num total_completions,
      required String created_at,
      required String updated_at})
      : _id = id,
        _name = name,
        _slug = slug,
        _description = description,
        _short_description = short_description,
        _icon_url = icon_url,
        _banner_url = banner_url,
        _category = category,
        _difficulty = difficulty,
        _estimated_time = estimated_time,
        _quest_type = quest_type,
        _action_url = action_url,
        _cta_type = cta_type,
        _cta_link_url = cta_link_url,
        _cta_resolver = cta_resolver,
        _is_ordered = is_ordered,
        _is_repeatable = is_repeatable,
        _repeat_cooldown_hours = repeat_cooldown_hours,
        _max_completions_per_user = max_completions_per_user,
        _starts_at = starts_at,
        _ends_at = ends_at,
        _time_limit_hours = time_limit_hours,
        _expire_on_end = expire_on_end,
        _prerequisite_quest_ids = prerequisite_quest_ids,
        _max_participants = max_participants,
        _max_completions = max_completions,
        _reward_definition_id = reward_definition_id,
        _reward_points = reward_points,
        _reward_mode = reward_mode,
        _wallet_required = wallet_required,
        _is_public = is_public,
        _is_featured = is_featured,
        _display_order = display_order,
        _tags = tags,
        _status = status,
        _is_visible_when_paused = is_visible_when_paused,
        _pause_mode = pause_mode,
        _paused_reason = paused_reason,
        _max_reward_issuances = max_reward_issuances,
        _reward_budget_value = reward_budget_value,
        _reward_budget_currency = reward_budget_currency,
        _reward_value_spent = reward_value_spent,
        _reward_issuances_count = reward_issuances_count,
        _remaining_participant_spots = remaining_participant_spots,
        _remaining_completion_slots = remaining_completion_slots,
        _remaining_budget_slots = remaining_budget_slots,
        _available_spots = available_spots,
        _steps = steps,
        _total_participants = total_participants,
        _total_completions = total_completions,
        _created_at = created_at,
        _updated_at = updated_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Quest.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _short_description = json["short_description"] == null
            ? null
            : json["short_description"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _banner_url =
            json["banner_url"] == null ? null : json["banner_url"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _difficulty =
            json["difficulty"] == null ? null : json["difficulty"] as String,
        _estimated_time = json["estimated_time"] == null
            ? null
            : json["estimated_time"] as String,
        _quest_type =
            json["quest_type"] == null ? null : json["quest_type"] as String,
        _action_url =
            json["action_url"] == null ? null : json["action_url"] as String,
        _cta_type =
            json["cta_type"] == null ? null : json["cta_type"] as QuestCtaType,
        _cta_link_url = json["cta_link_url"] == null
            ? null
            : json["cta_link_url"] as String,
        _cta_resolver = json["cta_resolver"] == null
            ? null
            : json["cta_resolver"] as String,
        _is_ordered =
            json["is_ordered"] == null ? null : json["is_ordered"] as bool,
        _is_repeatable = json["is_repeatable"] == null
            ? null
            : json["is_repeatable"] as bool,
        _repeat_cooldown_hours = json["repeat_cooldown_hours"] == null
            ? null
            : json["repeat_cooldown_hours"] as num,
        _max_completions_per_user = json["max_completions_per_user"] == null
            ? null
            : json["max_completions_per_user"] as num,
        _starts_at =
            json["starts_at"] == null ? null : json["starts_at"] as String,
        _ends_at = json["ends_at"] == null ? null : json["ends_at"] as String,
        _time_limit_hours = json["time_limit_hours"] == null
            ? null
            : json["time_limit_hours"] as num,
        _expire_on_end = json["expire_on_end"] == null
            ? null
            : json["expire_on_end"] as bool,
        _prerequisite_quest_ids = json["prerequisite_quest_ids"] == null
            ? null
            : (json["prerequisite_quest_ids"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _max_participants = json["max_participants"] == null
            ? null
            : json["max_participants"] as num,
        _max_completions = json["max_completions"] == null
            ? null
            : json["max_completions"] as num,
        _reward_definition_id = json["reward_definition_id"] == null
            ? null
            : json["reward_definition_id"] as String,
        _reward_points =
            json["reward_points"] == null ? null : json["reward_points"] as num,
        _reward_mode =
            json["reward_mode"] == null ? null : json["reward_mode"] as String,
        _wallet_required = json["wallet_required"] == null
            ? null
            : json["wallet_required"] as bool,
        _is_public =
            json["is_public"] == null ? null : json["is_public"] as bool,
        _is_featured =
            json["is_featured"] == null ? null : json["is_featured"] as bool,
        _display_order =
            json["display_order"] == null ? null : json["display_order"] as num,
        _tags = json["tags"] == null
            ? null
            : (json["tags"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _status = json["status"] == null ? null : json["status"] as String,
        _is_visible_when_paused = json["is_visible_when_paused"] == null
            ? null
            : json["is_visible_when_paused"] as bool,
        _pause_mode =
            json["pause_mode"] == null ? null : json["pause_mode"] as String,
        _paused_reason = json["paused_reason"] == null
            ? null
            : json["paused_reason"] as String,
        _max_reward_issuances = json["max_reward_issuances"] == null
            ? null
            : json["max_reward_issuances"] as num,
        _reward_budget_value = json["reward_budget_value"] == null
            ? null
            : json["reward_budget_value"] as num,
        _reward_budget_currency = json["reward_budget_currency"] == null
            ? null
            : json["reward_budget_currency"] as String,
        _reward_value_spent = json["reward_value_spent"] == null
            ? null
            : json["reward_value_spent"] as num,
        _reward_issuances_count = json["reward_issuances_count"] == null
            ? null
            : json["reward_issuances_count"] as num,
        _remaining_participant_spots =
            json["remaining_participant_spots"] == null
                ? null
                : json["remaining_participant_spots"] as num,
        _remaining_completion_slots = json["remaining_completion_slots"] == null
            ? null
            : json["remaining_completion_slots"] as num,
        _remaining_budget_slots = json["remaining_budget_slots"] == null
            ? null
            : json["remaining_budget_slots"] as num,
        _available_spots = json["available_spots"] == null
            ? null
            : json["available_spots"] as num,
        _steps = json["steps"] == null
            ? null
            : (json["steps"] as List<Object?>)
                .map((item) => QuestStep.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total_participants = json["total_participants"] == null
            ? null
            : json["total_participants"] as num,
        _total_completions = json["total_completions"] == null
            ? null
            : json["total_completions"] as num,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _updated_at =
            json["updated_at"] == null ? null : json["updated_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "slug": jsonValue(_slug),
        if (_description != null) "description": jsonValue(_description),
        if (_short_description != null)
          "short_description": jsonValue(_short_description),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_banner_url != null) "banner_url": jsonValue(_banner_url),
        if (_category != null) "category": jsonValue(_category),
        if (_difficulty != null) "difficulty": jsonValue(_difficulty),
        if (_estimated_time != null)
          "estimated_time": jsonValue(_estimated_time),
        if (_quest_type != null) "quest_type": jsonValue(_quest_type),
        if (_action_url != null) "action_url": jsonValue(_action_url),
        if (_cta_type != null) "cta_type": jsonValue(_cta_type),
        if (_cta_link_url != null) "cta_link_url": jsonValue(_cta_link_url),
        if (_cta_resolver != null) "cta_resolver": jsonValue(_cta_resolver),
        "is_ordered": jsonValue(_is_ordered),
        "is_repeatable": jsonValue(_is_repeatable),
        if (_repeat_cooldown_hours != null)
          "repeat_cooldown_hours": jsonValue(_repeat_cooldown_hours),
        if (_max_completions_per_user != null)
          "max_completions_per_user": jsonValue(_max_completions_per_user),
        if (_starts_at != null) "starts_at": jsonValue(_starts_at),
        if (_ends_at != null) "ends_at": jsonValue(_ends_at),
        if (_time_limit_hours != null)
          "time_limit_hours": jsonValue(_time_limit_hours),
        if (_expire_on_end != null) "expire_on_end": jsonValue(_expire_on_end),
        "prerequisite_quest_ids": jsonValue(_prerequisite_quest_ids),
        if (_max_participants != null)
          "max_participants": jsonValue(_max_participants),
        if (_max_completions != null)
          "max_completions": jsonValue(_max_completions),
        if (_reward_definition_id != null)
          "reward_definition_id": jsonValue(_reward_definition_id),
        if (_reward_points != null) "reward_points": jsonValue(_reward_points),
        "reward_mode": jsonValue(_reward_mode),
        if (_wallet_required != null)
          "wallet_required": jsonValue(_wallet_required),
        "is_public": jsonValue(_is_public),
        "is_featured": jsonValue(_is_featured),
        "display_order": jsonValue(_display_order),
        "tags": jsonValue(_tags),
        "status": jsonValue(_status),
        if (_is_visible_when_paused != null)
          "is_visible_when_paused": jsonValue(_is_visible_when_paused),
        if (_pause_mode != null) "pause_mode": jsonValue(_pause_mode),
        if (_paused_reason != null) "paused_reason": jsonValue(_paused_reason),
        if (_max_reward_issuances != null)
          "max_reward_issuances": jsonValue(_max_reward_issuances),
        if (_reward_budget_value != null)
          "reward_budget_value": jsonValue(_reward_budget_value),
        if (_reward_budget_currency != null)
          "reward_budget_currency": jsonValue(_reward_budget_currency),
        if (_reward_value_spent != null)
          "reward_value_spent": jsonValue(_reward_value_spent),
        if (_reward_issuances_count != null)
          "reward_issuances_count": jsonValue(_reward_issuances_count),
        if (_remaining_participant_spots != null)
          "remaining_participant_spots":
              jsonValue(_remaining_participant_spots),
        if (_remaining_completion_slots != null)
          "remaining_completion_slots": jsonValue(_remaining_completion_slots),
        if (_remaining_budget_slots != null)
          "remaining_budget_slots": jsonValue(_remaining_budget_slots),
        if (_available_spots != null)
          "available_spots": jsonValue(_available_spots),
        "steps": jsonValue(_steps),
        "total_participants": jsonValue(_total_participants),
        "total_completions": jsonValue(_total_completions),
        "created_at": jsonValue(_created_at),
        "updated_at": jsonValue(_updated_at),
      };
}

/// How a quest's call-to-action produces its destination.
///
/// - `static`   — open `action_url` (or `steps`0`.cta_url`) directly.
/// - `deferred` — the URL does not exist until the fan taps: call
///   `QuestsClient.resolveCtaLink` with `quest.cta_link_url` and open
///   the `url` it returns. Used for per-fan links (affiliate/referral), which
///   can never live in a quest column because the quest catalog is cached
///   per tenant, not per user.
///
/// Uses `String`; TypeScript-only constraints are not validated.
typedef QuestCtaType = String;

/// Resolved destination for a deferred CTA. `url` is the only field a client needs.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class QuestCtaLink implements JsonModel {
  final JsonMap? _originalJson;
  final String? _quest_id;
  String get quest_id => _quest_id as String;
  final String? _url;

  /// Open this.
  String get url => _url as String;
  final String? _resolver;

  /// Which server-side provider produced it, e.g. 'polymarket_affiliate'.
  String get resolver => _resolver as String;
  final String? _resolved_at;
  String get resolved_at => _resolved_at as String;
  final Map<String, Object?>? _meta;

  /// Provider-specific extras (ids, link provider). Safe to ignore.
  Map<String, Object?> get meta => _meta as Map<String, Object?>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const QuestCtaLink(
      {required String quest_id,
      required String url,
      required String resolver,
      required String resolved_at,
      required Map<String, Object?> meta})
      : _quest_id = quest_id,
        _url = url,
        _resolver = resolver,
        _resolved_at = resolved_at,
        _meta = meta,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  QuestCtaLink.fromJson(JsonMap json)
      : _quest_id =
            json["quest_id"] == null ? null : json["quest_id"] as String,
        _url = json["url"] == null ? null : json["url"] as String,
        _resolver =
            json["resolver"] == null ? null : json["resolver"] as String,
        _resolved_at =
            json["resolved_at"] == null ? null : json["resolved_at"] as String,
        _meta = json["meta"] == null ? null : asJsonMap(json["meta"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "quest_id": jsonValue(_quest_id),
        "url": jsonValue(_url),
        "resolver": jsonValue(_resolver),
        "resolved_at": jsonValue(_resolved_at),
        "meta": jsonValue(_meta),
      };
}

/// A deferred-CTA provider the API can satisfy. Powers a quest-builder dropdown.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class QuestCtaResolver implements JsonModel {
  final JsonMap? _originalJson;
  final String? _key;
  String get key => _key as String;
  final String? _label;
  String get label => _label as String;
  final String? _description;
  String get description => _description as String;
  final bool? _configured;

  /// False when the deployment lacks this provider's config, so quests using it 503.
  bool get configured => _configured as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const QuestCtaResolver(
      {required String key,
      required String label,
      required String description,
      required bool configured})
      : _key = key,
        _label = label,
        _description = description,
        _configured = configured,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  QuestCtaResolver.fromJson(JsonMap json)
      : _key = json["key"] == null ? null : json["key"] as String,
        _label = json["label"] == null ? null : json["label"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _configured =
            json["configured"] == null ? null : json["configured"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "key": jsonValue(_key),
        "label": jsonValue(_label),
        "description": jsonValue(_description),
        "configured": jsonValue(_configured),
      };
}

/// JSON model for JavaScript SDK `quests.QuestStep`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class QuestStep implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _quest_id;
  String get quest_id => _quest_id as String;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final num? _order;
  num get order => _order as num;
  final String? _step_type;
  String get step_type => _step_type as String;
  final String? _event_type;
  String? get event_type => _event_type;
  final List<String>? _event_types;
  List<String>? get event_types => _event_types;
  final Map<String, Object?>? _criteria;
  Map<String, Object?>? get criteria => _criteria;
  final List<String>? _required_data_fields;
  List<String>? get required_data_fields => _required_data_fields;
  final num? _step_points;
  num? get step_points => _step_points;
  final String? _cta_text;

  /// Button text for call-to-action (e.g., "Read Article", "Visit Store")
  String? get cta_text => _cta_text;
  final String? _cta_url;

  /// URL or deeplink for the call-to-action button
  String? get cta_url => _cta_url;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final bool? _is_optional;
  bool get is_optional => _is_optional as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const QuestStep(
      {required String id,
      required String quest_id,
      required String name,
      String? description,
      required num order,
      required String step_type,
      String? event_type,
      List<String>? event_types,
      Map<String, Object?>? criteria,
      List<String>? required_data_fields,
      num? step_points,
      String? cta_text,
      String? cta_url,
      String? icon_url,
      required bool is_optional})
      : _id = id,
        _quest_id = quest_id,
        _name = name,
        _description = description,
        _order = order,
        _step_type = step_type,
        _event_type = event_type,
        _event_types = event_types,
        _criteria = criteria,
        _required_data_fields = required_data_fields,
        _step_points = step_points,
        _cta_text = cta_text,
        _cta_url = cta_url,
        _icon_url = icon_url,
        _is_optional = is_optional,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  QuestStep.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _quest_id =
            json["quest_id"] == null ? null : json["quest_id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _order = json["order"] == null ? null : json["order"] as num,
        _step_type =
            json["step_type"] == null ? null : json["step_type"] as String,
        _event_type =
            json["event_type"] == null ? null : json["event_type"] as String,
        _event_types = json["event_types"] == null
            ? null
            : (json["event_types"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _criteria =
            json["criteria"] == null ? null : asJsonMap(json["criteria"]),
        _required_data_fields = json["required_data_fields"] == null
            ? null
            : (json["required_data_fields"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _step_points =
            json["step_points"] == null ? null : json["step_points"] as num,
        _cta_text =
            json["cta_text"] == null ? null : json["cta_text"] as String,
        _cta_url = json["cta_url"] == null ? null : json["cta_url"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _is_optional =
            json["is_optional"] == null ? null : json["is_optional"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "quest_id": jsonValue(_quest_id),
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        "order": jsonValue(_order),
        "step_type": jsonValue(_step_type),
        if (_event_type != null) "event_type": jsonValue(_event_type),
        if (_event_types != null) "event_types": jsonValue(_event_types),
        if (_criteria != null) "criteria": jsonValue(_criteria),
        if (_required_data_fields != null)
          "required_data_fields": jsonValue(_required_data_fields),
        if (_step_points != null) "step_points": jsonValue(_step_points),
        if (_cta_text != null) "cta_text": jsonValue(_cta_text),
        if (_cta_url != null) "cta_url": jsonValue(_cta_url),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        "is_optional": jsonValue(_is_optional),
      };
}

/// JSON model for JavaScript SDK `quests.UserQuestProgress`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserQuestProgress implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _quest_id;
  String get quest_id => _quest_id as String;
  final String? _quest_name;
  String get quest_name => _quest_name as String;
  final String? _status;
  String get status => _status as String;
  final String? _started_at;
  String? get started_at => _started_at;
  final String? _completed_at;
  String? get completed_at => _completed_at;
  final String? _expires_at;
  String? get expires_at => _expires_at;
  final num? _completion_count;
  num get completion_count => _completion_count as num;
  final num? _current_step_order;
  num get current_step_order => _current_step_order as num;
  final num? _steps_completed;
  num get steps_completed => _steps_completed as num;
  final num? _total_steps;
  num get total_steps => _total_steps as num;
  final num? _completion_percentage;
  num get completion_percentage => _completion_percentage as num;
  final List<StepProgress>? _step_progress;
  List<StepProgress> get step_progress => _step_progress as List<StepProgress>;
  final num? _points_earned;
  num get points_earned => _points_earned as num;
  final RewardEarned? _reward_earned;
  RewardEarned? get reward_earned => _reward_earned;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserQuestProgress(
      {required String id,
      required String user_id,
      required String quest_id,
      required String quest_name,
      required String status,
      String? started_at,
      String? completed_at,
      String? expires_at,
      required num completion_count,
      required num current_step_order,
      required num steps_completed,
      required num total_steps,
      required num completion_percentage,
      required List<StepProgress> step_progress,
      required num points_earned,
      RewardEarned? reward_earned})
      : _id = id,
        _user_id = user_id,
        _quest_id = quest_id,
        _quest_name = quest_name,
        _status = status,
        _started_at = started_at,
        _completed_at = completed_at,
        _expires_at = expires_at,
        _completion_count = completion_count,
        _current_step_order = current_step_order,
        _steps_completed = steps_completed,
        _total_steps = total_steps,
        _completion_percentage = completion_percentage,
        _step_progress = step_progress,
        _points_earned = points_earned,
        _reward_earned = reward_earned,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserQuestProgress.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _quest_id =
            json["quest_id"] == null ? null : json["quest_id"] as String,
        _quest_name =
            json["quest_name"] == null ? null : json["quest_name"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _started_at =
            json["started_at"] == null ? null : json["started_at"] as String,
        _completed_at = json["completed_at"] == null
            ? null
            : json["completed_at"] as String,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _completion_count = json["completion_count"] == null
            ? null
            : json["completion_count"] as num,
        _current_step_order = json["current_step_order"] == null
            ? null
            : json["current_step_order"] as num,
        _steps_completed = json["steps_completed"] == null
            ? null
            : json["steps_completed"] as num,
        _total_steps =
            json["total_steps"] == null ? null : json["total_steps"] as num,
        _completion_percentage = json["completion_percentage"] == null
            ? null
            : json["completion_percentage"] as num,
        _step_progress = json["step_progress"] == null
            ? null
            : (json["step_progress"] as List<Object?>)
                .map((item) => StepProgress.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _points_earned =
            json["points_earned"] == null ? null : json["points_earned"] as num,
        _reward_earned = json["reward_earned"] == null
            ? null
            : RewardEarned.fromJson(asJsonMap(json["reward_earned"])),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "user_id": jsonValue(_user_id),
        "quest_id": jsonValue(_quest_id),
        "quest_name": jsonValue(_quest_name),
        "status": jsonValue(_status),
        if (_started_at != null) "started_at": jsonValue(_started_at),
        if (_completed_at != null) "completed_at": jsonValue(_completed_at),
        if (_expires_at != null) "expires_at": jsonValue(_expires_at),
        "completion_count": jsonValue(_completion_count),
        "current_step_order": jsonValue(_current_step_order),
        "steps_completed": jsonValue(_steps_completed),
        "total_steps": jsonValue(_total_steps),
        "completion_percentage": jsonValue(_completion_percentage),
        "step_progress": jsonValue(_step_progress),
        "points_earned": jsonValue(_points_earned),
        if (_reward_earned != null) "reward_earned": jsonValue(_reward_earned),
      };
}

/// JSON model for JavaScript SDK `quests.RewardEarned`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class RewardEarned implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _reward_name;
  String get reward_name => _reward_name as String;
  final String? _reward_type;
  String get reward_type => _reward_type as String;
  final num? _value;
  num? get value => _value;
  final String? _value_currency;
  String? get value_currency => _value_currency;
  final String? _status;
  String get status => _status as String;
  final String? _earned_at;
  String get earned_at => _earned_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const RewardEarned(
      {required String id,
      required String reward_name,
      required String reward_type,
      num? value,
      String? value_currency,
      required String status,
      required String earned_at})
      : _id = id,
        _reward_name = reward_name,
        _reward_type = reward_type,
        _value = value,
        _value_currency = value_currency,
        _status = status,
        _earned_at = earned_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  RewardEarned.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _reward_name =
            json["reward_name"] == null ? null : json["reward_name"] as String,
        _reward_type =
            json["reward_type"] == null ? null : json["reward_type"] as String,
        _value = json["value"] == null ? null : json["value"] as num,
        _value_currency = json["value_currency"] == null
            ? null
            : json["value_currency"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _earned_at =
            json["earned_at"] == null ? null : json["earned_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "reward_name": jsonValue(_reward_name),
        "reward_type": jsonValue(_reward_type),
        if (_value != null) "value": jsonValue(_value),
        if (_value_currency != null)
          "value_currency": jsonValue(_value_currency),
        "status": jsonValue(_status),
        "earned_at": jsonValue(_earned_at),
      };
}

/// JSON model for JavaScript SDK `quests.StepProgress`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class StepProgress implements JsonModel {
  final JsonMap? _originalJson;
  final String? _step_id;
  String get step_id => _step_id as String;
  final String? _step_name;
  String get step_name => _step_name as String;
  final num? _order;
  num get order => _order as num;
  final String? _status;
  String get status => _status as String;
  final String? _started_at;
  String? get started_at => _started_at;
  final String? _completed_at;
  String? get completed_at => _completed_at;
  final String? _event_id;
  String? get event_id => _event_id;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const StepProgress(
      {required String step_id,
      required String step_name,
      required num order,
      required String status,
      String? started_at,
      String? completed_at,
      String? event_id})
      : _step_id = step_id,
        _step_name = step_name,
        _order = order,
        _status = status,
        _started_at = started_at,
        _completed_at = completed_at,
        _event_id = event_id,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  StepProgress.fromJson(JsonMap json)
      : _step_id = json["step_id"] == null ? null : json["step_id"] as String,
        _step_name =
            json["step_name"] == null ? null : json["step_name"] as String,
        _order = json["order"] == null ? null : json["order"] as num,
        _status = json["status"] == null ? null : json["status"] as String,
        _started_at =
            json["started_at"] == null ? null : json["started_at"] as String,
        _completed_at = json["completed_at"] == null
            ? null
            : json["completed_at"] as String,
        _event_id =
            json["event_id"] == null ? null : json["event_id"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "step_id": jsonValue(_step_id),
        "step_name": jsonValue(_step_name),
        "order": jsonValue(_order),
        "status": jsonValue(_status),
        if (_started_at != null) "started_at": jsonValue(_started_at),
        if (_completed_at != null) "completed_at": jsonValue(_completed_at),
        if (_event_id != null) "event_id": jsonValue(_event_id),
      };
}

/// JSON model for JavaScript SDK `quests.StepStartResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class StepStartResult implements JsonModel {
  final JsonMap? _originalJson;
  final num? _step_index;
  num get step_index => _step_index as num;
  final String? _status;
  String get status => _status as String;
  final String? _started_at;
  String? get started_at => _started_at;
  final String? _quest_id;
  String get quest_id => _quest_id as String;
  final String? _quest_name;
  String get quest_name => _quest_name as String;
  final String? _step_name;
  String get step_name => _step_name as String;
  final String? _message;

  /// Present when step was already completed
  String? get message => _message;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const StepStartResult(
      {required num step_index,
      required String status,
      String? started_at,
      required String quest_id,
      required String quest_name,
      required String step_name,
      String? message})
      : _step_index = step_index,
        _status = status,
        _started_at = started_at,
        _quest_id = quest_id,
        _quest_name = quest_name,
        _step_name = step_name,
        _message = message,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  StepStartResult.fromJson(JsonMap json)
      : _step_index =
            json["step_index"] == null ? null : json["step_index"] as num,
        _status = json["status"] == null ? null : json["status"] as String,
        _started_at =
            json["started_at"] == null ? null : json["started_at"] as String,
        _quest_id =
            json["quest_id"] == null ? null : json["quest_id"] as String,
        _quest_name =
            json["quest_name"] == null ? null : json["quest_name"] as String,
        _step_name =
            json["step_name"] == null ? null : json["step_name"] as String,
        _message = json["message"] == null ? null : json["message"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "step_index": jsonValue(_step_index),
        "status": jsonValue(_status),
        if (_started_at != null) "started_at": jsonValue(_started_at),
        "quest_id": jsonValue(_quest_id),
        "quest_name": jsonValue(_quest_name),
        "step_name": jsonValue(_step_name),
        if (_message != null) "message": jsonValue(_message),
      };
}

/// JSON model for JavaScript SDK `quests.StepCompletionResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class StepCompletionResult implements JsonModel {
  final JsonMap? _originalJson;
  final num? _step_index;
  num get step_index => _step_index as num;
  final bool? _step_completed;
  bool get step_completed => _step_completed as bool;
  final bool? _quest_completed;
  bool get quest_completed => _quest_completed as bool;
  final bool? _can_claim;
  bool get can_claim => _can_claim as bool;
  final num? _current_count;
  num get current_count => _current_count as num;
  final num? _target_count;
  num get target_count => _target_count as num;
  final num? _points_earned;
  num get points_earned => _points_earned as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const StepCompletionResult(
      {required num step_index,
      required bool step_completed,
      required bool quest_completed,
      required bool can_claim,
      required num current_count,
      required num target_count,
      required num points_earned})
      : _step_index = step_index,
        _step_completed = step_completed,
        _quest_completed = quest_completed,
        _can_claim = can_claim,
        _current_count = current_count,
        _target_count = target_count,
        _points_earned = points_earned,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  StepCompletionResult.fromJson(JsonMap json)
      : _step_index =
            json["step_index"] == null ? null : json["step_index"] as num,
        _step_completed = json["step_completed"] == null
            ? null
            : json["step_completed"] as bool,
        _quest_completed = json["quest_completed"] == null
            ? null
            : json["quest_completed"] as bool,
        _can_claim =
            json["can_claim"] == null ? null : json["can_claim"] as bool,
        _current_count =
            json["current_count"] == null ? null : json["current_count"] as num,
        _target_count =
            json["target_count"] == null ? null : json["target_count"] as num,
        _points_earned =
            json["points_earned"] == null ? null : json["points_earned"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "step_index": jsonValue(_step_index),
        "step_completed": jsonValue(_step_completed),
        "quest_completed": jsonValue(_quest_completed),
        "can_claim": jsonValue(_can_claim),
        "current_count": jsonValue(_current_count),
        "target_count": jsonValue(_target_count),
        "points_earned": jsonValue(_points_earned),
      };
}

/// JSON model for JavaScript SDK `quests.ClaimRewardResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ClaimRewardResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _quest_id;
  String get quest_id => _quest_id as String;
  final String? _quest_name;
  String get quest_name => _quest_name as String;
  final String? _status;
  String get status => _status as String;
  final num? _points_awarded;
  num get points_awarded => _points_awarded as num;
  final String? _reward_earned_id;
  String? get reward_earned_id => _reward_earned_id;
  final String? _claimed_at;
  String get claimed_at => _claimed_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ClaimRewardResult(
      {required String quest_id,
      required String quest_name,
      required String status,
      required num points_awarded,
      String? reward_earned_id,
      required String claimed_at})
      : _quest_id = quest_id,
        _quest_name = quest_name,
        _status = status,
        _points_awarded = points_awarded,
        _reward_earned_id = reward_earned_id,
        _claimed_at = claimed_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ClaimRewardResult.fromJson(JsonMap json)
      : _quest_id =
            json["quest_id"] == null ? null : json["quest_id"] as String,
        _quest_name =
            json["quest_name"] == null ? null : json["quest_name"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _points_awarded = json["points_awarded"] == null
            ? null
            : json["points_awarded"] as num,
        _reward_earned_id = json["reward_earned_id"] == null
            ? null
            : json["reward_earned_id"] as String,
        _claimed_at =
            json["claimed_at"] == null ? null : json["claimed_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "quest_id": jsonValue(_quest_id),
        "quest_name": jsonValue(_quest_name),
        "status": jsonValue(_status),
        "points_awarded": jsonValue(_points_awarded),
        if (_reward_earned_id != null)
          "reward_earned_id": jsonValue(_reward_earned_id),
        "claimed_at": jsonValue(_claimed_at),
      };
}

/// JSON model for JavaScript SDK `quests.QuestWithProgress`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class QuestWithProgress implements JsonModel {
  final JsonMap? _originalJson;
  final Quest? _quest;
  Quest get quest => _quest as Quest;
  final UserQuestProgress? _progress;
  UserQuestProgress? get progress => _progress;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const QuestWithProgress({required Quest quest, UserQuestProgress? progress})
      : _quest = quest,
        _progress = progress,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  QuestWithProgress.fromJson(JsonMap json)
      : _quest = json["quest"] == null
            ? null
            : Quest.fromJson(asJsonMap(json["quest"])),
        _progress = json["progress"] == null
            ? null
            : UserQuestProgress.fromJson(asJsonMap(json["progress"])),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "quest": jsonValue(_quest),
        if (_progress != null) "progress": jsonValue(_progress),
      };
}

/// JSON model for JavaScript SDK `quests.CreateQuestRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateQuestRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _slug;
  String? get slug => _slug;
  final String? _description;
  String? get description => _description;
  final String? _short_description;
  String? get short_description => _short_description;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _banner_url;
  String? get banner_url => _banner_url;
  final String? _category;
  String? get category => _category;
  final String? _difficulty;
  String? get difficulty => _difficulty;
  final String? _estimated_time;
  String? get estimated_time => _estimated_time;
  final bool? _is_ordered;
  bool? get is_ordered => _is_ordered;
  final bool? _is_repeatable;
  bool? get is_repeatable => _is_repeatable;
  final num? _repeat_cooldown_hours;
  num? get repeat_cooldown_hours => _repeat_cooldown_hours;
  final num? _max_completions_per_user;
  num? get max_completions_per_user => _max_completions_per_user;
  final String? _starts_at;
  String? get starts_at => _starts_at;
  final String? _ends_at;
  String? get ends_at => _ends_at;
  final num? _time_limit_hours;
  num? get time_limit_hours => _time_limit_hours;
  final bool? _expire_on_end;

  /// When true, auto-expire all in-progress users when ends_at passes.
  bool? get expire_on_end => _expire_on_end;
  final List<String>? _prerequisite_quest_ids;
  List<String>? get prerequisite_quest_ids => _prerequisite_quest_ids;
  final num? _max_participants;
  num? get max_participants => _max_participants;
  final num? _max_completions;
  num? get max_completions => _max_completions;
  final String? _reward_definition_id;
  String? get reward_definition_id => _reward_definition_id;
  final num? _reward_points;
  num? get reward_points => _reward_points;
  final String? _reward_mode;
  String? get reward_mode => _reward_mode;
  final bool? _is_public;
  bool? get is_public => _is_public;
  final bool? _is_featured;
  bool? get is_featured => _is_featured;
  final num? _display_order;

  /// Sort weight for ordering quests (lower = first). Default 0.
  num? get display_order => _display_order;
  final List<String>? _tags;
  List<String>? get tags => _tags;
  final List<CreateQuestStepRequest>? _steps;
  List<CreateQuestStepRequest> get steps =>
      _steps as List<CreateQuestStepRequest>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateQuestRequest(
      {required String name,
      String? slug,
      String? description,
      String? short_description,
      String? icon_url,
      String? banner_url,
      String? category,
      String? difficulty,
      String? estimated_time,
      bool? is_ordered,
      bool? is_repeatable,
      num? repeat_cooldown_hours,
      num? max_completions_per_user,
      String? starts_at,
      String? ends_at,
      num? time_limit_hours,
      bool? expire_on_end,
      List<String>? prerequisite_quest_ids,
      num? max_participants,
      num? max_completions,
      String? reward_definition_id,
      num? reward_points,
      String? reward_mode,
      bool? is_public,
      bool? is_featured,
      num? display_order,
      List<String>? tags,
      required List<CreateQuestStepRequest> steps})
      : _name = name,
        _slug = slug,
        _description = description,
        _short_description = short_description,
        _icon_url = icon_url,
        _banner_url = banner_url,
        _category = category,
        _difficulty = difficulty,
        _estimated_time = estimated_time,
        _is_ordered = is_ordered,
        _is_repeatable = is_repeatable,
        _repeat_cooldown_hours = repeat_cooldown_hours,
        _max_completions_per_user = max_completions_per_user,
        _starts_at = starts_at,
        _ends_at = ends_at,
        _time_limit_hours = time_limit_hours,
        _expire_on_end = expire_on_end,
        _prerequisite_quest_ids = prerequisite_quest_ids,
        _max_participants = max_participants,
        _max_completions = max_completions,
        _reward_definition_id = reward_definition_id,
        _reward_points = reward_points,
        _reward_mode = reward_mode,
        _is_public = is_public,
        _is_featured = is_featured,
        _display_order = display_order,
        _tags = tags,
        _steps = steps,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateQuestRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _short_description = json["short_description"] == null
            ? null
            : json["short_description"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _banner_url =
            json["banner_url"] == null ? null : json["banner_url"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _difficulty =
            json["difficulty"] == null ? null : json["difficulty"] as String,
        _estimated_time = json["estimated_time"] == null
            ? null
            : json["estimated_time"] as String,
        _is_ordered =
            json["is_ordered"] == null ? null : json["is_ordered"] as bool,
        _is_repeatable = json["is_repeatable"] == null
            ? null
            : json["is_repeatable"] as bool,
        _repeat_cooldown_hours = json["repeat_cooldown_hours"] == null
            ? null
            : json["repeat_cooldown_hours"] as num,
        _max_completions_per_user = json["max_completions_per_user"] == null
            ? null
            : json["max_completions_per_user"] as num,
        _starts_at =
            json["starts_at"] == null ? null : json["starts_at"] as String,
        _ends_at = json["ends_at"] == null ? null : json["ends_at"] as String,
        _time_limit_hours = json["time_limit_hours"] == null
            ? null
            : json["time_limit_hours"] as num,
        _expire_on_end = json["expire_on_end"] == null
            ? null
            : json["expire_on_end"] as bool,
        _prerequisite_quest_ids = json["prerequisite_quest_ids"] == null
            ? null
            : (json["prerequisite_quest_ids"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _max_participants = json["max_participants"] == null
            ? null
            : json["max_participants"] as num,
        _max_completions = json["max_completions"] == null
            ? null
            : json["max_completions"] as num,
        _reward_definition_id = json["reward_definition_id"] == null
            ? null
            : json["reward_definition_id"] as String,
        _reward_points =
            json["reward_points"] == null ? null : json["reward_points"] as num,
        _reward_mode =
            json["reward_mode"] == null ? null : json["reward_mode"] as String,
        _is_public =
            json["is_public"] == null ? null : json["is_public"] as bool,
        _is_featured =
            json["is_featured"] == null ? null : json["is_featured"] as bool,
        _display_order =
            json["display_order"] == null ? null : json["display_order"] as num,
        _tags = json["tags"] == null
            ? null
            : (json["tags"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _steps = json["steps"] == null
            ? null
            : (json["steps"] as List<Object?>)
                .map((item) => CreateQuestStepRequest.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        if (_slug != null) "slug": jsonValue(_slug),
        if (_description != null) "description": jsonValue(_description),
        if (_short_description != null)
          "short_description": jsonValue(_short_description),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_banner_url != null) "banner_url": jsonValue(_banner_url),
        if (_category != null) "category": jsonValue(_category),
        if (_difficulty != null) "difficulty": jsonValue(_difficulty),
        if (_estimated_time != null)
          "estimated_time": jsonValue(_estimated_time),
        if (_is_ordered != null) "is_ordered": jsonValue(_is_ordered),
        if (_is_repeatable != null) "is_repeatable": jsonValue(_is_repeatable),
        if (_repeat_cooldown_hours != null)
          "repeat_cooldown_hours": jsonValue(_repeat_cooldown_hours),
        if (_max_completions_per_user != null)
          "max_completions_per_user": jsonValue(_max_completions_per_user),
        if (_starts_at != null) "starts_at": jsonValue(_starts_at),
        if (_ends_at != null) "ends_at": jsonValue(_ends_at),
        if (_time_limit_hours != null)
          "time_limit_hours": jsonValue(_time_limit_hours),
        if (_expire_on_end != null) "expire_on_end": jsonValue(_expire_on_end),
        if (_prerequisite_quest_ids != null)
          "prerequisite_quest_ids": jsonValue(_prerequisite_quest_ids),
        if (_max_participants != null)
          "max_participants": jsonValue(_max_participants),
        if (_max_completions != null)
          "max_completions": jsonValue(_max_completions),
        if (_reward_definition_id != null)
          "reward_definition_id": jsonValue(_reward_definition_id),
        if (_reward_points != null) "reward_points": jsonValue(_reward_points),
        if (_reward_mode != null) "reward_mode": jsonValue(_reward_mode),
        if (_is_public != null) "is_public": jsonValue(_is_public),
        if (_is_featured != null) "is_featured": jsonValue(_is_featured),
        if (_display_order != null) "display_order": jsonValue(_display_order),
        if (_tags != null) "tags": jsonValue(_tags),
        "steps": jsonValue(_steps),
      };
}

/// JSON model for JavaScript SDK `quests.CreateQuestStepRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateQuestStepRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final num? _order;
  num? get order => _order;
  final String? _step_type;
  String? get step_type => _step_type;
  final String? _event_type;
  String? get event_type => _event_type;
  final List<String>? _event_types;
  List<String>? get event_types => _event_types;
  final Map<String, Object?>? _criteria;
  Map<String, Object?>? get criteria => _criteria;
  final List<String>? _required_data_fields;
  List<String>? get required_data_fields => _required_data_fields;
  final num? _step_points;
  num? get step_points => _step_points;
  final String? _cta_text;

  /// Button text for call-to-action (e.g., "Read Article", "Visit Store")
  String? get cta_text => _cta_text;
  final String? _cta_url;

  /// URL or deeplink for the call-to-action button
  String? get cta_url => _cta_url;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final bool? _is_optional;
  bool? get is_optional => _is_optional;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateQuestStepRequest(
      {required String name,
      String? description,
      num? order,
      String? step_type,
      String? event_type,
      List<String>? event_types,
      Map<String, Object?>? criteria,
      List<String>? required_data_fields,
      num? step_points,
      String? cta_text,
      String? cta_url,
      String? icon_url,
      bool? is_optional})
      : _name = name,
        _description = description,
        _order = order,
        _step_type = step_type,
        _event_type = event_type,
        _event_types = event_types,
        _criteria = criteria,
        _required_data_fields = required_data_fields,
        _step_points = step_points,
        _cta_text = cta_text,
        _cta_url = cta_url,
        _icon_url = icon_url,
        _is_optional = is_optional,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateQuestStepRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _order = json["order"] == null ? null : json["order"] as num,
        _step_type =
            json["step_type"] == null ? null : json["step_type"] as String,
        _event_type =
            json["event_type"] == null ? null : json["event_type"] as String,
        _event_types = json["event_types"] == null
            ? null
            : (json["event_types"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _criteria =
            json["criteria"] == null ? null : asJsonMap(json["criteria"]),
        _required_data_fields = json["required_data_fields"] == null
            ? null
            : (json["required_data_fields"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _step_points =
            json["step_points"] == null ? null : json["step_points"] as num,
        _cta_text =
            json["cta_text"] == null ? null : json["cta_text"] as String,
        _cta_url = json["cta_url"] == null ? null : json["cta_url"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _is_optional =
            json["is_optional"] == null ? null : json["is_optional"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        if (_description != null) "description": jsonValue(_description),
        if (_order != null) "order": jsonValue(_order),
        if (_step_type != null) "step_type": jsonValue(_step_type),
        if (_event_type != null) "event_type": jsonValue(_event_type),
        if (_event_types != null) "event_types": jsonValue(_event_types),
        if (_criteria != null) "criteria": jsonValue(_criteria),
        if (_required_data_fields != null)
          "required_data_fields": jsonValue(_required_data_fields),
        if (_step_points != null) "step_points": jsonValue(_step_points),
        if (_cta_text != null) "cta_text": jsonValue(_cta_text),
        if (_cta_url != null) "cta_url": jsonValue(_cta_url),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_is_optional != null) "is_optional": jsonValue(_is_optional),
      };
}

/// JSON model for JavaScript SDK `quests.ListQuestsOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListQuestsOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _status;
  String? get status => _status;
  final String? _category;
  String? get category => _category;
  final bool? _is_public;
  bool? get is_public => _is_public;
  final bool? _is_featured;
  bool? get is_featured => _is_featured;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListQuestsOptions(
      {String? status,
      String? category,
      bool? is_public,
      bool? is_featured,
      num? limit,
      num? offset})
      : _status = status,
        _category = category,
        _is_public = is_public,
        _is_featured = is_featured,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListQuestsOptions.fromJson(JsonMap json)
      : _status = json["status"] == null ? null : json["status"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _is_public =
            json["is_public"] == null ? null : json["is_public"] as bool,
        _is_featured =
            json["is_featured"] == null ? null : json["is_featured"] as bool,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_status != null) "status": jsonValue(_status),
        if (_category != null) "category": jsonValue(_category),
        if (_is_public != null) "is_public": jsonValue(_is_public),
        if (_is_featured != null) "is_featured": jsonValue(_is_featured),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `schemas.Schema`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class Schema implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _version;
  String get version => _version as String;
  final String? _display_name;
  String? get display_name => _display_name;
  final String? _description;
  String? get description => _description;
  final String? _status;
  String get status => _status as String;
  final bool? _is_default;
  bool get is_default => _is_default as bool;
  final num? _usage_count;
  num get usage_count => _usage_count as num;
  final String? _created_at;
  String? get created_at => _created_at;
  final String? _updated_at;
  String? get updated_at => _updated_at;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const Schema(
      {required String id,
      required String name,
      required String version,
      String? display_name,
      String? description,
      required String status,
      required bool is_default,
      required num usage_count,
      String? created_at,
      String? updated_at})
      : _id = id,
        _name = name,
        _version = version,
        _display_name = display_name,
        _description = description,
        _status = status,
        _is_default = is_default,
        _usage_count = usage_count,
        _created_at = created_at,
        _updated_at = updated_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  Schema.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _version = json["version"] == null ? null : json["version"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _is_default =
            json["is_default"] == null ? null : json["is_default"] as bool,
        _usage_count =
            json["usage_count"] == null ? null : json["usage_count"] as num,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _updated_at =
            json["updated_at"] == null ? null : json["updated_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "version": jsonValue(_version),
        if (_display_name != null) "display_name": jsonValue(_display_name),
        if (_description != null) "description": jsonValue(_description),
        "status": jsonValue(_status),
        "is_default": jsonValue(_is_default),
        "usage_count": jsonValue(_usage_count),
        if (_created_at != null) "created_at": jsonValue(_created_at),
        if (_updated_at != null) "updated_at": jsonValue(_updated_at),
      };
}

/// JSON model for JavaScript SDK `schemas.SchemaDetail`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
///
/// Includes the fields and JSON serialization of [Schema].
class SchemaDetail extends Schema {
  final Map<String, Object?>? _schema_definition;
  Map<String, Object?> get schema_definition =>
      _schema_definition as Map<String, Object?>;
  final String? _yaml_content;
  String get yaml_content => _yaml_content as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SchemaDetail(
      {required super.id,
      required super.name,
      required super.version,
      super.display_name,
      super.description,
      required super.status,
      required super.is_default,
      required super.usage_count,
      super.created_at,
      super.updated_at,
      required Map<String, Object?> schema_definition,
      required String yaml_content})
      : _schema_definition = schema_definition,
        _yaml_content = yaml_content;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SchemaDetail.fromJson(JsonMap json)
      : _schema_definition = json["schema_definition"] == null
            ? null
            : asJsonMap(json["schema_definition"]),
        _yaml_content = json["yaml_content"] == null
            ? null
            : json["yaml_content"] as String,
        super.fromJson(json);

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        ...super.toJson(),
        "schema_definition": jsonValue(_schema_definition),
        "yaml_content": jsonValue(_yaml_content),
      };
}

/// JSON model for JavaScript SDK `schemas.SchemaField`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SchemaField implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _type;
  String get type => _type as String;
  final bool? _required;
  bool? get required => _required;
  final String? _description;
  String? get description => _description;
  final Object? _defaultValue;
  Object? get defaultValue => _defaultValue;
  final num? _min;
  num? get min => _min;
  final num? _max;
  num? get max => _max;
  final String? _pattern;
  String? get pattern => _pattern;
  final List<String>? _values;
  List<String>? get values => _values;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SchemaField(
      {required String name,
      required String type,
      bool? required,
      String? description,
      Object? defaultValue,
      num? min,
      num? max,
      String? pattern,
      List<String>? values})
      : _name = name,
        _type = type,
        _required = required,
        _description = description,
        _defaultValue = defaultValue,
        _min = min,
        _max = max,
        _pattern = pattern,
        _values = values,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SchemaField.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _type = json["type"] == null ? null : json["type"] as String,
        _required = json["required"] == null ? null : json["required"] as bool,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _defaultValue = json["default"],
        _min = json["min"] == null ? null : json["min"] as num,
        _max = json["max"] == null ? null : json["max"] as num,
        _pattern = json["pattern"] == null ? null : json["pattern"] as String,
        _values = json["values"] == null
            ? null
            : (json["values"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        "type": jsonValue(_type),
        if (_required != null) "required": jsonValue(_required),
        if (_description != null) "description": jsonValue(_description),
        if (_defaultValue != null) "default": jsonValue(_defaultValue),
        if (_min != null) "min": jsonValue(_min),
        if (_max != null) "max": jsonValue(_max),
        if (_pattern != null) "pattern": jsonValue(_pattern),
        if (_values != null) "values": jsonValue(_values),
      };
}

/// JSON model for JavaScript SDK `schemas.ValidationResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ValidationResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _valid;
  bool get valid => _valid as bool;
  final String? _schema_name;
  String get schema_name => _schema_name as String;
  final String? _schema_version;
  String? get schema_version => _schema_version;
  final List<SchemaValidationError>? _errors;
  List<SchemaValidationError> get errors =>
      _errors as List<SchemaValidationError>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ValidationResult(
      {required bool valid,
      required String schema_name,
      String? schema_version,
      required List<SchemaValidationError> errors})
      : _valid = valid,
        _schema_name = schema_name,
        _schema_version = schema_version,
        _errors = errors,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ValidationResult.fromJson(JsonMap json)
      : _valid = json["valid"] == null ? null : json["valid"] as bool,
        _schema_name =
            json["schema_name"] == null ? null : json["schema_name"] as String,
        _schema_version = json["schema_version"] == null
            ? null
            : json["schema_version"] as String,
        _errors = json["errors"] == null
            ? null
            : (json["errors"] as List<Object?>)
                .map((item) => SchemaValidationError.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "valid": jsonValue(_valid),
        "schema_name": jsonValue(_schema_name),
        if (_schema_version != null)
          "schema_version": jsonValue(_schema_version),
        "errors": jsonValue(_errors),
      };
}

/// JSON model for JavaScript SDK `schemas.ValidationError`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SchemaValidationError implements JsonModel {
  final JsonMap? _originalJson;
  final String? _field;
  String get field => _field as String;
  final String? _message;
  String get message => _message as String;
  final Object? _value;
  Object? get value => _value;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SchemaValidationError(
      {required String field, required String message, Object? value})
      : _field = field,
        _message = message,
        _value = value,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SchemaValidationError.fromJson(JsonMap json)
      : _field = json["field"] == null ? null : json["field"] as String,
        _message = json["message"] == null ? null : json["message"] as String,
        _value = json["value"],
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "field": jsonValue(_field),
        "message": jsonValue(_message),
        if (_value != null) "value": jsonValue(_value),
      };
}

/// JSON model for JavaScript SDK `schemas.SchemaListResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class SchemaListResponse implements JsonModel {
  final JsonMap? _originalJson;
  final List<Schema>? _schemas;
  List<Schema> get schemas => _schemas as List<Schema>;
  final num? _total;
  num get total => _total as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const SchemaListResponse({required List<Schema> schemas, required num total})
      : _schemas = schemas,
        _total = total,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  SchemaListResponse.fromJson(JsonMap json)
      : _schemas = json["schemas"] == null
            ? null
            : (json["schemas"] as List<Object?>)
                .map((item) => Schema.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total = json["total"] == null ? null : json["total"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "schemas": jsonValue(_schemas),
        "total": jsonValue(_total),
      };
}

/// JSON model for JavaScript SDK `schemas.CreateSchemaRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateSchemaRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _yaml_content;
  String get yaml_content => _yaml_content as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateSchemaRequest({required String yaml_content})
      : _yaml_content = yaml_content,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateSchemaRequest.fromJson(JsonMap json)
      : _yaml_content = json["yaml_content"] == null
            ? null
            : json["yaml_content"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "yaml_content": jsonValue(_yaml_content),
      };
}

/// JSON model for JavaScript SDK `schemas.ValidateDataRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ValidateDataRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _schema_name;
  String get schema_name => _schema_name as String;
  final String? _schema_version;
  String? get schema_version => _schema_version;
  final Map<String, Object?>? _data;
  Map<String, Object?> get data => _data as Map<String, Object?>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ValidateDataRequest(
      {required String schema_name,
      String? schema_version,
      required Map<String, Object?> data})
      : _schema_name = schema_name,
        _schema_version = schema_version,
        _data = data,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ValidateDataRequest.fromJson(JsonMap json)
      : _schema_name =
            json["schema_name"] == null ? null : json["schema_name"] as String,
        _schema_version = json["schema_version"] == null
            ? null
            : json["schema_version"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "schema_name": jsonValue(_schema_name),
        if (_schema_version != null)
          "schema_version": jsonValue(_schema_version),
        "data": jsonValue(_data),
      };
}

/// JSON model for JavaScript SDK `schemas.ListSchemasOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListSchemasOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _status;
  String? get status => _status;
  final String? _search;
  String? get search => _search;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListSchemasOptions(
      {String? status, String? search, num? limit, num? offset})
      : _status = status,
        _search = search,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListSchemasOptions.fromJson(JsonMap json)
      : _status = json["status"] == null ? null : json["status"] as String,
        _search = json["search"] == null ? null : json["search"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_status != null) "status": jsonValue(_status),
        if (_search != null) "search": jsonValue(_search),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `dataviews.DataViewColumn`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DataViewColumn implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _type;
  String get type => _type as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DataViewColumn({required String name, required String type})
      : _name = name,
        _type = type,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DataViewColumn.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _type = json["type"] == null ? null : json["type"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        "type": jsonValue(_type),
      };
}

/// JSON model for JavaScript SDK `dataviews.DataViewInfo`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DataViewInfo implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _view_name;
  String get view_name => _view_name as String;
  final String? _description;
  String get description => _description as String;
  final bool? _is_builtin;
  bool get is_builtin => _is_builtin as bool;
  final List<DataViewColumn>? _columns;
  List<DataViewColumn> get columns => _columns as List<DataViewColumn>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DataViewInfo(
      {required String id,
      required String name,
      required String view_name,
      required String description,
      required bool is_builtin,
      required List<DataViewColumn> columns})
      : _id = id,
        _name = name,
        _view_name = view_name,
        _description = description,
        _is_builtin = is_builtin,
        _columns = columns,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DataViewInfo.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _view_name =
            json["view_name"] == null ? null : json["view_name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _is_builtin =
            json["is_builtin"] == null ? null : json["is_builtin"] as bool,
        _columns = json["columns"] == null
            ? null
            : (json["columns"] as List<Object?>)
                .map((item) => DataViewColumn.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "view_name": jsonValue(_view_name),
        "description": jsonValue(_description),
        "is_builtin": jsonValue(_is_builtin),
        "columns": jsonValue(_columns),
      };
}

/// JSON model for JavaScript SDK `dataviews.DataViewListResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DataViewListResponse implements JsonModel {
  final JsonMap? _originalJson;
  final List<DataViewSummary>? _own_views;
  List<DataViewSummary> get own_views => _own_views as List<DataViewSummary>;
  final List<DataViewSummary>? _public_views;
  List<DataViewSummary> get public_views =>
      _public_views as List<DataViewSummary>;
  final List<DataViewSummary>? _builtin_views;
  List<DataViewSummary> get builtin_views =>
      _builtin_views as List<DataViewSummary>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DataViewListResponse(
      {required List<DataViewSummary> own_views,
      required List<DataViewSummary> public_views,
      required List<DataViewSummary> builtin_views})
      : _own_views = own_views,
        _public_views = public_views,
        _builtin_views = builtin_views,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DataViewListResponse.fromJson(JsonMap json)
      : _own_views = json["own_views"] == null
            ? null
            : (json["own_views"] as List<Object?>)
                .map((item) => DataViewSummary.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _public_views = json["public_views"] == null
            ? null
            : (json["public_views"] as List<Object?>)
                .map((item) => DataViewSummary.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _builtin_views = json["builtin_views"] == null
            ? null
            : (json["builtin_views"] as List<Object?>)
                .map((item) => DataViewSummary.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "own_views": jsonValue(_own_views),
        "public_views": jsonValue(_public_views),
        "builtin_views": jsonValue(_builtin_views),
      };
}

/// JSON model for JavaScript SDK `dataviews.DataViewSummary`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DataViewSummary implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _display_name;
  String? get display_name => _display_name;
  final String? _description;
  String get description => _description as String;
  final String? _view_type;
  String? get view_type => _view_type;
  final List<String>? _source_categories;
  List<String>? get source_categories => _source_categories;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DataViewSummary(
      {required String name,
      String? display_name,
      required String description,
      String? view_type,
      List<String>? source_categories})
      : _name = name,
        _display_name = display_name,
        _description = description,
        _view_type = view_type,
        _source_categories = source_categories,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DataViewSummary.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _view_type =
            json["view_type"] == null ? null : json["view_type"] as String,
        _source_categories = json["source_categories"] == null
            ? null
            : (json["source_categories"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        if (_display_name != null) "display_name": jsonValue(_display_name),
        "description": jsonValue(_description),
        if (_view_type != null) "view_type": jsonValue(_view_type),
        if (_source_categories != null)
          "source_categories": jsonValue(_source_categories),
      };
}

/// JSON model for JavaScript SDK `dataviews.DataViewDetail`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DataViewDetail implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _display_name;
  String get display_name => _display_name as String;
  final String? _description;
  String get description => _description as String;
  final String? _view_type;
  String get view_type => _view_type as String;
  final Object? _computation;
  Object? get computation => _computation;
  final List<String>? _source_categories;
  List<String> get source_categories => _source_categories as List<String>;
  final bool? _is_public;
  bool get is_public => _is_public as bool;
  final String? _created_at;
  String get created_at => _created_at as String;
  final String? _updated_at;
  String get updated_at => _updated_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DataViewDetail(
      {required String id,
      required String name,
      required String display_name,
      required String description,
      required String view_type,
      required Object? computation,
      required List<String> source_categories,
      required bool is_public,
      required String created_at,
      required String updated_at})
      : _id = id,
        _name = name,
        _display_name = display_name,
        _description = description,
        _view_type = view_type,
        _computation = computation,
        _source_categories = source_categories,
        _is_public = is_public,
        _created_at = created_at,
        _updated_at = updated_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DataViewDetail.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _view_type =
            json["view_type"] == null ? null : json["view_type"] as String,
        _computation = json["computation"],
        _source_categories = json["source_categories"] == null
            ? null
            : (json["source_categories"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _is_public =
            json["is_public"] == null ? null : json["is_public"] as bool,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _updated_at =
            json["updated_at"] == null ? null : json["updated_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "display_name": jsonValue(_display_name),
        "description": jsonValue(_description),
        "view_type": jsonValue(_view_type),
        "computation": jsonValue(_computation),
        "source_categories": jsonValue(_source_categories),
        "is_public": jsonValue(_is_public),
        "created_at": jsonValue(_created_at),
        "updated_at": jsonValue(_updated_at),
      };
}

/// JSON model for JavaScript SDK `dataviews.DataViewComputation`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DataViewComputation implements JsonModel {
  final JsonMap? _originalJson;
  final String? _type;
  String get type => _type as String;
  final String? _name;
  String? get name => _name;
  final List<String>? _event_types;
  List<String>? get event_types => _event_types;
  final num? _time_window_days;
  num? get time_window_days => _time_window_days;
  final Map<String, num>? _event_weights;
  Map<String, num>? get event_weights => _event_weights;
  final num? _max_score;
  num? get max_score => _max_score;
  final num? _decay_rate;
  num? get decay_rate => _decay_rate;
  final String? _field;
  String? get field => _field;
  final String? _operation;
  String? get operation => _operation;
  final String? _group_by;
  String? get group_by => _group_by;
  final num? _limit;
  num? get limit => _limit;
  final List<String>? _fields;
  List<String>? get fields => _fields;
  final List<TierDefinition>? _tiers;
  List<TierDefinition>? get tiers => _tiers;
  final String? _score_source;
  String? get score_source => _score_source;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DataViewComputation(
      {required String type,
      String? name,
      List<String>? event_types,
      num? time_window_days,
      Map<String, num>? event_weights,
      num? max_score,
      num? decay_rate,
      String? field,
      String? operation,
      String? group_by,
      num? limit,
      List<String>? fields,
      List<TierDefinition>? tiers,
      String? score_source})
      : _type = type,
        _name = name,
        _event_types = event_types,
        _time_window_days = time_window_days,
        _event_weights = event_weights,
        _max_score = max_score,
        _decay_rate = decay_rate,
        _field = field,
        _operation = operation,
        _group_by = group_by,
        _limit = limit,
        _fields = fields,
        _tiers = tiers,
        _score_source = score_source,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DataViewComputation.fromJson(JsonMap json)
      : _type = json["type"] == null ? null : json["type"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _event_types = json["event_types"] == null
            ? null
            : (json["event_types"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _time_window_days = json["time_window_days"] == null
            ? null
            : json["time_window_days"] as num,
        _event_weights = json["event_weights"] == null
            ? null
            : asJsonMap(json["event_weights"])
                .map((key, value) => MapEntry(key, value as num)),
        _max_score =
            json["max_score"] == null ? null : json["max_score"] as num,
        _decay_rate =
            json["decay_rate"] == null ? null : json["decay_rate"] as num,
        _field = json["field"] == null ? null : json["field"] as String,
        _operation =
            json["operation"] == null ? null : json["operation"] as String,
        _group_by =
            json["group_by"] == null ? null : json["group_by"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _fields = json["fields"] == null
            ? null
            : (json["fields"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _tiers = json["tiers"] == null
            ? null
            : (json["tiers"] as List<Object?>)
                .map((item) => TierDefinition.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _score_source = json["score_source"] == null
            ? null
            : json["score_source"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "type": jsonValue(_type),
        if (_name != null) "name": jsonValue(_name),
        if (_event_types != null) "event_types": jsonValue(_event_types),
        if (_time_window_days != null)
          "time_window_days": jsonValue(_time_window_days),
        if (_event_weights != null) "event_weights": jsonValue(_event_weights),
        if (_max_score != null) "max_score": jsonValue(_max_score),
        if (_decay_rate != null) "decay_rate": jsonValue(_decay_rate),
        if (_field != null) "field": jsonValue(_field),
        if (_operation != null) "operation": jsonValue(_operation),
        if (_group_by != null) "group_by": jsonValue(_group_by),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_fields != null) "fields": jsonValue(_fields),
        if (_tiers != null) "tiers": jsonValue(_tiers),
        if (_score_source != null) "score_source": jsonValue(_score_source),
      };
}

/// JSON model for JavaScript SDK `dataviews.TierDefinition`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class TierDefinition implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final num? _min;
  num get min => _min as num;
  final num? _max;
  num get max => _max as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const TierDefinition(
      {required String name, required num min, required num max})
      : _name = name,
        _min = min,
        _max = max,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  TierDefinition.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _min = json["min"] == null ? null : json["min"] as num,
        _max = json["max"] == null ? null : json["max"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        "min": jsonValue(_min),
        "max": jsonValue(_max),
      };
}

/// JSON model for JavaScript SDK `dataviews.DataViewExecuteResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DataViewExecuteResult implements JsonModel {
  final JsonMap? _originalJson;
  final String? _view_name;
  String get view_name => _view_name as String;
  final String? _display_name;
  String get display_name => _display_name as String;
  final String? _identifier;
  String get identifier => _identifier as String;
  final String? _identifier_type;
  String get identifier_type => _identifier_type as String;
  final Map<String, Object?>? _data;
  Map<String, Object?> get data => _data as Map<String, Object?>;
  final String? _computed_at;
  String get computed_at => _computed_at as String;
  final num? _total_events;
  num get total_events => _total_events as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DataViewExecuteResult(
      {required String view_name,
      required String display_name,
      required String identifier,
      required String identifier_type,
      required Map<String, Object?> data,
      required String computed_at,
      required num total_events})
      : _view_name = view_name,
        _display_name = display_name,
        _identifier = identifier,
        _identifier_type = identifier_type,
        _data = data,
        _computed_at = computed_at,
        _total_events = total_events,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DataViewExecuteResult.fromJson(JsonMap json)
      : _view_name =
            json["view_name"] == null ? null : json["view_name"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _identifier =
            json["identifier"] == null ? null : json["identifier"] as String,
        _identifier_type = json["identifier_type"] == null
            ? null
            : json["identifier_type"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _computed_at =
            json["computed_at"] == null ? null : json["computed_at"] as String,
        _total_events =
            json["total_events"] == null ? null : json["total_events"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "view_name": jsonValue(_view_name),
        "display_name": jsonValue(_display_name),
        "identifier": jsonValue(_identifier),
        "identifier_type": jsonValue(_identifier_type),
        "data": jsonValue(_data),
        "computed_at": jsonValue(_computed_at),
        "total_events": jsonValue(_total_events),
      };
}

/// JSON model for JavaScript SDK `dataviews.DataViewPreviewRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DataViewPreviewRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_address;
  String get wallet_address => _wallet_address as String;
  final Object? _computation;
  Object? get computation => _computation;
  final num? _time_window_days;
  num? get time_window_days => _time_window_days;
  final num? _limit;
  num? get limit => _limit;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DataViewPreviewRequest(
      {required String wallet_address,
      required Object? computation,
      num? time_window_days,
      num? limit})
      : _wallet_address = wallet_address,
        _computation = computation,
        _time_window_days = time_window_days,
        _limit = limit,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DataViewPreviewRequest.fromJson(JsonMap json)
      : _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _computation = json["computation"],
        _time_window_days = json["time_window_days"] == null
            ? null
            : json["time_window_days"] as num,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_address": jsonValue(_wallet_address),
        "computation": jsonValue(_computation),
        if (_time_window_days != null)
          "time_window_days": jsonValue(_time_window_days),
        if (_limit != null) "limit": jsonValue(_limit),
      };
}

/// JSON model for JavaScript SDK `dataviews.DataViewPreviewResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class DataViewPreviewResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _preview;
  bool get preview => _preview as bool;
  final String? _wallet_address;
  String get wallet_address => _wallet_address as String;
  final String? _computation_type;
  String get computation_type => _computation_type as String;
  final Map<String, Object?>? _result;
  Map<String, Object?> get result => _result as Map<String, Object?>;
  final num? _events_processed;
  num get events_processed => _events_processed as num;
  final num? _time_window_days;
  num get time_window_days => _time_window_days as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const DataViewPreviewResult(
      {required bool preview,
      required String wallet_address,
      required String computation_type,
      required Map<String, Object?> result,
      required num events_processed,
      required num time_window_days})
      : _preview = preview,
        _wallet_address = wallet_address,
        _computation_type = computation_type,
        _result = result,
        _events_processed = events_processed,
        _time_window_days = time_window_days,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  DataViewPreviewResult.fromJson(JsonMap json)
      : _preview = json["preview"] == null ? null : json["preview"] as bool,
        _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _computation_type = json["computation_type"] == null
            ? null
            : json["computation_type"] as String,
        _result = json["result"] == null ? null : asJsonMap(json["result"]),
        _events_processed = json["events_processed"] == null
            ? null
            : json["events_processed"] as num,
        _time_window_days = json["time_window_days"] == null
            ? null
            : json["time_window_days"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "preview": jsonValue(_preview),
        "wallet_address": jsonValue(_wallet_address),
        "computation_type": jsonValue(_computation_type),
        "result": jsonValue(_result),
        "events_processed": jsonValue(_events_processed),
        "time_window_days": jsonValue(_time_window_days),
      };
}

/// JSON model for JavaScript SDK `dataviews.CreateDataViewRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateDataViewRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _display_name;
  String get display_name => _display_name as String;
  final String? _description;
  String get description => _description as String;
  final String? _view_type;
  String? get view_type => _view_type;
  final Object? _computation;
  Object? get computation => _computation;
  final List<String>? _source_categories;
  List<String>? get source_categories => _source_categories;
  final bool? _is_public;
  bool? get is_public => _is_public;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateDataViewRequest(
      {required String name,
      required String display_name,
      required String description,
      String? view_type,
      required Object? computation,
      List<String>? source_categories,
      bool? is_public})
      : _name = name,
        _display_name = display_name,
        _description = description,
        _view_type = view_type,
        _computation = computation,
        _source_categories = source_categories,
        _is_public = is_public,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateDataViewRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _view_type =
            json["view_type"] == null ? null : json["view_type"] as String,
        _computation = json["computation"],
        _source_categories = json["source_categories"] == null
            ? null
            : (json["source_categories"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _is_public =
            json["is_public"] == null ? null : json["is_public"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        "display_name": jsonValue(_display_name),
        "description": jsonValue(_description),
        if (_view_type != null) "view_type": jsonValue(_view_type),
        "computation": jsonValue(_computation),
        if (_source_categories != null)
          "source_categories": jsonValue(_source_categories),
        if (_is_public != null) "is_public": jsonValue(_is_public),
      };
}

/// JSON model for JavaScript SDK `dataviews.UpdateDataViewRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UpdateDataViewRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _display_name;
  String? get display_name => _display_name;
  final String? _description;
  String? get description => _description;
  final Object? _computation;
  Object? get computation => _computation;
  final List<String>? _source_categories;
  List<String>? get source_categories => _source_categories;
  final bool? _is_public;
  bool? get is_public => _is_public;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UpdateDataViewRequest(
      {String? display_name,
      String? description,
      Object? computation,
      List<String>? source_categories,
      bool? is_public})
      : _display_name = display_name,
        _description = description,
        _computation = computation,
        _source_categories = source_categories,
        _is_public = is_public,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UpdateDataViewRequest.fromJson(JsonMap json)
      : _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _computation = json["computation"],
        _source_categories = json["source_categories"] == null
            ? null
            : (json["source_categories"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _is_public =
            json["is_public"] == null ? null : json["is_public"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_display_name != null) "display_name": jsonValue(_display_name),
        if (_description != null) "description": jsonValue(_description),
        if (_computation != null) "computation": jsonValue(_computation),
        if (_source_categories != null)
          "source_categories": jsonValue(_source_categories),
        if (_is_public != null) "is_public": jsonValue(_is_public),
      };
}

/// JSON model for JavaScript SDK `dataviews.FanProfileView`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FanProfileView implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_address;
  String get wallet_address => _wallet_address as String;
  final num? _fan_score;
  num get fan_score => _fan_score as num;
  final num? _total_events;
  num get total_events => _total_events as num;
  final Map<String, num>? _event_breakdown;
  Map<String, num> get event_breakdown => _event_breakdown as Map<String, num>;
  final String? _first_seen;
  String get first_seen => _first_seen as String;
  final String? _last_seen;
  String get last_seen => _last_seen as String;
  final String? _loyalty_tier;
  String get loyalty_tier => _loyalty_tier as String;
  final String? _computed_at;
  String get computed_at => _computed_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FanProfileView(
      {required String wallet_address,
      required num fan_score,
      required num total_events,
      required Map<String, num> event_breakdown,
      required String first_seen,
      required String last_seen,
      required String loyalty_tier,
      required String computed_at})
      : _wallet_address = wallet_address,
        _fan_score = fan_score,
        _total_events = total_events,
        _event_breakdown = event_breakdown,
        _first_seen = first_seen,
        _last_seen = last_seen,
        _loyalty_tier = loyalty_tier,
        _computed_at = computed_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FanProfileView.fromJson(JsonMap json)
      : _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _fan_score =
            json["fan_score"] == null ? null : json["fan_score"] as num,
        _total_events =
            json["total_events"] == null ? null : json["total_events"] as num,
        _event_breakdown = json["event_breakdown"] == null
            ? null
            : asJsonMap(json["event_breakdown"])
                .map((key, value) => MapEntry(key, value as num)),
        _first_seen =
            json["first_seen"] == null ? null : json["first_seen"] as String,
        _last_seen =
            json["last_seen"] == null ? null : json["last_seen"] as String,
        _loyalty_tier = json["loyalty_tier"] == null
            ? null
            : json["loyalty_tier"] as String,
        _computed_at =
            json["computed_at"] == null ? null : json["computed_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_address": jsonValue(_wallet_address),
        "fan_score": jsonValue(_fan_score),
        "total_events": jsonValue(_total_events),
        "event_breakdown": jsonValue(_event_breakdown),
        "first_seen": jsonValue(_first_seen),
        "last_seen": jsonValue(_last_seen),
        "loyalty_tier": jsonValue(_loyalty_tier),
        "computed_at": jsonValue(_computed_at),
      };
}

/// JSON model for JavaScript SDK `dataviews.ActivitySummaryView`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ActivitySummaryView implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_address;
  String get wallet_address => _wallet_address as String;
  final num? _total_events;
  num get total_events => _total_events as num;
  final Map<String, num>? _event_count_by_type;
  Map<String, num> get event_count_by_type =>
      _event_count_by_type as Map<String, num>;
  final String? _last_activity;
  String get last_activity => _last_activity as String;
  final num? _active_days;
  num get active_days => _active_days as num;
  final num? _period_days;
  num get period_days => _period_days as num;
  final String? _computed_at;
  String get computed_at => _computed_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ActivitySummaryView(
      {required String wallet_address,
      required num total_events,
      required Map<String, num> event_count_by_type,
      required String last_activity,
      required num active_days,
      required num period_days,
      required String computed_at})
      : _wallet_address = wallet_address,
        _total_events = total_events,
        _event_count_by_type = event_count_by_type,
        _last_activity = last_activity,
        _active_days = active_days,
        _period_days = period_days,
        _computed_at = computed_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ActivitySummaryView.fromJson(JsonMap json)
      : _wallet_address = json["wallet_address"] == null
            ? null
            : json["wallet_address"] as String,
        _total_events =
            json["total_events"] == null ? null : json["total_events"] as num,
        _event_count_by_type = json["event_count_by_type"] == null
            ? null
            : asJsonMap(json["event_count_by_type"])
                .map((key, value) => MapEntry(key, value as num)),
        _last_activity = json["last_activity"] == null
            ? null
            : json["last_activity"] as String,
        _active_days =
            json["active_days"] == null ? null : json["active_days"] as num,
        _period_days =
            json["period_days"] == null ? null : json["period_days"] as num,
        _computed_at =
            json["computed_at"] == null ? null : json["computed_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_address": jsonValue(_wallet_address),
        "total_events": jsonValue(_total_events),
        "event_count_by_type": jsonValue(_event_count_by_type),
        "last_activity": jsonValue(_last_activity),
        "active_days": jsonValue(_active_days),
        "period_days": jsonValue(_period_days),
        "computed_at": jsonValue(_computed_at),
      };
}

/// JSON model for JavaScript SDK `dataviews.EventMetadata`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EventMetadata implements JsonModel {
  final JsonMap? _originalJson;
  final List<EventMetadataEventTypesItem>? _event_types;
  List<EventMetadataEventTypesItem> get event_types =>
      _event_types as List<EventMetadataEventTypesItem>;
  final num? _total_events;
  num get total_events => _total_events as num;
  final List<String>? _categories;
  List<String> get categories => _categories as List<String>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EventMetadata(
      {required List<EventMetadataEventTypesItem> event_types,
      required num total_events,
      required List<String> categories})
      : _event_types = event_types,
        _total_events = total_events,
        _categories = categories,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EventMetadata.fromJson(JsonMap json)
      : _event_types = json["event_types"] == null
            ? null
            : (json["event_types"] as List<Object?>)
                .map((item) =>
                    EventMetadataEventTypesItem.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total_events =
            json["total_events"] == null ? null : json["total_events"] as num,
        _categories = json["categories"] == null
            ? null
            : (json["categories"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "event_types": jsonValue(_event_types),
        "total_events": jsonValue(_total_events),
        "categories": jsonValue(_categories),
      };
}

/// JSON model for JavaScript SDK `dataviews.ViewTemplate`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ViewTemplate implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String get description => _description as String;
  final DataViewComputation? _computation;
  DataViewComputation get computation => _computation as DataViewComputation;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ViewTemplate(
      {required String id,
      required String name,
      required String description,
      required DataViewComputation computation})
      : _id = id,
        _name = name,
        _description = description,
        _computation = computation,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ViewTemplate.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _computation = json["computation"] == null
            ? null
            : DataViewComputation.fromJson(asJsonMap(json["computation"])),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "description": jsonValue(_description),
        "computation": jsonValue(_computation),
      };
}

/// JSON model for JavaScript SDK `cohorts.LeaderboardUserProfile`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class LeaderboardUserProfile implements JsonModel {
  final JsonMap? _originalJson;
  final String? _external_id;
  String get external_id => _external_id as String;
  final String? _display_name;
  String? get display_name => _display_name;
  final String? _first_name;
  String? get first_name => _first_name;
  final String? _last_name;
  String? get last_name => _last_name;
  final String? _email;
  String? get email => _email;
  final String? _avatar_url;
  String? get avatar_url => _avatar_url;
  final String? _country;
  String? get country => _country;
  final String? _city;
  String? get city => _city;
  final Map<String, Object?>? _attributes;
  Map<String, Object?> get attributes => _attributes as Map<String, Object?>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const LeaderboardUserProfile(
      {required String external_id,
      required String? display_name,
      required String? first_name,
      required String? last_name,
      required String? email,
      required String? avatar_url,
      required String? country,
      required String? city,
      required Map<String, Object?> attributes})
      : _external_id = external_id,
        _display_name = display_name,
        _first_name = first_name,
        _last_name = last_name,
        _email = email,
        _avatar_url = avatar_url,
        _country = country,
        _city = city,
        _attributes = attributes,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  LeaderboardUserProfile.fromJson(JsonMap json)
      : _external_id =
            json["external_id"] == null ? null : json["external_id"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _first_name =
            json["first_name"] == null ? null : json["first_name"] as String,
        _last_name =
            json["last_name"] == null ? null : json["last_name"] as String,
        _email = json["email"] == null ? null : json["email"] as String,
        _avatar_url =
            json["avatar_url"] == null ? null : json["avatar_url"] as String,
        _country = json["country"] == null ? null : json["country"] as String,
        _city = json["city"] == null ? null : json["city"] as String,
        _attributes =
            json["attributes"] == null ? null : asJsonMap(json["attributes"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "external_id": jsonValue(_external_id),
        "display_name": jsonValue(_display_name),
        "first_name": jsonValue(_first_name),
        "last_name": jsonValue(_last_name),
        "email": jsonValue(_email),
        "avatar_url": jsonValue(_avatar_url),
        "country": jsonValue(_country),
        "city": jsonValue(_city),
        "attributes": jsonValue(_attributes),
      };
}

/// JSON model for JavaScript SDK `cohorts.CohortLeaderboardEntry`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CohortLeaderboardEntry implements JsonModel {
  final JsonMap? _originalJson;
  final num? _rank;
  num get rank => _rank as num;
  final String? _user_id;
  String get user_id => _user_id as String;
  final num? _score;
  num get score => _score as num;
  final num? _percentile_global;
  num get percentile_global => _percentile_global as num;
  final num? _percentile_filtered;
  num? get percentile_filtered => _percentile_filtered;
  final String? _computed_at;
  String? get computed_at => _computed_at;
  final LeaderboardUserProfile? _user;
  LeaderboardUserProfile? get user => _user;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CohortLeaderboardEntry(
      {required num rank,
      required String user_id,
      required num score,
      required num percentile_global,
      required num? percentile_filtered,
      String? computed_at,
      LeaderboardUserProfile? user})
      : _rank = rank,
        _user_id = user_id,
        _score = score,
        _percentile_global = percentile_global,
        _percentile_filtered = percentile_filtered,
        _computed_at = computed_at,
        _user = user,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CohortLeaderboardEntry.fromJson(JsonMap json)
      : _rank = json["rank"] == null ? null : json["rank"] as num,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _score = json["score"] == null ? null : json["score"] as num,
        _percentile_global = json["percentile_global"] == null
            ? null
            : json["percentile_global"] as num,
        _percentile_filtered = json["percentile_filtered"] == null
            ? null
            : json["percentile_filtered"] as num,
        _computed_at =
            json["computed_at"] == null ? null : json["computed_at"] as String,
        _user = json["user"] == null
            ? null
            : LeaderboardUserProfile.fromJson(asJsonMap(json["user"])),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "rank": jsonValue(_rank),
        "user_id": jsonValue(_user_id),
        "score": jsonValue(_score),
        "percentile_global": jsonValue(_percentile_global),
        "percentile_filtered": jsonValue(_percentile_filtered),
        if (_computed_at != null) "computed_at": jsonValue(_computed_at),
        if (_user != null) "user": jsonValue(_user),
      };
}

/// JSON model for JavaScript SDK `cohorts.CohortGroupStats`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CohortGroupStats implements JsonModel {
  final JsonMap? _originalJson;
  final num? _filtered_avg_percentile;
  num? get filtered_avg_percentile => _filtered_avg_percentile;
  final num? _filtered_top_n_avg_percentile;
  num? get filtered_top_n_avg_percentile => _filtered_top_n_avg_percentile;
  final num? _global_count;
  num get global_count => _global_count as num;
  final num? _global_avg_percentile;
  num get global_avg_percentile => _global_avg_percentile as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CohortGroupStats(
      {required num? filtered_avg_percentile,
      required num? filtered_top_n_avg_percentile,
      required num global_count,
      required num global_avg_percentile})
      : _filtered_avg_percentile = filtered_avg_percentile,
        _filtered_top_n_avg_percentile = filtered_top_n_avg_percentile,
        _global_count = global_count,
        _global_avg_percentile = global_avg_percentile,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CohortGroupStats.fromJson(JsonMap json)
      : _filtered_avg_percentile = json["filtered_avg_percentile"] == null
            ? null
            : json["filtered_avg_percentile"] as num,
        _filtered_top_n_avg_percentile =
            json["filtered_top_n_avg_percentile"] == null
                ? null
                : json["filtered_top_n_avg_percentile"] as num,
        _global_count =
            json["global_count"] == null ? null : json["global_count"] as num,
        _global_avg_percentile = json["global_avg_percentile"] == null
            ? null
            : json["global_avg_percentile"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "filtered_avg_percentile": jsonValue(_filtered_avg_percentile),
        "filtered_top_n_avg_percentile":
            jsonValue(_filtered_top_n_avg_percentile),
        "global_count": jsonValue(_global_count),
        "global_avg_percentile": jsonValue(_global_avg_percentile),
      };
}

/// JSON model for JavaScript SDK `cohorts.CohortLeaderboardResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CohortLeaderboardResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _cohort_id;
  String get cohort_id => _cohort_id as String;
  final String? _cohort_name;
  String get cohort_name => _cohort_name as String;
  final Map<String, Object?>? _filter;
  Map<String, Object?> get filter => _filter as Map<String, Object?>;
  final num? _total_users;
  num get total_users => _total_users as num;
  final CohortGroupStats? _group_stats;
  CohortGroupStats get group_stats => _group_stats as CohortGroupStats;
  final List<CohortLeaderboardEntry>? _leaderboard;
  List<CohortLeaderboardEntry> get leaderboard =>
      _leaderboard as List<CohortLeaderboardEntry>;
  final CohortLeaderboardEntry? _current_user;
  CohortLeaderboardEntry? get current_user => _current_user;
  final bool? _current_user_in_leaderboard;
  bool get current_user_in_leaderboard => _current_user_in_leaderboard as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CohortLeaderboardResponse(
      {required String cohort_id,
      required String cohort_name,
      required Map<String, Object?> filter,
      required num total_users,
      required CohortGroupStats group_stats,
      required List<CohortLeaderboardEntry> leaderboard,
      required CohortLeaderboardEntry? current_user,
      required bool current_user_in_leaderboard})
      : _cohort_id = cohort_id,
        _cohort_name = cohort_name,
        _filter = filter,
        _total_users = total_users,
        _group_stats = group_stats,
        _leaderboard = leaderboard,
        _current_user = current_user,
        _current_user_in_leaderboard = current_user_in_leaderboard,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CohortLeaderboardResponse.fromJson(JsonMap json)
      : _cohort_id =
            json["cohort_id"] == null ? null : json["cohort_id"] as String,
        _cohort_name =
            json["cohort_name"] == null ? null : json["cohort_name"] as String,
        _filter = json["filter"] == null ? null : asJsonMap(json["filter"]),
        _total_users =
            json["total_users"] == null ? null : json["total_users"] as num,
        _group_stats = json["group_stats"] == null
            ? null
            : CohortGroupStats.fromJson(asJsonMap(json["group_stats"])),
        _leaderboard = json["leaderboard"] == null
            ? null
            : (json["leaderboard"] as List<Object?>)
                .map((item) => CohortLeaderboardEntry.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _current_user = json["current_user"] == null
            ? null
            : CohortLeaderboardEntry.fromJson(asJsonMap(json["current_user"])),
        _current_user_in_leaderboard =
            json["current_user_in_leaderboard"] == null
                ? null
                : json["current_user_in_leaderboard"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "cohort_id": jsonValue(_cohort_id),
        "cohort_name": jsonValue(_cohort_name),
        "filter": jsonValue(_filter),
        "total_users": jsonValue(_total_users),
        "group_stats": jsonValue(_group_stats),
        "leaderboard": jsonValue(_leaderboard),
        "current_user": jsonValue(_current_user),
        "current_user_in_leaderboard": jsonValue(_current_user_in_leaderboard),
      };
}

/// JSON model for JavaScript SDK `cohorts.CohortDefinition`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CohortDefinition implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final String? _name;
  String get name => _name as String;
  final String? _slug;
  String get slug => _slug as String;
  final String? _description;
  String? get description => _description;
  final String? _scoring_type;
  String get scoring_type => _scoring_type as String;
  final String? _icon;
  String? get icon => _icon;
  final String? _color;
  String? get color => _color;
  final String? _status;
  String get status => _status as String;
  final num? _avg_score;
  num? get avg_score => _avg_score;
  final num? _total_users;
  num? get total_users => _total_users;
  final String? _created_at;
  String get created_at => _created_at as String;
  final String? _updated_at;
  String get updated_at => _updated_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CohortDefinition(
      {required String id,
      required String tenant_id,
      required String name,
      required String slug,
      String? description,
      required String scoring_type,
      String? icon,
      String? color,
      required String status,
      num? avg_score,
      num? total_users,
      required String created_at,
      required String updated_at})
      : _id = id,
        _tenant_id = tenant_id,
        _name = name,
        _slug = slug,
        _description = description,
        _scoring_type = scoring_type,
        _icon = icon,
        _color = color,
        _status = status,
        _avg_score = avg_score,
        _total_users = total_users,
        _created_at = created_at,
        _updated_at = updated_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CohortDefinition.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _scoring_type = json["scoring_type"] == null
            ? null
            : json["scoring_type"] as String,
        _icon = json["icon"] == null ? null : json["icon"] as String,
        _color = json["color"] == null ? null : json["color"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _avg_score =
            json["avg_score"] == null ? null : json["avg_score"] as num,
        _total_users =
            json["total_users"] == null ? null : json["total_users"] as num,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _updated_at =
            json["updated_at"] == null ? null : json["updated_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "tenant_id": jsonValue(_tenant_id),
        "name": jsonValue(_name),
        "slug": jsonValue(_slug),
        if (_description != null) "description": jsonValue(_description),
        "scoring_type": jsonValue(_scoring_type),
        if (_icon != null) "icon": jsonValue(_icon),
        if (_color != null) "color": jsonValue(_color),
        "status": jsonValue(_status),
        if (_avg_score != null) "avg_score": jsonValue(_avg_score),
        if (_total_users != null) "total_users": jsonValue(_total_users),
        "created_at": jsonValue(_created_at),
        "updated_at": jsonValue(_updated_at),
      };
}

/// JSON model for JavaScript SDK `cohorts.UserCohortBreakdownEntry`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserCohortBreakdownEntry implements JsonModel {
  final JsonMap? _originalJson;
  final String? _cohort_id;
  String get cohort_id => _cohort_id as String;
  final String? _cohort_slug;
  String get cohort_slug => _cohort_slug as String;
  final String? _cohort_name;
  String get cohort_name => _cohort_name as String;
  final String? _icon;
  String? get icon => _icon;
  final String? _color;
  String? get color => _color;
  final num? _user_percentile;

  /// The user's percentile within this cohort (0–100). Defaults to `0` for
  /// cohorts the user has no score in — every active cohort is always present
  /// (see `UserBreakdownResponse.cohorts`), so an unscored cohort surfaces
  /// as a 0-percentile entry rather than being omitted.
  num get user_percentile => _user_percentile as num;
  final num? _filtered_group_avg_percentile;
  num? get filtered_group_avg_percentile => _filtered_group_avg_percentile;
  final num? _global_group_avg_percentile;
  num get global_group_avg_percentile => _global_group_avg_percentile as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserCohortBreakdownEntry(
      {required String cohort_id,
      required String cohort_slug,
      required String cohort_name,
      String? icon,
      String? color,
      required num user_percentile,
      required num? filtered_group_avg_percentile,
      required num global_group_avg_percentile})
      : _cohort_id = cohort_id,
        _cohort_slug = cohort_slug,
        _cohort_name = cohort_name,
        _icon = icon,
        _color = color,
        _user_percentile = user_percentile,
        _filtered_group_avg_percentile = filtered_group_avg_percentile,
        _global_group_avg_percentile = global_group_avg_percentile,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserCohortBreakdownEntry.fromJson(JsonMap json)
      : _cohort_id =
            json["cohort_id"] == null ? null : json["cohort_id"] as String,
        _cohort_slug =
            json["cohort_slug"] == null ? null : json["cohort_slug"] as String,
        _cohort_name =
            json["cohort_name"] == null ? null : json["cohort_name"] as String,
        _icon = json["icon"] == null ? null : json["icon"] as String,
        _color = json["color"] == null ? null : json["color"] as String,
        _user_percentile = json["user_percentile"] == null
            ? null
            : json["user_percentile"] as num,
        _filtered_group_avg_percentile =
            json["filtered_group_avg_percentile"] == null
                ? null
                : json["filtered_group_avg_percentile"] as num,
        _global_group_avg_percentile =
            json["global_group_avg_percentile"] == null
                ? null
                : json["global_group_avg_percentile"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "cohort_id": jsonValue(_cohort_id),
        "cohort_slug": jsonValue(_cohort_slug),
        "cohort_name": jsonValue(_cohort_name),
        if (_icon != null) "icon": jsonValue(_icon),
        if (_color != null) "color": jsonValue(_color),
        "user_percentile": jsonValue(_user_percentile),
        "filtered_group_avg_percentile":
            jsonValue(_filtered_group_avg_percentile),
        "global_group_avg_percentile": jsonValue(_global_group_avg_percentile),
      };
}

/// JSON model for JavaScript SDK `cohorts.UserBreakdownResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserBreakdownResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final Map<String, Object?>? _filter;
  Map<String, Object?> get filter => _filter as Map<String, Object?>;
  final List<UserCohortBreakdownEntry>? _cohorts;

  /// One entry per active cohort in the tenant — including cohorts the user is
  /// not scored in (those come back with `user_percentile: 0`). The set is
  /// stable regardless of the user's scores, so consumers can render a fixed
  /// cohort layout without rows appearing/disappearing as scores change.
  List<UserCohortBreakdownEntry> get cohorts =>
      _cohorts as List<UserCohortBreakdownEntry>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserBreakdownResponse(
      {required String user_id,
      required Map<String, Object?> filter,
      required List<UserCohortBreakdownEntry> cohorts})
      : _user_id = user_id,
        _filter = filter,
        _cohorts = cohorts,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserBreakdownResponse.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _filter = json["filter"] == null ? null : asJsonMap(json["filter"]),
        _cohorts = json["cohorts"] == null
            ? null
            : (json["cohorts"] as List<Object?>)
                .map((item) =>
                    UserCohortBreakdownEntry.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "filter": jsonValue(_filter),
        "cohorts": jsonValue(_cohorts),
      };
}

/// JSON model for JavaScript SDK `cohorts.CohortLeaderboardOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CohortLeaderboardOptions implements JsonModel {
  final JsonMap? _originalJson;
  final Map<String, String>? _filters;
  Map<String, String>? get filters => _filters;
  final String? _country;
  String? get country => _country;
  final num? _limit;
  num? get limit => _limit;
  final num? _top_n;
  num? get top_n => _top_n;
  final bool? _fresh;
  bool? get fresh => _fresh;
  final String? _userId;
  String? get userId => _userId;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CohortLeaderboardOptions(
      {Map<String, String>? filters,
      String? country,
      num? limit,
      num? top_n,
      bool? fresh,
      String? userId})
      : _filters = filters,
        _country = country,
        _limit = limit,
        _top_n = top_n,
        _fresh = fresh,
        _userId = userId,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CohortLeaderboardOptions.fromJson(JsonMap json)
      : _filters = json["filters"] == null
            ? null
            : asJsonMap(json["filters"])
                .map((key, value) => MapEntry(key, value as String)),
        _country = json["country"] == null ? null : json["country"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _top_n = json["top_n"] == null ? null : json["top_n"] as num,
        _fresh = json["fresh"] == null ? null : json["fresh"] as bool,
        _userId = json["userId"] == null ? null : json["userId"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_filters != null) "filters": jsonValue(_filters),
        if (_country != null) "country": jsonValue(_country),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_top_n != null) "top_n": jsonValue(_top_n),
        if (_fresh != null) "fresh": jsonValue(_fresh),
        if (_userId != null) "userId": jsonValue(_userId),
      };
}

/// JSON model for JavaScript SDK `cohorts.ListCohortsOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListCohortsOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _status;
  String? get status => _status;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListCohortsOptions({String? status, num? limit, num? offset})
      : _status = status,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListCohortsOptions.fromJson(JsonMap json)
      : _status = json["status"] == null ? null : json["status"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_status != null) "status": jsonValue(_status),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `fanpass_leaderboard.LeaderboardUserProfile`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FanpassLeaderboardUserProfile implements JsonModel {
  final JsonMap? _originalJson;
  final String? _external_id;
  String get external_id => _external_id as String;
  final String? _display_name;
  String? get display_name => _display_name;
  final String? _first_name;
  String? get first_name => _first_name;
  final String? _last_name;
  String? get last_name => _last_name;
  final String? _email;
  String? get email => _email;
  final String? _avatar_url;
  String? get avatar_url => _avatar_url;
  final String? _country;
  String? get country => _country;
  final String? _city;
  String? get city => _city;
  final Map<String, Object?>? _attributes;
  Map<String, Object?> get attributes => _attributes as Map<String, Object?>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FanpassLeaderboardUserProfile(
      {required String external_id,
      required String? display_name,
      required String? first_name,
      required String? last_name,
      required String? email,
      required String? avatar_url,
      required String? country,
      required String? city,
      required Map<String, Object?> attributes})
      : _external_id = external_id,
        _display_name = display_name,
        _first_name = first_name,
        _last_name = last_name,
        _email = email,
        _avatar_url = avatar_url,
        _country = country,
        _city = city,
        _attributes = attributes,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FanpassLeaderboardUserProfile.fromJson(JsonMap json)
      : _external_id =
            json["external_id"] == null ? null : json["external_id"] as String,
        _display_name = json["display_name"] == null
            ? null
            : json["display_name"] as String,
        _first_name =
            json["first_name"] == null ? null : json["first_name"] as String,
        _last_name =
            json["last_name"] == null ? null : json["last_name"] as String,
        _email = json["email"] == null ? null : json["email"] as String,
        _avatar_url =
            json["avatar_url"] == null ? null : json["avatar_url"] as String,
        _country = json["country"] == null ? null : json["country"] as String,
        _city = json["city"] == null ? null : json["city"] as String,
        _attributes =
            json["attributes"] == null ? null : asJsonMap(json["attributes"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "external_id": jsonValue(_external_id),
        "display_name": jsonValue(_display_name),
        "first_name": jsonValue(_first_name),
        "last_name": jsonValue(_last_name),
        "email": jsonValue(_email),
        "avatar_url": jsonValue(_avatar_url),
        "country": jsonValue(_country),
        "city": jsonValue(_city),
        "attributes": jsonValue(_attributes),
      };
}

/// JSON model for JavaScript SDK `fanpass_leaderboard.FanpassLeaderboardEntry`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FanpassLeaderboardEntry implements JsonModel {
  final JsonMap? _originalJson;
  final num? _rank;
  num get rank => _rank as num;
  final String? _user_id;
  String get user_id => _user_id as String;
  final num? _fan_score;
  num get fan_score => _fan_score as num;
  final num? _normalized_score;
  num get normalized_score => _normalized_score as num;
  final num? _raw_score;
  num get raw_score => _raw_score as num;
  final num? _percentile;
  num get percentile => _percentile as num;
  final String? _computed_at;
  String? get computed_at => _computed_at;
  final FanpassLeaderboardUserProfile? _user;
  FanpassLeaderboardUserProfile? get user => _user;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FanpassLeaderboardEntry(
      {required num rank,
      required String user_id,
      required num fan_score,
      required num normalized_score,
      required num raw_score,
      required num percentile,
      String? computed_at,
      FanpassLeaderboardUserProfile? user})
      : _rank = rank,
        _user_id = user_id,
        _fan_score = fan_score,
        _normalized_score = normalized_score,
        _raw_score = raw_score,
        _percentile = percentile,
        _computed_at = computed_at,
        _user = user,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FanpassLeaderboardEntry.fromJson(JsonMap json)
      : _rank = json["rank"] == null ? null : json["rank"] as num,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _fan_score =
            json["fan_score"] == null ? null : json["fan_score"] as num,
        _normalized_score = json["normalized_score"] == null
            ? null
            : json["normalized_score"] as num,
        _raw_score =
            json["raw_score"] == null ? null : json["raw_score"] as num,
        _percentile =
            json["percentile"] == null ? null : json["percentile"] as num,
        _computed_at =
            json["computed_at"] == null ? null : json["computed_at"] as String,
        _user = json["user"] == null
            ? null
            : FanpassLeaderboardUserProfile.fromJson(asJsonMap(json["user"])),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "rank": jsonValue(_rank),
        "user_id": jsonValue(_user_id),
        "fan_score": jsonValue(_fan_score),
        "normalized_score": jsonValue(_normalized_score),
        "raw_score": jsonValue(_raw_score),
        "percentile": jsonValue(_percentile),
        if (_computed_at != null) "computed_at": jsonValue(_computed_at),
        if (_user != null) "user": jsonValue(_user),
      };
}

/// JSON model for JavaScript SDK `fanpass_leaderboard.FanpassGroupStats`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FanpassGroupStats implements JsonModel {
  final JsonMap? _originalJson;
  final num? _avg_fan_score;
  num get avg_fan_score => _avg_fan_score as num;
  final num? _top_n_avg_fan_score;
  num get top_n_avg_fan_score => _top_n_avg_fan_score as num;
  final num? _global_count;
  num get global_count => _global_count as num;
  final num? _global_avg_fan_score;
  num get global_avg_fan_score => _global_avg_fan_score as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FanpassGroupStats(
      {required num avg_fan_score,
      required num top_n_avg_fan_score,
      required num global_count,
      required num global_avg_fan_score})
      : _avg_fan_score = avg_fan_score,
        _top_n_avg_fan_score = top_n_avg_fan_score,
        _global_count = global_count,
        _global_avg_fan_score = global_avg_fan_score,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FanpassGroupStats.fromJson(JsonMap json)
      : _avg_fan_score =
            json["avg_fan_score"] == null ? null : json["avg_fan_score"] as num,
        _top_n_avg_fan_score = json["top_n_avg_fan_score"] == null
            ? null
            : json["top_n_avg_fan_score"] as num,
        _global_count =
            json["global_count"] == null ? null : json["global_count"] as num,
        _global_avg_fan_score = json["global_avg_fan_score"] == null
            ? null
            : json["global_avg_fan_score"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "avg_fan_score": jsonValue(_avg_fan_score),
        "top_n_avg_fan_score": jsonValue(_top_n_avg_fan_score),
        "global_count": jsonValue(_global_count),
        "global_avg_fan_score": jsonValue(_global_avg_fan_score),
      };
}

/// One entry per cohort opted into the public roster (cohort
/// `is_default=true` on the tenant, set via the portal's Scoring Cohorts
/// page — see PR notes / migration 066). Cohorts with no scored users yet
/// (e.g. a newly-created segment) carry `status: "no_entries_yet"` rather
/// than being omitted, so the roster set is stable to render as tabs/badges.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FanpassCohortStatus implements JsonModel {
  final JsonMap? _originalJson;
  final String? _cohort_slug;
  String get cohort_slug => _cohort_slug as String;
  final String? _cohort_name;
  String get cohort_name => _cohort_name as String;
  final num? _users_scored;
  num get users_scored => _users_scored as num;
  final String? _status;
  String get status => _status as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FanpassCohortStatus(
      {required String cohort_slug,
      required String cohort_name,
      required num users_scored,
      required String status})
      : _cohort_slug = cohort_slug,
        _cohort_name = cohort_name,
        _users_scored = users_scored,
        _status = status,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FanpassCohortStatus.fromJson(JsonMap json)
      : _cohort_slug =
            json["cohort_slug"] == null ? null : json["cohort_slug"] as String,
        _cohort_name =
            json["cohort_name"] == null ? null : json["cohort_name"] as String,
        _users_scored =
            json["users_scored"] == null ? null : json["users_scored"] as num,
        _status = json["status"] == null ? null : json["status"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "cohort_slug": jsonValue(_cohort_slug),
        "cohort_name": jsonValue(_cohort_name),
        "users_scored": jsonValue(_users_scored),
        "status": jsonValue(_status),
      };
}

/// JSON model for JavaScript SDK `fanpass_leaderboard.FanpassLeaderboardResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FanpassLeaderboardResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _aggregation_rule_id;
  String? get aggregation_rule_id => _aggregation_rule_id;
  final String? _aggregation_rule_name;
  String? get aggregation_rule_name => _aggregation_rule_name;
  final Map<String, Object?>? _filter;
  Map<String, Object?> get filter => _filter as Map<String, Object?>;
  final num? _total_users;
  num get total_users => _total_users as num;
  final FanpassGroupStats? _group_stats;
  FanpassGroupStats get group_stats => _group_stats as FanpassGroupStats;
  final List<FanpassLeaderboardEntry>? _leaderboard;
  List<FanpassLeaderboardEntry> get leaderboard =>
      _leaderboard as List<FanpassLeaderboardEntry>;
  final List<FanpassCohortStatus>? _cohorts;

  /// Full roster of public cohorts for the tenant — see `FanpassCohortStatus`.
  List<FanpassCohortStatus> get cohorts =>
      _cohorts as List<FanpassCohortStatus>;
  final FanpassLeaderboardEntry? _current_user;
  FanpassLeaderboardEntry? get current_user => _current_user;
  final bool? _current_user_in_leaderboard;
  bool get current_user_in_leaderboard => _current_user_in_leaderboard as bool;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FanpassLeaderboardResponse(
      {required String? aggregation_rule_id,
      required String? aggregation_rule_name,
      required Map<String, Object?> filter,
      required num total_users,
      required FanpassGroupStats group_stats,
      required List<FanpassLeaderboardEntry> leaderboard,
      required List<FanpassCohortStatus> cohorts,
      required FanpassLeaderboardEntry? current_user,
      required bool current_user_in_leaderboard})
      : _aggregation_rule_id = aggregation_rule_id,
        _aggregation_rule_name = aggregation_rule_name,
        _filter = filter,
        _total_users = total_users,
        _group_stats = group_stats,
        _leaderboard = leaderboard,
        _cohorts = cohorts,
        _current_user = current_user,
        _current_user_in_leaderboard = current_user_in_leaderboard,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FanpassLeaderboardResponse.fromJson(JsonMap json)
      : _aggregation_rule_id = json["aggregation_rule_id"] == null
            ? null
            : json["aggregation_rule_id"] as String,
        _aggregation_rule_name = json["aggregation_rule_name"] == null
            ? null
            : json["aggregation_rule_name"] as String,
        _filter = json["filter"] == null ? null : asJsonMap(json["filter"]),
        _total_users =
            json["total_users"] == null ? null : json["total_users"] as num,
        _group_stats = json["group_stats"] == null
            ? null
            : FanpassGroupStats.fromJson(asJsonMap(json["group_stats"])),
        _leaderboard = json["leaderboard"] == null
            ? null
            : (json["leaderboard"] as List<Object?>)
                .map(
                    (item) => FanpassLeaderboardEntry.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _cohorts = json["cohorts"] == null
            ? null
            : (json["cohorts"] as List<Object?>)
                .map((item) => FanpassCohortStatus.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _current_user = json["current_user"] == null
            ? null
            : FanpassLeaderboardEntry.fromJson(asJsonMap(json["current_user"])),
        _current_user_in_leaderboard =
            json["current_user_in_leaderboard"] == null
                ? null
                : json["current_user_in_leaderboard"] as bool,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "aggregation_rule_id": jsonValue(_aggregation_rule_id),
        "aggregation_rule_name": jsonValue(_aggregation_rule_name),
        "filter": jsonValue(_filter),
        "total_users": jsonValue(_total_users),
        "group_stats": jsonValue(_group_stats),
        "leaderboard": jsonValue(_leaderboard),
        "cohorts": jsonValue(_cohorts),
        "current_user": jsonValue(_current_user),
        "current_user_in_leaderboard": jsonValue(_current_user_in_leaderboard),
      };
}

/// JSON model for JavaScript SDK `fanpass_leaderboard.FanpassUserComparisonResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FanpassUserComparisonResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final Map<String, Object?>? _filter;
  Map<String, Object?> get filter => _filter as Map<String, Object?>;
  final List<UserCohortBreakdownEntry>? _cohorts;
  List<UserCohortBreakdownEntry> get cohorts =>
      _cohorts as List<UserCohortBreakdownEntry>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FanpassUserComparisonResponse(
      {required String user_id,
      required Map<String, Object?> filter,
      required List<UserCohortBreakdownEntry> cohorts})
      : _user_id = user_id,
        _filter = filter,
        _cohorts = cohorts,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FanpassUserComparisonResponse.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _filter = json["filter"] == null ? null : asJsonMap(json["filter"]),
        _cohorts = json["cohorts"] == null
            ? null
            : (json["cohorts"] as List<Object?>)
                .map((item) =>
                    UserCohortBreakdownEntry.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "filter": jsonValue(_filter),
        "cohorts": jsonValue(_cohorts),
      };
}

/// JSON model for JavaScript SDK `fanpass_leaderboard.FanpassLeaderboardOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class FanpassLeaderboardOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _aggregationRuleId;
  String? get aggregationRuleId => _aggregationRuleId;
  final Map<String, String>? _filters;
  Map<String, String>? get filters => _filters;
  final String? _country;
  String? get country => _country;
  final num? _limit;
  num? get limit => _limit;
  final num? _top_n;
  num? get top_n => _top_n;
  final bool? _fresh;
  bool? get fresh => _fresh;
  final String? _userId;
  String? get userId => _userId;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const FanpassLeaderboardOptions(
      {String? aggregationRuleId,
      Map<String, String>? filters,
      String? country,
      num? limit,
      num? top_n,
      bool? fresh,
      String? userId})
      : _aggregationRuleId = aggregationRuleId,
        _filters = filters,
        _country = country,
        _limit = limit,
        _top_n = top_n,
        _fresh = fresh,
        _userId = userId,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  FanpassLeaderboardOptions.fromJson(JsonMap json)
      : _aggregationRuleId = json["aggregationRuleId"] == null
            ? null
            : json["aggregationRuleId"] as String,
        _filters = json["filters"] == null
            ? null
            : asJsonMap(json["filters"])
                .map((key, value) => MapEntry(key, value as String)),
        _country = json["country"] == null ? null : json["country"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _top_n = json["top_n"] == null ? null : json["top_n"] as num,
        _fresh = json["fresh"] == null ? null : json["fresh"] as bool,
        _userId = json["userId"] == null ? null : json["userId"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_aggregationRuleId != null)
          "aggregationRuleId": jsonValue(_aggregationRuleId),
        if (_filters != null) "filters": jsonValue(_filters),
        if (_country != null) "country": jsonValue(_country),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_top_n != null) "top_n": jsonValue(_top_n),
        if (_fresh != null) "fresh": jsonValue(_fresh),
        if (_userId != null) "userId": jsonValue(_userId),
      };
}

/// Web Push subscription info as returned by the browser Push API.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class PushSubscriptionJSON implements JsonModel {
  final JsonMap? _originalJson;
  final String? _endpoint;
  String get endpoint => _endpoint as String;
  final PushSubscriptionJSONKeys? _keys;
  PushSubscriptionJSONKeys get keys => _keys as PushSubscriptionJSONKeys;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const PushSubscriptionJSON(
      {required String endpoint, required PushSubscriptionJSONKeys keys})
      : _endpoint = endpoint,
        _keys = keys,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  PushSubscriptionJSON.fromJson(JsonMap json)
      : _endpoint =
            json["endpoint"] == null ? null : json["endpoint"] as String,
        _keys = json["keys"] == null
            ? null
            : PushSubscriptionJSONKeys.fromJson(asJsonMap(json["keys"])),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "endpoint": jsonValue(_endpoint),
        "keys": jsonValue(_keys),
      };
}

/// Notification event types pushed by the server.
///
/// Uses `String`; TypeScript-only constraints are not validated.
typedef NotificationEventType = String;

/// A notification event received from the SSE stream.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class NotificationEvent implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;

  /// Unique event ID
  String get id => _id as String;
  final NotificationEventType? _event;

  /// Event type
  NotificationEventType get event => _event as NotificationEventType;
  final Map<String, Object?>? _data;

  /// Event-specific payload
  Map<String, Object?> get data => _data as Map<String, Object?>;
  final String? _tenant_id;

  /// Tenant ID
  String get tenant_id => _tenant_id as String;
  final String? _user_id;

  /// User ID
  String get user_id => _user_id as String;
  final String? _timestamp;

  /// ISO timestamp
  String get timestamp => _timestamp as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const NotificationEvent(
      {required String id,
      required NotificationEventType event,
      required Map<String, Object?> data,
      required String tenant_id,
      required String user_id,
      required String timestamp})
      : _id = id,
        _event = event,
        _data = data,
        _tenant_id = tenant_id,
        _user_id = user_id,
        _timestamp = timestamp,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  NotificationEvent.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _event = json["event"] == null
            ? null
            : json["event"] as NotificationEventType,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _timestamp =
            json["timestamp"] == null ? null : json["timestamp"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "event": jsonValue(_event),
        "data": jsonValue(_data),
        "tenant_id": jsonValue(_tenant_id),
        "user_id": jsonValue(_user_id),
        "timestamp": jsonValue(_timestamp),
      };
}

/// JSON model for JavaScript SDK `credentials.CredentialType`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CredentialType implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _name;
  String get name => _name as String;
  final String? _slug;
  String get slug => _slug as String;
  final String? _description;
  String? get description => _description;
  final String? _category;
  String? get category => _category;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _badge_color;
  String? get badge_color => _badge_color;
  final num? _display_order;
  num get display_order => _display_order as num;
  final Map<String, Object?>? _schema_definition;
  Map<String, Object?> get schema_definition =>
      _schema_definition as Map<String, Object?>;
  final bool? _is_revocable;
  bool get is_revocable => _is_revocable as bool;
  final num? _default_expiry_days;
  num? get default_expiry_days => _default_expiry_days;
  final num? _max_active_per_user;
  num get max_active_per_user => _max_active_per_user as num;
  final bool? _auto_renew;
  bool get auto_renew => _auto_renew as bool;
  final String? _default_visibility;
  String get default_visibility => _default_visibility as String;
  final bool? _requires_opt_in;
  bool get requires_opt_in => _requires_opt_in as bool;
  final String? _status;
  String get status => _status as String;
  final num? _total_issued;
  num get total_issued => _total_issued as num;
  final num? _total_active;
  num get total_active => _total_active as num;
  final String? _created_at;
  String get created_at => _created_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CredentialType(
      {required String id,
      required String name,
      required String slug,
      String? description,
      String? category,
      String? icon_url,
      String? badge_color,
      required num display_order,
      required Map<String, Object?> schema_definition,
      required bool is_revocable,
      num? default_expiry_days,
      required num max_active_per_user,
      required bool auto_renew,
      required String default_visibility,
      required bool requires_opt_in,
      required String status,
      required num total_issued,
      required num total_active,
      required String created_at})
      : _id = id,
        _name = name,
        _slug = slug,
        _description = description,
        _category = category,
        _icon_url = icon_url,
        _badge_color = badge_color,
        _display_order = display_order,
        _schema_definition = schema_definition,
        _is_revocable = is_revocable,
        _default_expiry_days = default_expiry_days,
        _max_active_per_user = max_active_per_user,
        _auto_renew = auto_renew,
        _default_visibility = default_visibility,
        _requires_opt_in = requires_opt_in,
        _status = status,
        _total_issued = total_issued,
        _total_active = total_active,
        _created_at = created_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CredentialType.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _badge_color =
            json["badge_color"] == null ? null : json["badge_color"] as String,
        _display_order =
            json["display_order"] == null ? null : json["display_order"] as num,
        _schema_definition = json["schema_definition"] == null
            ? null
            : asJsonMap(json["schema_definition"]),
        _is_revocable =
            json["is_revocable"] == null ? null : json["is_revocable"] as bool,
        _default_expiry_days = json["default_expiry_days"] == null
            ? null
            : json["default_expiry_days"] as num,
        _max_active_per_user = json["max_active_per_user"] == null
            ? null
            : json["max_active_per_user"] as num,
        _auto_renew =
            json["auto_renew"] == null ? null : json["auto_renew"] as bool,
        _default_visibility = json["default_visibility"] == null
            ? null
            : json["default_visibility"] as String,
        _requires_opt_in = json["requires_opt_in"] == null
            ? null
            : json["requires_opt_in"] as bool,
        _status = json["status"] == null ? null : json["status"] as String,
        _total_issued =
            json["total_issued"] == null ? null : json["total_issued"] as num,
        _total_active =
            json["total_active"] == null ? null : json["total_active"] as num,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "name": jsonValue(_name),
        "slug": jsonValue(_slug),
        if (_description != null) "description": jsonValue(_description),
        if (_category != null) "category": jsonValue(_category),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_badge_color != null) "badge_color": jsonValue(_badge_color),
        "display_order": jsonValue(_display_order),
        "schema_definition": jsonValue(_schema_definition),
        "is_revocable": jsonValue(_is_revocable),
        if (_default_expiry_days != null)
          "default_expiry_days": jsonValue(_default_expiry_days),
        "max_active_per_user": jsonValue(_max_active_per_user),
        "auto_renew": jsonValue(_auto_renew),
        "default_visibility": jsonValue(_default_visibility),
        "requires_opt_in": jsonValue(_requires_opt_in),
        "status": jsonValue(_status),
        "total_issued": jsonValue(_total_issued),
        "total_active": jsonValue(_total_active),
        "created_at": jsonValue(_created_at),
      };
}

/// JSON model for JavaScript SDK `credentials.IssuedCredential`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class IssuedCredential implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _credential_type_id;
  String get credential_type_id => _credential_type_id as String;
  final String? _credential_type_name;
  String get credential_type_name => _credential_type_name as String;
  final String? _credential_type_slug;
  String get credential_type_slug => _credential_type_slug as String;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _user_external_id;
  String? get user_external_id => _user_external_id;
  final String? _verification_code;
  String get verification_code => _verification_code as String;
  final Map<String, Object?>? _credential_data;
  Map<String, Object?> get credential_data =>
      _credential_data as Map<String, Object?>;
  final String? _issued_by;
  String? get issued_by => _issued_by;
  final String? _issue_reason;
  String? get issue_reason => _issue_reason;
  final String? _visibility;
  String get visibility => _visibility as String;
  final String? _status;
  String get status => _status as String;
  final bool? _is_valid;
  bool get is_valid => _is_valid as bool;
  final String? _expires_at;
  String? get expires_at => _expires_at;
  final String? _issued_at;
  String get issued_at => _issued_at as String;
  final num? _verification_count;
  num get verification_count => _verification_count as num;
  final String? _last_verified_at;
  String? get last_verified_at => _last_verified_at;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const IssuedCredential(
      {required String id,
      required String credential_type_id,
      required String credential_type_name,
      required String credential_type_slug,
      required String user_id,
      String? user_external_id,
      required String verification_code,
      required Map<String, Object?> credential_data,
      String? issued_by,
      String? issue_reason,
      required String visibility,
      required String status,
      required bool is_valid,
      String? expires_at,
      required String issued_at,
      required num verification_count,
      String? last_verified_at})
      : _id = id,
        _credential_type_id = credential_type_id,
        _credential_type_name = credential_type_name,
        _credential_type_slug = credential_type_slug,
        _user_id = user_id,
        _user_external_id = user_external_id,
        _verification_code = verification_code,
        _credential_data = credential_data,
        _issued_by = issued_by,
        _issue_reason = issue_reason,
        _visibility = visibility,
        _status = status,
        _is_valid = is_valid,
        _expires_at = expires_at,
        _issued_at = issued_at,
        _verification_count = verification_count,
        _last_verified_at = last_verified_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  IssuedCredential.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _credential_type_id = json["credential_type_id"] == null
            ? null
            : json["credential_type_id"] as String,
        _credential_type_name = json["credential_type_name"] == null
            ? null
            : json["credential_type_name"] as String,
        _credential_type_slug = json["credential_type_slug"] == null
            ? null
            : json["credential_type_slug"] as String,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _user_external_id = json["user_external_id"] == null
            ? null
            : json["user_external_id"] as String,
        _verification_code = json["verification_code"] == null
            ? null
            : json["verification_code"] as String,
        _credential_data = json["credential_data"] == null
            ? null
            : asJsonMap(json["credential_data"]),
        _issued_by =
            json["issued_by"] == null ? null : json["issued_by"] as String,
        _issue_reason = json["issue_reason"] == null
            ? null
            : json["issue_reason"] as String,
        _visibility =
            json["visibility"] == null ? null : json["visibility"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _is_valid = json["is_valid"] == null ? null : json["is_valid"] as bool,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _issued_at =
            json["issued_at"] == null ? null : json["issued_at"] as String,
        _verification_count = json["verification_count"] == null
            ? null
            : json["verification_count"] as num,
        _last_verified_at = json["last_verified_at"] == null
            ? null
            : json["last_verified_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "credential_type_id": jsonValue(_credential_type_id),
        "credential_type_name": jsonValue(_credential_type_name),
        "credential_type_slug": jsonValue(_credential_type_slug),
        "user_id": jsonValue(_user_id),
        if (_user_external_id != null)
          "user_external_id": jsonValue(_user_external_id),
        "verification_code": jsonValue(_verification_code),
        "credential_data": jsonValue(_credential_data),
        if (_issued_by != null) "issued_by": jsonValue(_issued_by),
        if (_issue_reason != null) "issue_reason": jsonValue(_issue_reason),
        "visibility": jsonValue(_visibility),
        "status": jsonValue(_status),
        "is_valid": jsonValue(_is_valid),
        if (_expires_at != null) "expires_at": jsonValue(_expires_at),
        "issued_at": jsonValue(_issued_at),
        "verification_count": jsonValue(_verification_count),
        if (_last_verified_at != null)
          "last_verified_at": jsonValue(_last_verified_at),
      };
}

/// JSON model for JavaScript SDK `credentials.CredentialVerifyResult`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CredentialVerifyResult implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _valid;
  bool get valid => _valid as bool;
  final String? _status;
  String get status => _status as String;
  final String? _credential_type;
  String get credential_type => _credential_type as String;
  final String? _credential_type_slug;
  String get credential_type_slug => _credential_type_slug as String;
  final String? _category;
  String? get category => _category;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _badge_color;
  String? get badge_color => _badge_color;
  final Map<String, Object?>? _credential_data;
  Map<String, Object?> get credential_data =>
      _credential_data as Map<String, Object?>;
  final String? _issued_at;
  String get issued_at => _issued_at as String;
  final String? _expires_at;
  String? get expires_at => _expires_at;
  final String? _issuer;
  String get issuer => _issuer as String;
  final num? _verification_count;
  num get verification_count => _verification_count as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CredentialVerifyResult(
      {required bool valid,
      required String status,
      required String credential_type,
      required String credential_type_slug,
      String? category,
      String? icon_url,
      String? badge_color,
      required Map<String, Object?> credential_data,
      required String issued_at,
      String? expires_at,
      required String issuer,
      required num verification_count})
      : _valid = valid,
        _status = status,
        _credential_type = credential_type,
        _credential_type_slug = credential_type_slug,
        _category = category,
        _icon_url = icon_url,
        _badge_color = badge_color,
        _credential_data = credential_data,
        _issued_at = issued_at,
        _expires_at = expires_at,
        _issuer = issuer,
        _verification_count = verification_count,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CredentialVerifyResult.fromJson(JsonMap json)
      : _valid = json["valid"] == null ? null : json["valid"] as bool,
        _status = json["status"] == null ? null : json["status"] as String,
        _credential_type = json["credential_type"] == null
            ? null
            : json["credential_type"] as String,
        _credential_type_slug = json["credential_type_slug"] == null
            ? null
            : json["credential_type_slug"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _badge_color =
            json["badge_color"] == null ? null : json["badge_color"] as String,
        _credential_data = json["credential_data"] == null
            ? null
            : asJsonMap(json["credential_data"]),
        _issued_at =
            json["issued_at"] == null ? null : json["issued_at"] as String,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _issuer = json["issuer"] == null ? null : json["issuer"] as String,
        _verification_count = json["verification_count"] == null
            ? null
            : json["verification_count"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "valid": jsonValue(_valid),
        "status": jsonValue(_status),
        "credential_type": jsonValue(_credential_type),
        "credential_type_slug": jsonValue(_credential_type_slug),
        if (_category != null) "category": jsonValue(_category),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_badge_color != null) "badge_color": jsonValue(_badge_color),
        "credential_data": jsonValue(_credential_data),
        "issued_at": jsonValue(_issued_at),
        if (_expires_at != null) "expires_at": jsonValue(_expires_at),
        "issuer": jsonValue(_issuer),
        "verification_count": jsonValue(_verification_count),
      };
}

/// JSON model for JavaScript SDK `credentials.UserCredentialsSummary`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserCredentialsSummary implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _credentials_enabled;
  bool get credentials_enabled => _credentials_enabled as bool;
  final num? _total_credentials;
  num get total_credentials => _total_credentials as num;
  final num? _active_credentials;
  num get active_credentials => _active_credentials as num;
  final List<IssuedCredential>? _credentials;
  List<IssuedCredential> get credentials =>
      _credentials as List<IssuedCredential>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserCredentialsSummary(
      {required bool credentials_enabled,
      required num total_credentials,
      required num active_credentials,
      required List<IssuedCredential> credentials})
      : _credentials_enabled = credentials_enabled,
        _total_credentials = total_credentials,
        _active_credentials = active_credentials,
        _credentials = credentials,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserCredentialsSummary.fromJson(JsonMap json)
      : _credentials_enabled = json["credentials_enabled"] == null
            ? null
            : json["credentials_enabled"] as bool,
        _total_credentials = json["total_credentials"] == null
            ? null
            : json["total_credentials"] as num,
        _active_credentials = json["active_credentials"] == null
            ? null
            : json["active_credentials"] as num,
        _credentials = json["credentials"] == null
            ? null
            : (json["credentials"] as List<Object?>)
                .map((item) => IssuedCredential.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "credentials_enabled": jsonValue(_credentials_enabled),
        "total_credentials": jsonValue(_total_credentials),
        "active_credentials": jsonValue(_active_credentials),
        "credentials": jsonValue(_credentials),
      };
}

/// JSON model for JavaScript SDK `credentials.CreateCredentialTypeRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class CreateCredentialTypeRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _name;
  String get name => _name as String;
  final String? _slug;
  String? get slug => _slug;
  final String? _description;
  String? get description => _description;
  final String? _category;
  String? get category => _category;
  final String? _icon_url;
  String? get icon_url => _icon_url;
  final String? _badge_color;
  String? get badge_color => _badge_color;
  final num? _display_order;
  num? get display_order => _display_order;
  final Map<String, Object?>? _schema_definition;
  Map<String, Object?>? get schema_definition => _schema_definition;
  final bool? _is_revocable;
  bool? get is_revocable => _is_revocable;
  final num? _default_expiry_days;
  num? get default_expiry_days => _default_expiry_days;
  final num? _max_active_per_user;
  num? get max_active_per_user => _max_active_per_user;
  final bool? _auto_renew;
  bool? get auto_renew => _auto_renew;
  final String? _default_visibility;
  String? get default_visibility => _default_visibility;
  final bool? _requires_opt_in;
  bool? get requires_opt_in => _requires_opt_in;
  final String? _auto_issue_on_quest;
  String? get auto_issue_on_quest => _auto_issue_on_quest;
  final String? _auto_issue_on_segment;
  String? get auto_issue_on_segment => _auto_issue_on_segment;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const CreateCredentialTypeRequest(
      {required String name,
      String? slug,
      String? description,
      String? category,
      String? icon_url,
      String? badge_color,
      num? display_order,
      Map<String, Object?>? schema_definition,
      bool? is_revocable,
      num? default_expiry_days,
      num? max_active_per_user,
      bool? auto_renew,
      String? default_visibility,
      bool? requires_opt_in,
      String? auto_issue_on_quest,
      String? auto_issue_on_segment})
      : _name = name,
        _slug = slug,
        _description = description,
        _category = category,
        _icon_url = icon_url,
        _badge_color = badge_color,
        _display_order = display_order,
        _schema_definition = schema_definition,
        _is_revocable = is_revocable,
        _default_expiry_days = default_expiry_days,
        _max_active_per_user = max_active_per_user,
        _auto_renew = auto_renew,
        _default_visibility = default_visibility,
        _requires_opt_in = requires_opt_in,
        _auto_issue_on_quest = auto_issue_on_quest,
        _auto_issue_on_segment = auto_issue_on_segment,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  CreateCredentialTypeRequest.fromJson(JsonMap json)
      : _name = json["name"] == null ? null : json["name"] as String,
        _slug = json["slug"] == null ? null : json["slug"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _category =
            json["category"] == null ? null : json["category"] as String,
        _icon_url =
            json["icon_url"] == null ? null : json["icon_url"] as String,
        _badge_color =
            json["badge_color"] == null ? null : json["badge_color"] as String,
        _display_order =
            json["display_order"] == null ? null : json["display_order"] as num,
        _schema_definition = json["schema_definition"] == null
            ? null
            : asJsonMap(json["schema_definition"]),
        _is_revocable =
            json["is_revocable"] == null ? null : json["is_revocable"] as bool,
        _default_expiry_days = json["default_expiry_days"] == null
            ? null
            : json["default_expiry_days"] as num,
        _max_active_per_user = json["max_active_per_user"] == null
            ? null
            : json["max_active_per_user"] as num,
        _auto_renew =
            json["auto_renew"] == null ? null : json["auto_renew"] as bool,
        _default_visibility = json["default_visibility"] == null
            ? null
            : json["default_visibility"] as String,
        _requires_opt_in = json["requires_opt_in"] == null
            ? null
            : json["requires_opt_in"] as bool,
        _auto_issue_on_quest = json["auto_issue_on_quest"] == null
            ? null
            : json["auto_issue_on_quest"] as String,
        _auto_issue_on_segment = json["auto_issue_on_segment"] == null
            ? null
            : json["auto_issue_on_segment"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "name": jsonValue(_name),
        if (_slug != null) "slug": jsonValue(_slug),
        if (_description != null) "description": jsonValue(_description),
        if (_category != null) "category": jsonValue(_category),
        if (_icon_url != null) "icon_url": jsonValue(_icon_url),
        if (_badge_color != null) "badge_color": jsonValue(_badge_color),
        if (_display_order != null) "display_order": jsonValue(_display_order),
        if (_schema_definition != null)
          "schema_definition": jsonValue(_schema_definition),
        if (_is_revocable != null) "is_revocable": jsonValue(_is_revocable),
        if (_default_expiry_days != null)
          "default_expiry_days": jsonValue(_default_expiry_days),
        if (_max_active_per_user != null)
          "max_active_per_user": jsonValue(_max_active_per_user),
        if (_auto_renew != null) "auto_renew": jsonValue(_auto_renew),
        if (_default_visibility != null)
          "default_visibility": jsonValue(_default_visibility),
        if (_requires_opt_in != null)
          "requires_opt_in": jsonValue(_requires_opt_in),
        if (_auto_issue_on_quest != null)
          "auto_issue_on_quest": jsonValue(_auto_issue_on_quest),
        if (_auto_issue_on_segment != null)
          "auto_issue_on_segment": jsonValue(_auto_issue_on_segment),
      };
}

/// JSON model for JavaScript SDK `credentials.IssueCredentialRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class IssueCredentialRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _credential_type_id;
  String get credential_type_id => _credential_type_id as String;
  final String? _user_id;
  String get user_id => _user_id as String;
  final Map<String, Object?>? _credential_data;
  Map<String, Object?>? get credential_data => _credential_data;
  final String? _issue_reason;
  String? get issue_reason => _issue_reason;
  final String? _visibility;
  String? get visibility => _visibility;
  final String? _expires_at;
  String? get expires_at => _expires_at;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const IssueCredentialRequest(
      {required String credential_type_id,
      required String user_id,
      Map<String, Object?>? credential_data,
      String? issue_reason,
      String? visibility,
      String? expires_at})
      : _credential_type_id = credential_type_id,
        _user_id = user_id,
        _credential_data = credential_data,
        _issue_reason = issue_reason,
        _visibility = visibility,
        _expires_at = expires_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  IssueCredentialRequest.fromJson(JsonMap json)
      : _credential_type_id = json["credential_type_id"] == null
            ? null
            : json["credential_type_id"] as String,
        _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _credential_data = json["credential_data"] == null
            ? null
            : asJsonMap(json["credential_data"]),
        _issue_reason = json["issue_reason"] == null
            ? null
            : json["issue_reason"] as String,
        _visibility =
            json["visibility"] == null ? null : json["visibility"] as String,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "credential_type_id": jsonValue(_credential_type_id),
        "user_id": jsonValue(_user_id),
        if (_credential_data != null)
          "credential_data": jsonValue(_credential_data),
        if (_issue_reason != null) "issue_reason": jsonValue(_issue_reason),
        if (_visibility != null) "visibility": jsonValue(_visibility),
        if (_expires_at != null) "expires_at": jsonValue(_expires_at),
      };
}

/// JSON model for JavaScript SDK `credentials.ListIssuedCredentialsOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListIssuedCredentialsOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String? get user_id => _user_id;
  final String? _credential_type_id;
  String? get credential_type_id => _credential_type_id;
  final String? _status;
  String? get status => _status;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListIssuedCredentialsOptions(
      {String? user_id,
      String? credential_type_id,
      String? status,
      num? limit,
      num? offset})
      : _user_id = user_id,
        _credential_type_id = credential_type_id,
        _status = status,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListIssuedCredentialsOptions.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _credential_type_id = json["credential_type_id"] == null
            ? null
            : json["credential_type_id"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_user_id != null) "user_id": jsonValue(_user_id),
        if (_credential_type_id != null)
          "credential_type_id": jsonValue(_credential_type_id),
        if (_status != null) "status": jsonValue(_status),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `nft.MintNFTRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class MintNFTRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _recipientAddress;

  /// Wallet address to receive the NFT
  String get recipientAddress => _recipientAddress as String;
  final String? _name;

  /// NFT name
  String get name => _name as String;
  final UploadFile? _image;

  /// Image file (Blob, File, or ArrayBuffer) — provide this OR imageUrl
  UploadFile? get image => _image;
  final String? _imageFilename;

  /// Filename for the image (used when image is a Blob/ArrayBuffer)
  String? get imageFilename => _imageFilename;
  final String? _imageUrl;

  /// External image URL — provide this OR image
  String? get imageUrl => _imageUrl;
  final String? _recipientUserId;

  /// Optional end-user external_id
  String? get recipientUserId => _recipientUserId;
  final String? _description;

  /// NFT description
  String? get description => _description;
  final bool? _soulbound;

  /// Whether the NFT is soulbound (non-transferable)
  bool? get soulbound => _soulbound;
  final num? _validityDays;

  /// Validity period in days
  num? get validityDays => _validityDays;
  final String? _network;

  /// Blockchain network (default: "base")
  String? get network => _network;
  final String? _contractAddress;

  /// Contract address override
  String? get contractAddress => _contractAddress;
  final Map<String, Object?>? _metadata;

  /// Extra metadata attributes to merge
  Map<String, Object?>? get metadata => _metadata;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const MintNFTRequest(
      {required String recipientAddress,
      required String name,
      UploadFile? image,
      String? imageFilename,
      String? imageUrl,
      String? recipientUserId,
      String? description,
      bool? soulbound,
      num? validityDays,
      String? network,
      String? contractAddress,
      Map<String, Object?>? metadata})
      : _recipientAddress = recipientAddress,
        _name = name,
        _image = image,
        _imageFilename = imageFilename,
        _imageUrl = imageUrl,
        _recipientUserId = recipientUserId,
        _description = description,
        _soulbound = soulbound,
        _validityDays = validityDays,
        _network = network,
        _contractAddress = contractAddress,
        _metadata = metadata,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  MintNFTRequest.fromJson(JsonMap json)
      : _recipientAddress = json["recipientAddress"] == null
            ? null
            : json["recipientAddress"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _image = json["image"] == null
            ? null
            : json["image"] is UploadFile
                ? json["image"] as UploadFile
                : UploadFile((json["image"] as List<Object?>).cast<int>()),
        _imageFilename = json["imageFilename"] == null
            ? null
            : json["imageFilename"] as String,
        _imageUrl =
            json["imageUrl"] == null ? null : json["imageUrl"] as String,
        _recipientUserId = json["recipientUserId"] == null
            ? null
            : json["recipientUserId"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _soulbound =
            json["soulbound"] == null ? null : json["soulbound"] as bool,
        _validityDays =
            json["validityDays"] == null ? null : json["validityDays"] as num,
        _network = json["network"] == null ? null : json["network"] as String,
        _contractAddress = json["contractAddress"] == null
            ? null
            : json["contractAddress"] as String,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "recipientAddress": jsonValue(_recipientAddress),
        "name": jsonValue(_name),
        if (_image != null) "image": jsonValue(_image),
        if (_imageFilename != null) "imageFilename": jsonValue(_imageFilename),
        if (_imageUrl != null) "imageUrl": jsonValue(_imageUrl),
        if (_recipientUserId != null)
          "recipientUserId": jsonValue(_recipientUserId),
        if (_description != null) "description": jsonValue(_description),
        if (_soulbound != null) "soulbound": jsonValue(_soulbound),
        if (_validityDays != null) "validityDays": jsonValue(_validityDays),
        if (_network != null) "network": jsonValue(_network),
        if (_contractAddress != null)
          "contractAddress": jsonValue(_contractAddress),
        if (_metadata != null) "metadata": jsonValue(_metadata),
      };
}

/// JSON model for JavaScript SDK `nft.NFTMint`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class NFTMint implements JsonModel {
  final JsonMap? _originalJson;
  final String? _id;
  String get id => _id as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final String? _recipient_address;
  String get recipient_address => _recipient_address as String;
  final String? _recipient_user_id;
  String? get recipient_user_id => _recipient_user_id;
  final num? _token_id;
  num? get token_id => _token_id;
  final String? _tx_hash;
  String? get tx_hash => _tx_hash;
  final String? _contract_address;
  String get contract_address => _contract_address as String;
  final String? _network;
  String get network => _network as String;
  final String? _content_hash;
  String? get content_hash => _content_hash;
  final num? _cert_type;
  num get cert_type => _cert_type as num;
  final num? _validity_days;
  num? get validity_days => _validity_days;
  final Map<String, Object?>? _metadata;
  Map<String, Object?>? get metadata => _metadata;
  final String? _metadata_uri;
  String? get metadata_uri => _metadata_uri;
  final String? _image_url;
  String get image_url => _image_url as String;
  final String? _image_storage_path;
  String? get image_storage_path => _image_storage_path;
  final String? _name;
  String get name => _name as String;
  final String? _description;
  String? get description => _description;
  final String? _status;
  String get status => _status as String;
  final String? _error_message;
  String? get error_message => _error_message;
  final String? _gas_used;
  String? get gas_used => _gas_used;
  final String? _created_at;
  String? get created_at => _created_at;
  final String? _updated_at;
  String? get updated_at => _updated_at;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const NFTMint(
      {required String id,
      required String tenant_id,
      required String recipient_address,
      required String? recipient_user_id,
      required num? token_id,
      required String? tx_hash,
      required String contract_address,
      required String network,
      required String? content_hash,
      required num cert_type,
      required num? validity_days,
      required Map<String, Object?>? metadata,
      required String? metadata_uri,
      required String image_url,
      required String? image_storage_path,
      required String name,
      required String? description,
      required String status,
      required String? error_message,
      required String? gas_used,
      required String? created_at,
      required String? updated_at})
      : _id = id,
        _tenant_id = tenant_id,
        _recipient_address = recipient_address,
        _recipient_user_id = recipient_user_id,
        _token_id = token_id,
        _tx_hash = tx_hash,
        _contract_address = contract_address,
        _network = network,
        _content_hash = content_hash,
        _cert_type = cert_type,
        _validity_days = validity_days,
        _metadata = metadata,
        _metadata_uri = metadata_uri,
        _image_url = image_url,
        _image_storage_path = image_storage_path,
        _name = name,
        _description = description,
        _status = status,
        _error_message = error_message,
        _gas_used = gas_used,
        _created_at = created_at,
        _updated_at = updated_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  NFTMint.fromJson(JsonMap json)
      : _id = json["id"] == null ? null : json["id"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _recipient_address = json["recipient_address"] == null
            ? null
            : json["recipient_address"] as String,
        _recipient_user_id = json["recipient_user_id"] == null
            ? null
            : json["recipient_user_id"] as String,
        _token_id = json["token_id"] == null ? null : json["token_id"] as num,
        _tx_hash = json["tx_hash"] == null ? null : json["tx_hash"] as String,
        _contract_address = json["contract_address"] == null
            ? null
            : json["contract_address"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _content_hash = json["content_hash"] == null
            ? null
            : json["content_hash"] as String,
        _cert_type =
            json["cert_type"] == null ? null : json["cert_type"] as num,
        _validity_days =
            json["validity_days"] == null ? null : json["validity_days"] as num,
        _metadata =
            json["metadata"] == null ? null : asJsonMap(json["metadata"]),
        _metadata_uri = json["metadata_uri"] == null
            ? null
            : json["metadata_uri"] as String,
        _image_url =
            json["image_url"] == null ? null : json["image_url"] as String,
        _image_storage_path = json["image_storage_path"] == null
            ? null
            : json["image_storage_path"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _description =
            json["description"] == null ? null : json["description"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _error_message = json["error_message"] == null
            ? null
            : json["error_message"] as String,
        _gas_used =
            json["gas_used"] == null ? null : json["gas_used"] as String,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _updated_at =
            json["updated_at"] == null ? null : json["updated_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "id": jsonValue(_id),
        "tenant_id": jsonValue(_tenant_id),
        "recipient_address": jsonValue(_recipient_address),
        "recipient_user_id": jsonValue(_recipient_user_id),
        "token_id": jsonValue(_token_id),
        "tx_hash": jsonValue(_tx_hash),
        "contract_address": jsonValue(_contract_address),
        "network": jsonValue(_network),
        "content_hash": jsonValue(_content_hash),
        "cert_type": jsonValue(_cert_type),
        "validity_days": jsonValue(_validity_days),
        "metadata": jsonValue(_metadata),
        "metadata_uri": jsonValue(_metadata_uri),
        "image_url": jsonValue(_image_url),
        "image_storage_path": jsonValue(_image_storage_path),
        "name": jsonValue(_name),
        "description": jsonValue(_description),
        "status": jsonValue(_status),
        "error_message": jsonValue(_error_message),
        "gas_used": jsonValue(_gas_used),
        "created_at": jsonValue(_created_at),
        "updated_at": jsonValue(_updated_at),
      };
}

/// JSON model for JavaScript SDK `nft.ListMintsOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListMintsOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _recipientAddress;
  String? get recipientAddress => _recipientAddress;
  final String? _network;
  String? get network => _network;
  final String? _status;
  String? get status => _status;
  final num? _limit;
  num? get limit => _limit;
  final num? _offset;
  num? get offset => _offset;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListMintsOptions(
      {String? recipientAddress,
      String? network,
      String? status,
      num? limit,
      num? offset})
      : _recipientAddress = recipientAddress,
        _network = network,
        _status = status,
        _limit = limit,
        _offset = offset,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListMintsOptions.fromJson(JsonMap json)
      : _recipientAddress = json["recipientAddress"] == null
            ? null
            : json["recipientAddress"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _limit = json["limit"] == null ? null : json["limit"] as num,
        _offset = json["offset"] == null ? null : json["offset"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_recipientAddress != null)
          "recipientAddress": jsonValue(_recipientAddress),
        if (_network != null) "network": jsonValue(_network),
        if (_status != null) "status": jsonValue(_status),
        if (_limit != null) "limit": jsonValue(_limit),
        if (_offset != null) "offset": jsonValue(_offset),
      };
}

/// JSON model for JavaScript SDK `nft.ListMintsResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ListMintsResponse implements JsonModel {
  final JsonMap? _originalJson;
  final List<NFTMint>? _mints;
  List<NFTMint> get mints => _mints as List<NFTMint>;
  final num? _total;
  num get total => _total as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ListMintsResponse({required List<NFTMint> mints, required num total})
      : _mints = mints,
        _total = total,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ListMintsResponse.fromJson(JsonMap json)
      : _mints = json["mints"] == null
            ? null
            : (json["mints"] as List<Object?>)
                .map((item) => NFTMint.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total = json["total"] == null ? null : json["total"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "mints": jsonValue(_mints),
        "total": jsonValue(_total),
      };
}

/// JSON model for JavaScript SDK `partner-keys.OTTGenerateRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class OTTGenerateRequest implements JsonModel {
  final JsonMap? _originalJson;
  final num? _ttl;
  num? get ttl => _ttl;
  final List<String>? _session_data_keys;
  List<String>? get session_data_keys => _session_data_keys;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const OTTGenerateRequest({num? ttl, List<String>? session_data_keys})
      : _ttl = ttl,
        _session_data_keys = session_data_keys,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  OTTGenerateRequest.fromJson(JsonMap json)
      : _ttl = json["ttl"] == null ? null : json["ttl"] as num,
        _session_data_keys = json["session_data_keys"] == null
            ? null
            : (json["session_data_keys"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_ttl != null) "ttl": jsonValue(_ttl),
        if (_session_data_keys != null)
          "session_data_keys": jsonValue(_session_data_keys),
      };
}

/// JSON model for JavaScript SDK `partner-keys.OTTGenerateResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class OTTGenerateResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _ott;
  String get ott => _ott as String;
  final num? _expires_in;
  num get expires_in => _expires_in as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const OTTGenerateResponse({required String ott, required num expires_in})
      : _ott = ott,
        _expires_in = expires_in,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  OTTGenerateResponse.fromJson(JsonMap json)
      : _ott = json["ott"] == null ? null : json["ott"] as String,
        _expires_in =
            json["expires_in"] == null ? null : json["expires_in"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "ott": jsonValue(_ott),
        "expires_in": jsonValue(_expires_in),
      };
}

/// JSON model for JavaScript SDK `partner-keys.OTTRedeemResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class OTTRedeemResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _user_id;
  String get user_id => _user_id as String;
  final String? _tenant_id;
  String get tenant_id => _tenant_id as String;
  final String? _tenant_name;
  String? get tenant_name => _tenant_name;
  final Map<String, Object?>? _session_data;
  Map<String, Object?> get session_data =>
      _session_data as Map<String, Object?>;
  final String? _issued_at;
  String get issued_at => _issued_at as String;
  final String? _expires_at;
  String get expires_at => _expires_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const OTTRedeemResponse(
      {required String user_id,
      required String tenant_id,
      required String? tenant_name,
      required Map<String, Object?> session_data,
      required String issued_at,
      required String expires_at})
      : _user_id = user_id,
        _tenant_id = tenant_id,
        _tenant_name = tenant_name,
        _session_data = session_data,
        _issued_at = issued_at,
        _expires_at = expires_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  OTTRedeemResponse.fromJson(JsonMap json)
      : _user_id = json["user_id"] == null ? null : json["user_id"] as String,
        _tenant_id =
            json["tenant_id"] == null ? null : json["tenant_id"] as String,
        _tenant_name =
            json["tenant_name"] == null ? null : json["tenant_name"] as String,
        _session_data = json["session_data"] == null
            ? null
            : asJsonMap(json["session_data"]),
        _issued_at =
            json["issued_at"] == null ? null : json["issued_at"] as String,
        _expires_at =
            json["expires_at"] == null ? null : json["expires_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "user_id": jsonValue(_user_id),
        "tenant_id": jsonValue(_tenant_id),
        "tenant_name": jsonValue(_tenant_name),
        "session_data": jsonValue(_session_data),
        "issued_at": jsonValue(_issued_at),
        "expires_at": jsonValue(_expires_at),
      };
}

/// JSON model for JavaScript SDK `partner-keys.OTTConfigUpdate`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class OTTConfigUpdate implements JsonModel {
  final JsonMap? _originalJson;
  final bool? _ott_enabled;
  bool? get ott_enabled => _ott_enabled;
  final num? _ott_ttl_seconds;
  num? get ott_ttl_seconds => _ott_ttl_seconds;
  final String? _ott_redemption_mode;
  String? get ott_redemption_mode => _ott_redemption_mode;
  final num? _ott_jwt_ttl_seconds;
  num? get ott_jwt_ttl_seconds => _ott_jwt_ttl_seconds;
  final List<String>? _ott_session_data_keys;
  List<String>? get ott_session_data_keys => _ott_session_data_keys;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const OTTConfigUpdate(
      {bool? ott_enabled,
      num? ott_ttl_seconds,
      String? ott_redemption_mode,
      num? ott_jwt_ttl_seconds,
      List<String>? ott_session_data_keys})
      : _ott_enabled = ott_enabled,
        _ott_ttl_seconds = ott_ttl_seconds,
        _ott_redemption_mode = ott_redemption_mode,
        _ott_jwt_ttl_seconds = ott_jwt_ttl_seconds,
        _ott_session_data_keys = ott_session_data_keys,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  OTTConfigUpdate.fromJson(JsonMap json)
      : _ott_enabled =
            json["ott_enabled"] == null ? null : json["ott_enabled"] as bool,
        _ott_ttl_seconds = json["ott_ttl_seconds"] == null
            ? null
            : json["ott_ttl_seconds"] as num,
        _ott_redemption_mode = json["ott_redemption_mode"] == null
            ? null
            : json["ott_redemption_mode"] as String,
        _ott_jwt_ttl_seconds = json["ott_jwt_ttl_seconds"] == null
            ? null
            : json["ott_jwt_ttl_seconds"] as num,
        _ott_session_data_keys = json["ott_session_data_keys"] == null
            ? null
            : (json["ott_session_data_keys"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        if (_ott_enabled != null) "ott_enabled": jsonValue(_ott_enabled),
        if (_ott_ttl_seconds != null)
          "ott_ttl_seconds": jsonValue(_ott_ttl_seconds),
        if (_ott_redemption_mode != null)
          "ott_redemption_mode": jsonValue(_ott_redemption_mode),
        if (_ott_jwt_ttl_seconds != null)
          "ott_jwt_ttl_seconds": jsonValue(_ott_jwt_ttl_seconds),
        if (_ott_session_data_keys != null)
          "ott_session_data_keys": jsonValue(_ott_session_data_keys),
      };
}

/// JSON model for JavaScript SDK `partner-keys.OTTConfigResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class OTTConfigResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _partner_key_id;
  String get partner_key_id => _partner_key_id as String;
  final String? _partner_name;
  String get partner_name => _partner_name as String;
  final bool? _ott_enabled;
  bool get ott_enabled => _ott_enabled as bool;
  final num? _ott_ttl_seconds;
  num get ott_ttl_seconds => _ott_ttl_seconds as num;
  final String? _ott_redemption_mode;
  String get ott_redemption_mode => _ott_redemption_mode as String;
  final num? _ott_jwt_ttl_seconds;
  num get ott_jwt_ttl_seconds => _ott_jwt_ttl_seconds as num;
  final List<String>? _ott_session_data_keys;
  List<String>? get ott_session_data_keys => _ott_session_data_keys;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const OTTConfigResponse(
      {required String partner_key_id,
      required String partner_name,
      required bool ott_enabled,
      required num ott_ttl_seconds,
      required String ott_redemption_mode,
      required num ott_jwt_ttl_seconds,
      List<String>? ott_session_data_keys})
      : _partner_key_id = partner_key_id,
        _partner_name = partner_name,
        _ott_enabled = ott_enabled,
        _ott_ttl_seconds = ott_ttl_seconds,
        _ott_redemption_mode = ott_redemption_mode,
        _ott_jwt_ttl_seconds = ott_jwt_ttl_seconds,
        _ott_session_data_keys = ott_session_data_keys,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  OTTConfigResponse.fromJson(JsonMap json)
      : _partner_key_id = json["partner_key_id"] == null
            ? null
            : json["partner_key_id"] as String,
        _partner_name = json["partner_name"] == null
            ? null
            : json["partner_name"] as String,
        _ott_enabled =
            json["ott_enabled"] == null ? null : json["ott_enabled"] as bool,
        _ott_ttl_seconds = json["ott_ttl_seconds"] == null
            ? null
            : json["ott_ttl_seconds"] as num,
        _ott_redemption_mode = json["ott_redemption_mode"] == null
            ? null
            : json["ott_redemption_mode"] as String,
        _ott_jwt_ttl_seconds = json["ott_jwt_ttl_seconds"] == null
            ? null
            : json["ott_jwt_ttl_seconds"] as num,
        _ott_session_data_keys = json["ott_session_data_keys"] == null
            ? null
            : (json["ott_session_data_keys"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "partner_key_id": jsonValue(_partner_key_id),
        "partner_name": jsonValue(_partner_name),
        "ott_enabled": jsonValue(_ott_enabled),
        "ott_ttl_seconds": jsonValue(_ott_ttl_seconds),
        "ott_redemption_mode": jsonValue(_ott_redemption_mode),
        "ott_jwt_ttl_seconds": jsonValue(_ott_jwt_ttl_seconds),
        if (_ott_session_data_keys != null)
          "ott_session_data_keys": jsonValue(_ott_session_data_keys),
      };
}

/// Dart representation of JavaScript SDK `partner-keys.OTTRequestResponse`.
///
/// Uses `OTTGenerateResponse`; TypeScript-only constraints are not validated.
typedef OTTRequestResponse = OTTGenerateResponse;

/// JSON model for JavaScript SDK `ingestion.IngestEventRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class IngestEventRequest implements JsonModel {
  final JsonMap? _originalJson;
  final String? _userId;
  String get userId => _userId as String;
  final String? _eventType;
  String get eventType => _eventType as String;
  final Map<String, Object?>? _data;
  Map<String, Object?>? get data => _data;
  final String? _eventSource;

  /// Provenance label, API-key `IngestionClient` only. IGNORED by
  /// `EndUserIngestionClient`, which stamps `end_user_sdk` server-side.
  /// `rudderstack` and `polymarket` are reserved for server-stamped partner
  /// pipelines and are rejected with 403 if claimed by a client.
  String? get eventSource => _eventSource;
  final List<String>? _schemaIds;
  List<String>? get schemaIds => _schemaIds;
  final bool? _hot;

  /// Hot attestation — immediate on-chain TX per event (higher cost, lower latency)
  bool? get hot => _hot;
  final String? _timestamp;

  /// Event occurrence time (ISO 8601). Server defaults to receive time when omitted — set for backfills/replays.
  String? get timestamp => _timestamp;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const IngestEventRequest(
      {required String userId,
      required String eventType,
      Map<String, Object?>? data,
      String? eventSource,
      List<String>? schemaIds,
      bool? hot,
      String? timestamp})
      : _userId = userId,
        _eventType = eventType,
        _data = data,
        _eventSource = eventSource,
        _schemaIds = schemaIds,
        _hot = hot,
        _timestamp = timestamp,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  IngestEventRequest.fromJson(JsonMap json)
      : _userId = json["userId"] == null ? null : json["userId"] as String,
        _eventType =
            json["eventType"] == null ? null : json["eventType"] as String,
        _data = json["data"] == null ? null : asJsonMap(json["data"]),
        _eventSource =
            json["eventSource"] == null ? null : json["eventSource"] as String,
        _schemaIds = json["schemaIds"] == null
            ? null
            : (json["schemaIds"] as List<Object?>)
                .map((item) => item as String)
                .toList(growable: false),
        _hot = json["hot"] == null ? null : json["hot"] as bool,
        _timestamp =
            json["timestamp"] == null ? null : json["timestamp"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "userId": jsonValue(_userId),
        "eventType": jsonValue(_eventType),
        if (_data != null) "data": jsonValue(_data),
        if (_eventSource != null) "eventSource": jsonValue(_eventSource),
        if (_schemaIds != null) "schemaIds": jsonValue(_schemaIds),
        if (_hot != null) "hot": jsonValue(_hot),
        if (_timestamp != null) "timestamp": jsonValue(_timestamp),
      };
}

/// JSON model for JavaScript SDK `ingestion.IngestEventResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class IngestEventResponse implements JsonModel {
  final JsonMap? _originalJson;
  final String? _eventId;
  String get eventId => _eventId as String;
  final String? _certificateId;
  String get certificateId => _certificateId as String;
  final String? _status;
  String get status => _status as String;
  final num? _queuePosition;
  num? get queuePosition => _queuePosition;
  final String? _estimatedConfirmation;
  String? get estimatedConfirmation => _estimatedConfirmation;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const IngestEventResponse(
      {required String eventId,
      required String certificateId,
      required String status,
      num? queuePosition,
      String? estimatedConfirmation})
      : _eventId = eventId,
        _certificateId = certificateId,
        _status = status,
        _queuePosition = queuePosition,
        _estimatedConfirmation = estimatedConfirmation,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  IngestEventResponse.fromJson(JsonMap json)
      : _eventId = json["eventId"] == null ? null : json["eventId"] as String,
        _certificateId = json["certificateId"] == null
            ? null
            : json["certificateId"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _queuePosition =
            json["queuePosition"] == null ? null : json["queuePosition"] as num,
        _estimatedConfirmation = json["estimatedConfirmation"] == null
            ? null
            : json["estimatedConfirmation"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "eventId": jsonValue(_eventId),
        "certificateId": jsonValue(_certificateId),
        "status": jsonValue(_status),
        if (_queuePosition != null) "queuePosition": jsonValue(_queuePosition),
        if (_estimatedConfirmation != null)
          "estimatedConfirmation": jsonValue(_estimatedConfirmation),
      };
}

/// JSON model for JavaScript SDK `ingestion.BatchIngestRequest`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class BatchIngestRequest implements JsonModel {
  final JsonMap? _originalJson;
  final List<IngestEventRequest>? _events;
  List<IngestEventRequest> get events => _events as List<IngestEventRequest>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const BatchIngestRequest({required List<IngestEventRequest> events})
      : _events = events,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  BatchIngestRequest.fromJson(JsonMap json)
      : _events = json["events"] == null
            ? null
            : (json["events"] as List<Object?>)
                .map((item) => IngestEventRequest.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "events": jsonValue(_events),
      };
}

/// JSON model for JavaScript SDK `ingestion.BatchIngestResponse`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class BatchIngestResponse implements JsonModel {
  final JsonMap? _originalJson;
  final num? _totalEvents;
  num get totalEvents => _totalEvents as num;
  final num? _queued;
  num get queued => _queued as num;
  final num? _failed;
  num get failed => _failed as num;
  final List<IngestEventResponse>? _results;
  List<IngestEventResponse> get results =>
      _results as List<IngestEventResponse>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const BatchIngestResponse(
      {required num totalEvents,
      required num queued,
      required num failed,
      required List<IngestEventResponse> results})
      : _totalEvents = totalEvents,
        _queued = queued,
        _failed = failed,
        _results = results,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  BatchIngestResponse.fromJson(JsonMap json)
      : _totalEvents =
            json["totalEvents"] == null ? null : json["totalEvents"] as num,
        _queued = json["queued"] == null ? null : json["queued"] as num,
        _failed = json["failed"] == null ? null : json["failed"] as num,
        _results = json["results"] == null
            ? null
            : (json["results"] as List<Object?>)
                .map((item) => IngestEventResponse.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "totalEvents": jsonValue(_totalEvents),
        "queued": jsonValue(_queued),
        "failed": jsonValue(_failed),
        "results": jsonValue(_results),
      };
}

/// JSON model for JavaScript SDK `ingestion.IngestionClientOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class IngestionClientOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _apiKey;
  String get apiKey => _apiKey as String;
  final String? _ingestUrl;
  String? get ingestUrl => _ingestUrl;
  final num? _timeout;
  num? get timeout => _timeout;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const IngestionClientOptions(
      {required String apiKey, String? ingestUrl, num? timeout})
      : _apiKey = apiKey,
        _ingestUrl = ingestUrl,
        _timeout = timeout,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  IngestionClientOptions.fromJson(JsonMap json)
      : _apiKey = json["apiKey"] == null ? null : json["apiKey"] as String,
        _ingestUrl =
            json["ingestUrl"] == null ? null : json["ingestUrl"] as String,
        _timeout = json["timeout"] == null ? null : json["timeout"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "apiKey": jsonValue(_apiKey),
        if (_ingestUrl != null) "ingestUrl": jsonValue(_ingestUrl),
        if (_timeout != null) "timeout": jsonValue(_timeout),
      };
}

/// JSON model for JavaScript SDK `ingestion.EndUserIngestionClientOptions`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EndUserIngestionClientOptions implements JsonModel {
  final JsonMap? _originalJson;
  final String? _userToken;

  /// End-user JWT from your auth provider (Auth0, Firebase, Clerk, etc.)
  String get userToken => _userToken as String;
  final String? _tenantId;

  /// Proofchain tenant slug or client_id
  String get tenantId => _tenantId as String;
  final String? _apiUrl;

  /// Base URL for the tenant API (default: https://api.proofchain.co.za)
  String? get apiUrl => _apiUrl;
  final num? _timeout;

  /// Request timeout in ms (default: 30000)
  num? get timeout => _timeout;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EndUserIngestionClientOptions(
      {required String userToken,
      required String tenantId,
      String? apiUrl,
      num? timeout})
      : _userToken = userToken,
        _tenantId = tenantId,
        _apiUrl = apiUrl,
        _timeout = timeout,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EndUserIngestionClientOptions.fromJson(JsonMap json)
      : _userToken =
            json["userToken"] == null ? null : json["userToken"] as String,
        _tenantId =
            json["tenantId"] == null ? null : json["tenantId"] as String,
        _apiUrl = json["apiUrl"] == null ? null : json["apiUrl"] as String,
        _timeout = json["timeout"] == null ? null : json["timeout"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "userToken": jsonValue(_userToken),
        "tenantId": jsonValue(_tenantId),
        if (_apiUrl != null) "apiUrl": jsonValue(_apiUrl),
        if (_timeout != null) "timeout": jsonValue(_timeout),
      };
}

/// JSON model for an inline object in `wallets.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ComprehensiveWalletInfoBalances implements JsonModel {
  final JsonMap? _originalJson;
  final String? _address;
  String get address => _address as String;
  final String? _network;
  String get network => _network as String;
  final List<TokenBalance>? _tokens;
  List<TokenBalance> get tokens => _tokens as List<TokenBalance>;
  final String? _fetched_at;
  String get fetched_at => _fetched_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ComprehensiveWalletInfoBalances(
      {required String address,
      required String network,
      required List<TokenBalance> tokens,
      required String fetched_at})
      : _address = address,
        _network = network,
        _tokens = tokens,
        _fetched_at = fetched_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ComprehensiveWalletInfoBalances.fromJson(JsonMap json)
      : _address = json["address"] == null ? null : json["address"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _tokens = json["tokens"] == null
            ? null
            : (json["tokens"] as List<Object?>)
                .map((item) => TokenBalance.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _fetched_at =
            json["fetched_at"] == null ? null : json["fetched_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "address": jsonValue(_address),
        "network": jsonValue(_network),
        "tokens": jsonValue(_tokens),
        "fetched_at": jsonValue(_fetched_at),
      };
}

/// JSON model for an inline object in `wallets.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ComprehensiveWalletInfoNfts implements JsonModel {
  final JsonMap? _originalJson;
  final num? _total;
  num get total => _total as num;
  final List<NFT>? _items;
  List<NFT> get items => _items as List<NFT>;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ComprehensiveWalletInfoNfts(
      {required num total, required List<NFT> items})
      : _total = total,
        _items = items,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ComprehensiveWalletInfoNfts.fromJson(JsonMap json)
      : _total = json["total"] == null ? null : json["total"] as num,
        _items = json["items"] == null
            ? null
            : (json["items"] as List<Object?>)
                .map((item) => NFT.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "total": jsonValue(_total),
        "items": jsonValue(_items),
      };
}

/// JSON model for an inline object in `wallets.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class ComprehensiveWalletInfoActivity implements JsonModel {
  final JsonMap? _originalJson;
  final List<SwapResult>? _recent_swaps;
  List<SwapResult> get recent_swaps => _recent_swaps as List<SwapResult>;
  final num? _total_swaps;
  num get total_swaps => _total_swaps as num;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const ComprehensiveWalletInfoActivity(
      {required List<SwapResult> recent_swaps, required num total_swaps})
      : _recent_swaps = recent_swaps,
        _total_swaps = total_swaps,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  ComprehensiveWalletInfoActivity.fromJson(JsonMap json)
      : _recent_swaps = json["recent_swaps"] == null
            ? null
            : (json["recent_swaps"] as List<Object?>)
                .map((item) => SwapResult.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _total_swaps =
            json["total_swaps"] == null ? null : json["total_swaps"] as num,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "recent_swaps": jsonValue(_recent_swaps),
        "total_swaps": jsonValue(_total_swaps),
      };
}

/// JSON model for an inline object in `wallets.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserWalletSummaryWalletsItem implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_id;
  String get wallet_id => _wallet_id as String;
  final String? _address;
  String get address => _address as String;
  final String? _wallet_type;
  String get wallet_type => _wallet_type as String;
  final String? _network;
  String get network => _network as String;
  final String? _name;
  String? get name => _name;
  final bool? _supports_export;
  bool get supports_export => _supports_export as bool;
  final String? _created_at;
  String get created_at => _created_at as String;
  final String? _owner_wallet_id;
  String? get owner_wallet_id => _owner_wallet_id;
  final bool? _is_deployed;
  bool? get is_deployed => _is_deployed;
  final UserWalletSummaryWalletsItemBalances? _balances;
  UserWalletSummaryWalletsItemBalances? get balances => _balances;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserWalletSummaryWalletsItem(
      {required String wallet_id,
      required String address,
      required String wallet_type,
      required String network,
      String? name,
      required bool supports_export,
      required String created_at,
      String? owner_wallet_id,
      bool? is_deployed,
      UserWalletSummaryWalletsItemBalances? balances})
      : _wallet_id = wallet_id,
        _address = address,
        _wallet_type = wallet_type,
        _network = network,
        _name = name,
        _supports_export = supports_export,
        _created_at = created_at,
        _owner_wallet_id = owner_wallet_id,
        _is_deployed = is_deployed,
        _balances = balances,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserWalletSummaryWalletsItem.fromJson(JsonMap json)
      : _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _address = json["address"] == null ? null : json["address"] as String,
        _wallet_type =
            json["wallet_type"] == null ? null : json["wallet_type"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _supports_export = json["supports_export"] == null
            ? null
            : json["supports_export"] as bool,
        _created_at =
            json["created_at"] == null ? null : json["created_at"] as String,
        _owner_wallet_id = json["owner_wallet_id"] == null
            ? null
            : json["owner_wallet_id"] as String,
        _is_deployed =
            json["is_deployed"] == null ? null : json["is_deployed"] as bool,
        _balances = json["balances"] == null
            ? null
            : UserWalletSummaryWalletsItemBalances.fromJson(
                asJsonMap(json["balances"])),
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_id": jsonValue(_wallet_id),
        "address": jsonValue(_address),
        "wallet_type": jsonValue(_wallet_type),
        "network": jsonValue(_network),
        if (_name != null) "name": jsonValue(_name),
        "supports_export": jsonValue(_supports_export),
        "created_at": jsonValue(_created_at),
        if (_owner_wallet_id != null)
          "owner_wallet_id": jsonValue(_owner_wallet_id),
        if (_is_deployed != null) "is_deployed": jsonValue(_is_deployed),
        if (_balances != null) "balances": jsonValue(_balances),
      };
}

/// JSON model for an inline object in `wallets.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserWithWalletsWalletsItem implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_id;
  String get wallet_id => _wallet_id as String;
  final String? _address;
  String get address => _address as String;
  final String? _wallet_type;
  String get wallet_type => _wallet_type as String;
  final String? _network;
  String get network => _network as String;
  final String? _name;
  String? get name => _name;
  final String? _status;
  String get status => _status as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserWithWalletsWalletsItem(
      {required String wallet_id,
      required String address,
      required String wallet_type,
      required String network,
      String? name,
      required String status})
      : _wallet_id = wallet_id,
        _address = address,
        _wallet_type = wallet_type,
        _network = network,
        _name = name,
        _status = status,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserWithWalletsWalletsItem.fromJson(JsonMap json)
      : _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _address = json["address"] == null ? null : json["address"] as String,
        _wallet_type =
            json["wallet_type"] == null ? null : json["wallet_type"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _name = json["name"] == null ? null : json["name"] as String,
        _status = json["status"] == null ? null : json["status"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_id": jsonValue(_wallet_id),
        "address": jsonValue(_address),
        "wallet_type": jsonValue(_wallet_type),
        "network": jsonValue(_network),
        if (_name != null) "name": jsonValue(_name),
        "status": jsonValue(_status),
      };
}

/// JSON model for an inline object in `users.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EnsureWalletResultAssetWallet implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_id;
  String get wallet_id => _wallet_id as String;
  final String? _address;
  String get address => _address as String;
  final String? _wallet_type;
  String get wallet_type => _wallet_type as String;
  final String? _network;
  String get network => _network as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EnsureWalletResultAssetWallet(
      {required String wallet_id,
      required String address,
      required String wallet_type,
      required String network})
      : _wallet_id = wallet_id,
        _address = address,
        _wallet_type = wallet_type,
        _network = network,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EnsureWalletResultAssetWallet.fromJson(JsonMap json)
      : _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _address = json["address"] == null ? null : json["address"] as String,
        _wallet_type =
            json["wallet_type"] == null ? null : json["wallet_type"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_id": jsonValue(_wallet_id),
        "address": jsonValue(_address),
        "wallet_type": jsonValue(_wallet_type),
        "network": jsonValue(_network),
      };
}

/// JSON model for an inline object in `users.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EnsureWalletResultSmartWallet implements JsonModel {
  final JsonMap? _originalJson;
  final String? _wallet_id;
  String get wallet_id => _wallet_id as String;
  final String? _address;
  String get address => _address as String;
  final String? _wallet_type;
  String get wallet_type => _wallet_type as String;
  final String? _network;
  String get network => _network as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EnsureWalletResultSmartWallet(
      {required String wallet_id,
      required String address,
      required String wallet_type,
      required String network})
      : _wallet_id = wallet_id,
        _address = address,
        _wallet_type = wallet_type,
        _network = network,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EnsureWalletResultSmartWallet.fromJson(JsonMap json)
      : _wallet_id =
            json["wallet_id"] == null ? null : json["wallet_id"] as String,
        _address = json["address"] == null ? null : json["address"] as String,
        _wallet_type =
            json["wallet_type"] == null ? null : json["wallet_type"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "wallet_id": jsonValue(_wallet_id),
        "address": jsonValue(_address),
        "wallet_type": jsonValue(_wallet_type),
        "network": jsonValue(_network),
      };
}

/// JSON model for an inline object in `dataviews.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class EventMetadataEventTypesItem implements JsonModel {
  final JsonMap? _originalJson;
  final String? _event_type;
  String get event_type => _event_type as String;
  final num? _count;
  num get count => _count as num;
  final String? _last_seen;
  String get last_seen => _last_seen as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const EventMetadataEventTypesItem(
      {required String event_type,
      required num count,
      required String last_seen})
      : _event_type = event_type,
        _count = count,
        _last_seen = last_seen,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  EventMetadataEventTypesItem.fromJson(JsonMap json)
      : _event_type =
            json["event_type"] == null ? null : json["event_type"] as String,
        _count = json["count"] == null ? null : json["count"] as num,
        _last_seen =
            json["last_seen"] == null ? null : json["last_seen"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "event_type": jsonValue(_event_type),
        "count": jsonValue(_count),
        "last_seen": jsonValue(_last_seen),
      };
}

/// JSON model for an inline object in `notifications.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class PushSubscriptionJSONKeys implements JsonModel {
  final JsonMap? _originalJson;
  final String? _p256dh;
  String get p256dh => _p256dh as String;
  final String? _auth;
  String get auth => _auth as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const PushSubscriptionJSONKeys({required String p256dh, required String auth})
      : _p256dh = p256dh,
        _auth = auth,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  PushSubscriptionJSONKeys.fromJson(JsonMap json)
      : _p256dh = json["p256dh"] == null ? null : json["p256dh"] as String,
        _auth = json["auth"] == null ? null : json["auth"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "p256dh": jsonValue(_p256dh),
        "auth": jsonValue(_auth),
      };
}

/// JSON model for an inline object in `wallets.ts`.
///
/// JSON-backed instances retain their input map for serialization.
/// Required non-nullable getters cast stored values and can throw if a decoded
/// field was missing or null; construction does not validate business rules.
class UserWalletSummaryWalletsItemBalances implements JsonModel {
  final JsonMap? _originalJson;
  final String? _address;
  String get address => _address as String;
  final String? _network;
  String get network => _network as String;
  final List<TokenBalance>? _tokens;
  List<TokenBalance> get tokens => _tokens as List<TokenBalance>;
  final String? _fetched_at;
  String get fetched_at => _fetched_at as String;

  /// Creates a model from typed fields.
  ///
  /// Serialization omits null optional fields and includes required fields.
  const UserWalletSummaryWalletsItemBalances(
      {required String address,
      required String network,
      required List<TokenBalance> tokens,
      required String fetched_at})
      : _address = address,
        _network = network,
        _tokens = tokens,
        _fetched_at = fetched_at,
        _originalJson = null;

  /// Decodes typed fields from [json] and retains the same map for [toJson].
  ///
  /// Unknown keys and explicit nulls are preserved in that map. Present values
  /// are decoded immediately and may throw on incompatible types. Missing or
  /// null fields can fail later when read through a required non-nullable getter.
  /// Replacing map entries does not re-decode fields; nested mutable values may
  /// still be shared.
  UserWalletSummaryWalletsItemBalances.fromJson(JsonMap json)
      : _address = json["address"] == null ? null : json["address"] as String,
        _network = json["network"] == null ? null : json["network"] as String,
        _tokens = json["tokens"] == null
            ? null
            : (json["tokens"] as List<Object?>)
                .map((item) => TokenBalance.fromJson(asJsonMap(item)))
                .toList(growable: false),
        _fetched_at =
            json["fetched_at"] == null ? null : json["fetched_at"] as String,
        _originalJson = json;

  /// Returns the original input map for JSON-backed instances, without copying.
  ///
  /// Otherwise encodes typed fields, omitting null optional fields.
  @override
  JsonMap toJson() =>
      _originalJson ??
      {
        "address": jsonValue(_address),
        "network": jsonValue(_network),
        "tokens": jsonValue(_tokens),
        "fetched_at": jsonValue(_fetched_at),
      };
}
