// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_recovery_key_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterRecoveryKeyState {
  RegisterRecoveryKeyStatus get status => throw _privateConstructorUsedError;
  ErrorObject? get error => throw _privateConstructorUsedError;
  bool get isKeyHidden => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRecoveryKeyStateCopyWith<RegisterRecoveryKeyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRecoveryKeyStateCopyWith<$Res> {
  factory $RegisterRecoveryKeyStateCopyWith(RegisterRecoveryKeyState value,
          $Res Function(RegisterRecoveryKeyState) then) =
      _$RegisterRecoveryKeyStateCopyWithImpl<$Res, RegisterRecoveryKeyState>;
  @useResult
  $Res call(
      {RegisterRecoveryKeyStatus status, ErrorObject? error, bool isKeyHidden});
}

/// @nodoc
class _$RegisterRecoveryKeyStateCopyWithImpl<$Res,
        $Val extends RegisterRecoveryKeyState>
    implements $RegisterRecoveryKeyStateCopyWith<$Res> {
  _$RegisterRecoveryKeyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isKeyHidden = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterRecoveryKeyStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      isKeyHidden: null == isKeyHidden
          ? _value.isKeyHidden
          : isKeyHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterRecoveryKeyStateImplCopyWith<$Res>
    implements $RegisterRecoveryKeyStateCopyWith<$Res> {
  factory _$$RegisterRecoveryKeyStateImplCopyWith(
          _$RegisterRecoveryKeyStateImpl value,
          $Res Function(_$RegisterRecoveryKeyStateImpl) then) =
      __$$RegisterRecoveryKeyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RegisterRecoveryKeyStatus status, ErrorObject? error, bool isKeyHidden});
}

/// @nodoc
class __$$RegisterRecoveryKeyStateImplCopyWithImpl<$Res>
    extends _$RegisterRecoveryKeyStateCopyWithImpl<$Res,
        _$RegisterRecoveryKeyStateImpl>
    implements _$$RegisterRecoveryKeyStateImplCopyWith<$Res> {
  __$$RegisterRecoveryKeyStateImplCopyWithImpl(
      _$RegisterRecoveryKeyStateImpl _value,
      $Res Function(_$RegisterRecoveryKeyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isKeyHidden = null,
  }) {
    return _then(_$RegisterRecoveryKeyStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterRecoveryKeyStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      isKeyHidden: null == isKeyHidden
          ? _value.isKeyHidden
          : isKeyHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterRecoveryKeyStateImpl implements _RegisterRecoveryKeyState {
  const _$RegisterRecoveryKeyStateImpl(
      {required this.status, required this.error, required this.isKeyHidden});

  @override
  final RegisterRecoveryKeyStatus status;
  @override
  final ErrorObject? error;
  @override
  final bool isKeyHidden;

  @override
  String toString() {
    return 'RegisterRecoveryKeyState(status: $status, error: $error, isKeyHidden: $isKeyHidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRecoveryKeyStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isKeyHidden, isKeyHidden) ||
                other.isKeyHidden == isKeyHidden));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, isKeyHidden);

  /// Create a copy of RegisterRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRecoveryKeyStateImplCopyWith<_$RegisterRecoveryKeyStateImpl>
      get copyWith => __$$RegisterRecoveryKeyStateImplCopyWithImpl<
          _$RegisterRecoveryKeyStateImpl>(this, _$identity);
}

abstract class _RegisterRecoveryKeyState implements RegisterRecoveryKeyState {
  const factory _RegisterRecoveryKeyState(
      {required final RegisterRecoveryKeyStatus status,
      required final ErrorObject? error,
      required final bool isKeyHidden}) = _$RegisterRecoveryKeyStateImpl;

  @override
  RegisterRecoveryKeyStatus get status;
  @override
  ErrorObject? get error;
  @override
  bool get isKeyHidden;

  /// Create a copy of RegisterRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRecoveryKeyStateImplCopyWith<_$RegisterRecoveryKeyStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
