// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListModel<T> _$$_ListModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ListModel<T>(
      code: json['code'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$_ListModelToJson<T>(
  _$_ListModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.map(toJsonT).toList(),
    };
