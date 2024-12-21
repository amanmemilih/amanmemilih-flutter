// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      address: json['address'] as String?,
      village: json['village'] as String?,
      subdistrict: json['subdistrict'] as String?,
      district: json['district'] as String?,
      province: json['province'] as String?,
      region: json['region'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'address': instance.address,
      'village': instance.village,
      'subdistrict': instance.subdistrict,
      'district': instance.district,
      'province': instance.province,
      'region': instance.region,
      'created_at': instance.createdAt,
    };
