import 'dart:typed_data';

/// In-memory file input for the JavaScript SDK's File/Blob/Buffer arguments.
final class UploadFile {
  /// File bytes retained by reference when supplied as a [Uint8List].
  final Uint8List bytes;

  /// Multipart filename; defaults to `document`.
  final String filename;

  /// MIME type parsed by the multipart transport before sending.
  final String contentType;

  /// Creates an in-memory upload, copying only non-[Uint8List] inputs.
  ///
  /// The default content type is `application/octet-stream`. Keep referenced
  /// bytes unchanged until the upload, including any retries, has completed.
  UploadFile(List<int> bytes,
      {this.filename = 'document',
      this.contentType = 'application/octet-stream'})
      : bytes = bytes is Uint8List ? bytes : Uint8List.fromList(bytes);
}
