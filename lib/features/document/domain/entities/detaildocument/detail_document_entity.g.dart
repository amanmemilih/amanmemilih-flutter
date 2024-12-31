// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_document_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailDocumentEntityImpl _$$DetailDocumentEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailDocumentEntityImpl(
      status: (json['status'] as num?)?.toInt(),
      electionType: json['election_type'] as String?,
      votes: (json['votes'] as List<dynamic>?)
          ?.map((e) =>
              DetailDocumentVotesEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DetailDocumentEntityImplToJson(
        _$DetailDocumentEntityImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'election_type': instance.electionType,
      'votes': instance.votes,
      'documents': instance.documents,
    };

_$DetailDocumentVotesEntityImpl _$$DetailDocumentVotesEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailDocumentVotesEntityImpl(
      candidatName: json['candidat_name'] as String?,
      candidatNo: (json['candidat_no'] as num?)?.toInt(),
      totalVotes: (json['total_votes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DetailDocumentVotesEntityImplToJson(
        _$DetailDocumentVotesEntityImpl instance) =>
    <String, dynamic>{
      'candidat_name': instance.candidatName,
      'candidat_no': instance.candidatNo,
      'total_votes': instance.totalVotes,
    };
