// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentListEntityImpl _$$DocumentListEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DocumentListEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      status: (json['status'] as num?)?.toInt(),
      electionType: json['election_type'] as String?,
    );

Map<String, dynamic> _$$DocumentListEntityImplToJson(
        _$DocumentListEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'election_type': instance.electionType,
    };
