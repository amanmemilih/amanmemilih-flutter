// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_model_v2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListModelV2<T> _$ListModelV2FromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ListModelV2<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ListModelV2<T> {
  int? get code => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<T>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListModelV2CopyWith<T, ListModelV2<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListModelV2CopyWith<T, $Res> {
  factory $ListModelV2CopyWith(
          ListModelV2<T> value, $Res Function(ListModelV2<T>) then) =
      _$ListModelV2CopyWithImpl<T, $Res, ListModelV2<T>>;
  @useResult
  $Res call({int? code, bool? success, String? message, List<T>? result});
}

/// @nodoc
class _$ListModelV2CopyWithImpl<T, $Res, $Val extends ListModelV2<T>>
    implements $ListModelV2CopyWith<T, $Res> {
  _$ListModelV2CopyWithImpl(this._value, this._then);

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
    Object? result = freezed,
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
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListModelV2CopyWith<T, $Res>
    implements $ListModelV2CopyWith<T, $Res> {
  factory _$$_ListModelV2CopyWith(
          _$_ListModelV2<T> value, $Res Function(_$_ListModelV2<T>) then) =
      __$$_ListModelV2CopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? code, bool? success, String? message, List<T>? result});
}

/// @nodoc
class __$$_ListModelV2CopyWithImpl<T, $Res>
    extends _$ListModelV2CopyWithImpl<T, $Res, _$_ListModelV2<T>>
    implements _$$_ListModelV2CopyWith<T, $Res> {
  __$$_ListModelV2CopyWithImpl(
      _$_ListModelV2<T> _value, $Res Function(_$_ListModelV2<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? success = freezed,
    Object? message = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_ListModelV2<T>(
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
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ListModelV2<T> implements _ListModelV2<T> {
  const _$_ListModelV2(
      {this.code, this.success, this.message, final List<T>? result})
      : _result = result;

  factory _$_ListModelV2.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ListModelV2FromJson(json, fromJsonT);

  @override
  final int? code;
  @override
  final bool? success;
  @override
  final String? message;
  final List<T>? _result;
  @override
  List<T>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListModelV2<$T>(code: $code, success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListModelV2<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, success, message,
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListModelV2CopyWith<T, _$_ListModelV2<T>> get copyWith =>
      __$$_ListModelV2CopyWithImpl<T, _$_ListModelV2<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_ListModelV2ToJson<T>(this, toJsonT);
  }
}

abstract class _ListModelV2<T> implements ListModelV2<T> {
  const factory _ListModelV2(
      {final int? code,
      final bool? success,
      final String? message,
      final List<T>? result}) = _$_ListModelV2<T>;

  factory _ListModelV2.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ListModelV2<T>.fromJson;

  @override
  int? get code;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<T>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_ListModelV2CopyWith<T, _$_ListModelV2<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
