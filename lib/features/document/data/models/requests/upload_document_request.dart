// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_document_request.g.dart';
part 'upload_document_request.freezed.dart';

@freezed
sealed class UploadDocumentRequest with _$UploadDocumentRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UploadDocumentRequest({
    String? electionType,
    List<UploadDocumentVoteRequest>? votes,
    List<String>? imagePaths,
  }) = _UploadDocumentRequest;

  factory UploadDocumentRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadDocumentRequestFromJson(json);
}

@freezed
sealed class UploadDocumentVoteRequest with _$UploadDocumentVoteRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UploadDocumentVoteRequest({
    int? candidatId,
    int? totalVotes,
  }) = _UploadDocumentVoteRequest;

  factory UploadDocumentVoteRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadDocumentVoteRequestFromJson(json);
}
