// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterPasswordState {
  RegisterPasswordStatus get status => throw _privateConstructorUsedError;
  ErrorObject? get error => throw _privateConstructorUsedError;
  bool get isPasswordHidden => throw _privateConstructorUsedError;
  bool get isPasswordConfirmationHidden => throw _privateConstructorUsedError;

  /// Create a copy of RegisterPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterPasswordStateCopyWith<RegisterPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPasswordStateCopyWith<$Res> {
  factory $RegisterPasswordStateCopyWith(RegisterPasswordState value,
          $Res Function(RegisterPasswordState) then) =
      _$RegisterPasswordStateCopyWithImpl<$Res, RegisterPasswordState>;
  @useResult
  $Res call(
      {RegisterPasswordStatus status,
      ErrorObject? error,
      bool isPasswordHidden,
      bool isPasswordConfirmationHidden});
}

/// @nodoc
class _$RegisterPasswordStateCopyWithImpl<$Res,
        $Val extends RegisterPasswordState>
    implements $RegisterPasswordStateCopyWith<$Res> {
  _$RegisterPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isPasswordHidden = null,
    Object? isPasswordConfirmationHidden = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterPasswordStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      isPasswordHidden: null == isPasswordHidden
          ? _value.isPasswordHidden
          : isPasswordHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordConfirmationHidden: null == isPasswordConfirmationHidden
          ? _value.isPasswordConfirmationHidden
          : isPasswordConfirmationHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterPasswordStateImplCopyWith<$Res>
    implements $RegisterPasswordStateCopyWith<$Res> {
  factory _$$RegisterPasswordStateImplCopyWith(
          _$RegisterPasswordStateImpl value,
          $Res Function(_$RegisterPasswordStateImpl) then) =
      __$$RegisterPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RegisterPasswordStatus status,
      ErrorObject? error,
      bool isPasswordHidden,
      bool isPasswordConfirmationHidden});
}

/// @nodoc
class __$$RegisterPasswordStateImplCopyWithImpl<$Res>
    extends _$RegisterPasswordStateCopyWithImpl<$Res,
        _$RegisterPasswordStateImpl>
    implements _$$RegisterPasswordStateImplCopyWith<$Res> {
  __$$RegisterPasswordStateImplCopyWithImpl(_$RegisterPasswordStateImpl _value,
      $Res Function(_$RegisterPasswordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isPasswordHidden = null,
    Object? isPasswordConfirmationHidden = null,
  }) {
    return _then(_$RegisterPasswordStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterPasswordStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      isPasswordHidden: null == isPasswordHidden
          ? _value.isPasswordHidden
          : isPasswordHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordConfirmationHidden: null == isPasswordConfirmationHidden
          ? _value.isPasswordConfirmationHidden
          : isPasswordConfirmationHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterPasswordStateImpl implements _RegisterPasswordState {
  const _$RegisterPasswordStateImpl(
      {required this.status,
      required this.error,
      required this.isPasswordHidden,
      required this.isPasswordConfirmationHidden});

  @override
  final RegisterPasswordStatus status;
  @override
  final ErrorObject? error;
  @override
  final bool isPasswordHidden;
  @override
  final bool isPasswordConfirmationHidden;

  @override
  String toString() {
    return 'RegisterPasswordState(status: $status, error: $error, isPasswordHidden: $isPasswordHidden, isPasswordConfirmationHidden: $isPasswordConfirmationHidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPasswordStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isPasswordHidden, isPasswordHidden) ||
                other.isPasswordHidden == isPasswordHidden) &&
            (identical(other.isPasswordConfirmationHidden,
                    isPasswordConfirmationHidden) ||
                other.isPasswordConfirmationHidden ==
                    isPasswordConfirmationHidden));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, isPasswordHidden,
      isPasswordConfirmationHidden);

  /// Create a copy of RegisterPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPasswordStateImplCopyWith<_$RegisterPasswordStateImpl>
      get copyWith => __$$RegisterPasswordStateImplCopyWithImpl<
          _$RegisterPasswordStateImpl>(this, _$identity);
}

abstract class _RegisterPasswordState implements RegisterPasswordState {
  const factory _RegisterPasswordState(
          {required final RegisterPasswordStatus status,
          required final ErrorObject? error,
          required final bool isPasswordHidden,
          required final bool isPasswordConfirmationHidden}) =
      _$RegisterPasswordStateImpl;

  @override
  RegisterPasswordStatus get status;
  @override
  ErrorObject? get error;
  @override
  bool get isPasswordHidden;
  @override
  bool get isPasswordConfirmationHidden;

  /// Create a copy of RegisterPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterPasswordStateImplCopyWith<_$RegisterPasswordStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
