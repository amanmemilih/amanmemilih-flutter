// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordState {
  ForgotPasswordStatus get status => throw _privateConstructorUsedError;
  ErrorObject? get error => throw _privateConstructorUsedError;
  bool get isKeyHidden => throw _privateConstructorUsedError;
  bool get isPasswordHidden => throw _privateConstructorUsedError;
  bool get isPasswordConfirmationHidden => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
  @useResult
  $Res call(
      {ForgotPasswordStatus status,
      ErrorObject? error,
      bool isKeyHidden,
      bool isPasswordHidden,
      bool isPasswordConfirmationHidden});
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isKeyHidden = null,
    Object? isPasswordHidden = null,
    Object? isPasswordConfirmationHidden = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      isKeyHidden: null == isKeyHidden
          ? _value.isKeyHidden
          : isKeyHidden // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$ForgotPasswordStateImplCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$ForgotPasswordStateImplCopyWith(_$ForgotPasswordStateImpl value,
          $Res Function(_$ForgotPasswordStateImpl) then) =
      __$$ForgotPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ForgotPasswordStatus status,
      ErrorObject? error,
      bool isKeyHidden,
      bool isPasswordHidden,
      bool isPasswordConfirmationHidden});
}

/// @nodoc
class __$$ForgotPasswordStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$ForgotPasswordStateImpl>
    implements _$$ForgotPasswordStateImplCopyWith<$Res> {
  __$$ForgotPasswordStateImplCopyWithImpl(_$ForgotPasswordStateImpl _value,
      $Res Function(_$ForgotPasswordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isKeyHidden = null,
    Object? isPasswordHidden = null,
    Object? isPasswordConfirmationHidden = null,
  }) {
    return _then(_$ForgotPasswordStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      isKeyHidden: null == isKeyHidden
          ? _value.isKeyHidden
          : isKeyHidden // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$ForgotPasswordStateImpl implements _ForgotPasswordState {
  const _$ForgotPasswordStateImpl(
      {required this.status,
      required this.error,
      required this.isKeyHidden,
      required this.isPasswordHidden,
      required this.isPasswordConfirmationHidden});

  @override
  final ForgotPasswordStatus status;
  @override
  final ErrorObject? error;
  @override
  final bool isKeyHidden;
  @override
  final bool isPasswordHidden;
  @override
  final bool isPasswordConfirmationHidden;

  @override
  String toString() {
    return 'ForgotPasswordState(status: $status, error: $error, isKeyHidden: $isKeyHidden, isPasswordHidden: $isPasswordHidden, isPasswordConfirmationHidden: $isPasswordConfirmationHidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isKeyHidden, isKeyHidden) ||
                other.isKeyHidden == isKeyHidden) &&
            (identical(other.isPasswordHidden, isPasswordHidden) ||
                other.isPasswordHidden == isPasswordHidden) &&
            (identical(other.isPasswordConfirmationHidden,
                    isPasswordConfirmationHidden) ||
                other.isPasswordConfirmationHidden ==
                    isPasswordConfirmationHidden));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, isKeyHidden,
      isPasswordHidden, isPasswordConfirmationHidden);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordStateImplCopyWith<_$ForgotPasswordStateImpl> get copyWith =>
      __$$ForgotPasswordStateImplCopyWithImpl<_$ForgotPasswordStateImpl>(
          this, _$identity);
}

abstract class _ForgotPasswordState implements ForgotPasswordState {
  const factory _ForgotPasswordState(
          {required final ForgotPasswordStatus status,
          required final ErrorObject? error,
          required final bool isKeyHidden,
          required final bool isPasswordHidden,
          required final bool isPasswordConfirmationHidden}) =
      _$ForgotPasswordStateImpl;

  @override
  ForgotPasswordStatus get status;
  @override
  ErrorObject? get error;
  @override
  bool get isKeyHidden;
  @override
  bool get isPasswordHidden;
  @override
  bool get isPasswordConfirmationHidden;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordStateImplCopyWith<_$ForgotPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
