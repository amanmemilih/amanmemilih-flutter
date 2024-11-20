// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'empty_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmptyModel _$EmptyModelFromJson(Map<String, dynamic> json) {
  return _EmptyModel.fromJson(json);
}

/// @nodoc
mixin _$EmptyModel {
  int? get code => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmptyModelCopyWith<EmptyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyModelCopyWith<$Res> {
  factory $EmptyModelCopyWith(
          EmptyModel value, $Res Function(EmptyModel) then) =
      _$EmptyModelCopyWithImpl<$Res, EmptyModel>;
  @useResult
  $Res call({int? code, bool? success, String? message});
}

/// @nodoc
class _$EmptyModelCopyWithImpl<$Res, $Val extends EmptyModel>
    implements $EmptyModelCopyWith<$Res> {
  _$EmptyModelCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmptyModelCopyWith<$Res>
    implements $EmptyModelCopyWith<$Res> {
  factory _$$_EmptyModelCopyWith(
          _$_EmptyModel value, $Res Function(_$_EmptyModel) then) =
      __$$_EmptyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, bool? success, String? message});
}

/// @nodoc
class __$$_EmptyModelCopyWithImpl<$Res>
    extends _$EmptyModelCopyWithImpl<$Res, _$_EmptyModel>
    implements _$$_EmptyModelCopyWith<$Res> {
  __$$_EmptyModelCopyWithImpl(
      _$_EmptyModel _value, $Res Function(_$_EmptyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_EmptyModel(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_EmptyModel implements _EmptyModel {
  const _$_EmptyModel({this.code, this.success, this.message});

  factory _$_EmptyModel.fromJson(Map<String, dynamic> json) =>
      _$$_EmptyModelFromJson(json);

  @override
  final int? code;
  @override
  final bool? success;
  @override
  final String? message;

  @override
  String toString() {
    return 'EmptyModel(code: $code, success: $success, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmptyModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, success, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmptyModelCopyWith<_$_EmptyModel> get copyWith =>
      __$$_EmptyModelCopyWithImpl<_$_EmptyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmptyModelToJson(
      this,
    );
  }
}

abstract class _EmptyModel implements EmptyModel {
  const factory _EmptyModel(
      {final int? code,
      final bool? success,
      final String? message}) = _$_EmptyModel;

  factory _EmptyModel.fromJson(Map<String, dynamic> json) =
      _$_EmptyModel.fromJson;

  @override
  int? get code;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_EmptyModelCopyWith<_$_EmptyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
