// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardEntityImpl _$$DashboardEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardEntityImpl(
      notUploaded: (json['not_uploaded'] as num?)?.toInt(),
      uploaded: (json['uploaded'] as num?)?.toInt(),
      verified: (json['verified'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DashboardEntityImplToJson(
        _$DashboardEntityImpl instance) =>
    <String, dynamic>{
      'not_uploaded': instance.notUploaded,
      'uploaded': instance.uploaded,
      'verified': instance.verified,
    };
