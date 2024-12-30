// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_document_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadDocumentRequestImpl _$$UploadDocumentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadDocumentRequestImpl(
      electionType: json['election_type'] as String?,
      votes: (json['votes'] as List<dynamic>?)
          ?.map((e) =>
              UploadDocumentVoteRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePaths: (json['image_paths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UploadDocumentRequestImplToJson(
        _$UploadDocumentRequestImpl instance) =>
    <String, dynamic>{
      'election_type': instance.electionType,
      'votes': instance.votes,
      'image_paths': instance.imagePaths,
    };

_$UploadDocumentVoteRequestImpl _$$UploadDocumentVoteRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadDocumentVoteRequestImpl(
      candidatId: (json['candidat_id'] as num?)?.toInt(),
      totalVotes: (json['total_votes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UploadDocumentVoteRequestImplToJson(
        _$UploadDocumentVoteRequestImpl instance) =>
    <String, dynamic>{
      'candidat_id': instance.candidatId,
      'total_votes': instance.totalVotes,
    };
