// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SingleModel<T> _$$_SingleModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_SingleModel<T>(
      code: json['code'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$$_SingleModelToJson<T>(
  _$_SingleModel<T> instance,
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
