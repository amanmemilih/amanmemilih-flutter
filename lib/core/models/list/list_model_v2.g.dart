// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListModelV2Impl<T> _$$ListModelV2ImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ListModelV2Impl<T>(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      result: (json['result'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$ListModelV2ImplToJson<T>(
  _$ListModelV2Impl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'result': instance.result?.map(toJsonT).toList(),
    };
