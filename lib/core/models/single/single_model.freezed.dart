// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SingleModel<T> _$SingleModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _SingleModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$SingleModel<T> {
  int? get code => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleModelCopyWith<T, SingleModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleModelCopyWith<T, $Res> {
  factory $SingleModelCopyWith(
          SingleModel<T> value, $Res Function(SingleModel<T>) then) =
      _$SingleModelCopyWithImpl<T, $Res, SingleModel<T>>;
  @useResult
  $Res call({int? code, bool? success, String? message, T? data});
}

/// @nodoc
class _$SingleModelCopyWithImpl<T, $Res, $Val extends SingleModel<T>>
    implements $SingleModelCopyWith<T, $Res> {
  _$SingleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SingleModelCopyWith<T, $Res>
    implements $SingleModelCopyWith<T, $Res> {
  factory _$$_SingleModelCopyWith(
          _$_SingleModel<T> value, $Res Function(_$_SingleModel<T>) then) =
      __$$_SingleModelCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? code, bool? success, String? message, T? data});
}

/// @nodoc
class __$$_SingleModelCopyWithImpl<T, $Res>
    extends _$SingleModelCopyWithImpl<T, $Res, _$_SingleModel<T>>
    implements _$$_SingleModelCopyWith<T, $Res> {
  __$$_SingleModelCopyWithImpl(
      _$_SingleModel<T> _value, $Res Function(_$_SingleModel<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_SingleModel<T>(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_SingleModel<T> implements _SingleModel<T> {
  const _$_SingleModel({this.code, this.success, this.message, this.data});

  factory _$_SingleModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_SingleModelFromJson(json, fromJsonT);

  @override
  final int? code;
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final T? data;

  @override
  String toString() {
    return 'SingleModel<$T>(code: $code, success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleModel<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, success, message,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleModelCopyWith<T, _$_SingleModel<T>> get copyWith =>
      __$$_SingleModelCopyWithImpl<T, _$_SingleModel<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_SingleModelToJson<T>(this, toJsonT);
  }
}

abstract class _SingleModel<T> implements SingleModel<T> {
  const factory _SingleModel(
      {final int? code,
      final bool? success,
      final String? message,
      final T? data}) = _$_SingleModel<T>;

  factory _SingleModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_SingleModel<T>.fromJson;

  @override
  int? get code;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$_SingleModelCopyWith<T, _$_SingleModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
