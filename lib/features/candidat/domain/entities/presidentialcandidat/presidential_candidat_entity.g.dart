// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presidential_candidat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PresidentialCandidatEntityImpl _$$PresidentialCandidatEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PresidentialCandidatEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      no: (json['no'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$PresidentialCandidatEntityImplToJson(
        _$PresidentialCandidatEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'name': instance.name,
    };
