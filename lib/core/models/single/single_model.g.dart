// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingleModelImpl<T> _$$SingleModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SingleModelImpl<T>(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$$SingleModelImplToJson<T>(
  _$SingleModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
