import 'dart:convert';

import 'http.dart';
import 'json.dart';
import 'models.dart';
import 'upload.dart';

class NftClient {
  final HttpClient http;
  NftClient(this.http);

  Future<NFTMint> mint(MintNFTRequest request) async {
    final fields = <String, String>{
      'recipient_address': request.recipientAddress,
      'name': request.name,
    };
    final files = <String, UploadFile>{};
    final image = request.image;
    if (image != null) {
      files['image'] = UploadFile(image.bytes,
          filename: jsTruthy(request.imageFilename)
              ? request.imageFilename!
              : 'image.png',
          contentType: image.contentType);
    }
    for (final entry in <String, Object?>{
      'image_url': request.imageUrl,
      'recipient_user_id': request.recipientUserId,
      'description': request.description,
      'network': request.network,
      'contract_address': request.contractAddress,
    }.entries) {
      if (jsTruthy(entry.value)) fields[entry.key] = jsString(entry.value);
    }
    if (request.soulbound != null) {
      fields['soulbound'] = jsString(request.soulbound);
    }
    if (request.validityDays != null) {
      fields['validity_days'] = jsString(request.validityDays);
    }
    if (request.metadata != null) {
      fields['metadata'] = jsonEncode(jsonValue(request.metadata));
    }
    return decodeModel(
        await http.requestMultipart('/nft/mint', files: files, fields: fields),
        NFTMint.fromJson);
  }

  Future<ListMintsResponse> list([ListMintsOptions? options]) async =>
      decodeModel(
          await http.get('/nft/mints', {
            'recipient_address': options?.recipientAddress,
            'network': options?.network,
            'status': options?.status,
            'limit': options?.limit,
            'offset': options?.offset,
          }),
          ListMintsResponse.fromJson);
  Future<NFTMint> get(String mintId) async =>
      decodeModel(await http.get('/nft/mints/$mintId'), NFTMint.fromJson);
}
