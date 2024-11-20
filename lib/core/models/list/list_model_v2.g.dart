// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListModelV2<T> _$$_ListModelV2FromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ListModelV2<T>(
      code: json['code'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      result: (json['result'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$_ListModelV2ToJson<T>(
  _$_ListModelV2<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'result': instance.result?.map(toJsonT).toList(),
    };
