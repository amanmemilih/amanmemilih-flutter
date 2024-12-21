// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmptyModelImpl _$$EmptyModelImplFromJson(Map<String, dynamic> json) =>
    _$EmptyModelImpl(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$EmptyModelImplToJson(_$EmptyModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
    };
