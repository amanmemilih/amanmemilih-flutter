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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmptyModel _$EmptyModelFromJson(Map<String, dynamic> json) {
  return _EmptyModel.fromJson(json);
}

/// @nodoc
mixin _$EmptyModel {
  int? get code => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this EmptyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmptyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of EmptyModel
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$EmptyModelImplCopyWith<$Res>
    implements $EmptyModelCopyWith<$Res> {
  factory _$$EmptyModelImplCopyWith(
          _$EmptyModelImpl value, $Res Function(_$EmptyModelImpl) then) =
      __$$EmptyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, bool? success, String? message});
}

/// @nodoc
class __$$EmptyModelImplCopyWithImpl<$Res>
    extends _$EmptyModelCopyWithImpl<$Res, _$EmptyModelImpl>
    implements _$$EmptyModelImplCopyWith<$Res> {
  __$$EmptyModelImplCopyWithImpl(
      _$EmptyModelImpl _value, $Res Function(_$EmptyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmptyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_$EmptyModelImpl(
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
class _$EmptyModelImpl implements _EmptyModel {
  const _$EmptyModelImpl({this.code, this.success, this.message});

  factory _$EmptyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmptyModelImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, success, message);

  /// Create a copy of EmptyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyModelImplCopyWith<_$EmptyModelImpl> get copyWith =>
      __$$EmptyModelImplCopyWithImpl<_$EmptyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyModelImplToJson(
      this,
    );
  }
}

abstract class _EmptyModel implements EmptyModel {
  const factory _EmptyModel(
      {final int? code,
      final bool? success,
      final String? message}) = _$EmptyModelImpl;

  factory _EmptyModel.fromJson(Map<String, dynamic> json) =
      _$EmptyModelImpl.fromJson;

  @override
  int? get code;
  @override
  bool? get success;
  @override
  String? get message;

  /// Create a copy of EmptyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmptyModelImplCopyWith<_$EmptyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
