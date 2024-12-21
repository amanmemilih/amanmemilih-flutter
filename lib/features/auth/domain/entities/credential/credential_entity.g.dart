// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CredentialEntityImpl _$$CredentialEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CredentialEntityImpl(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CredentialEntityImplToJson(
        _$CredentialEntityImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
