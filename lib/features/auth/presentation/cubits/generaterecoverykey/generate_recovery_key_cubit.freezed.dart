// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_recovery_key_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GenerateRecoveryKeyState {
  GenerateRecoveryKeyStatus get status => throw _privateConstructorUsedError;
  ErrorObject? get error => throw _privateConstructorUsedError;
  List<String> get recoveryKey => throw _privateConstructorUsedError;
  RecoveryKeyEntity? get data => throw _privateConstructorUsedError;

  /// Create a copy of GenerateRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateRecoveryKeyStateCopyWith<GenerateRecoveryKeyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateRecoveryKeyStateCopyWith<$Res> {
  factory $GenerateRecoveryKeyStateCopyWith(GenerateRecoveryKeyState value,
          $Res Function(GenerateRecoveryKeyState) then) =
      _$GenerateRecoveryKeyStateCopyWithImpl<$Res, GenerateRecoveryKeyState>;
  @useResult
  $Res call(
      {GenerateRecoveryKeyStatus status,
      ErrorObject? error,
      List<String> recoveryKey,
      RecoveryKeyEntity? data});

  $RecoveryKeyEntityCopyWith<$Res>? get data;
}

/// @nodoc
class _$GenerateRecoveryKeyStateCopyWithImpl<$Res,
        $Val extends GenerateRecoveryKeyState>
    implements $GenerateRecoveryKeyStateCopyWith<$Res> {
  _$GenerateRecoveryKeyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? recoveryKey = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GenerateRecoveryKeyStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      recoveryKey: null == recoveryKey
          ? _value.recoveryKey
          : recoveryKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RecoveryKeyEntity?,
    ) as $Val);
  }

  /// Create a copy of GenerateRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecoveryKeyEntityCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $RecoveryKeyEntityCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerateRecoveryKeyStateImplCopyWith<$Res>
    implements $GenerateRecoveryKeyStateCopyWith<$Res> {
  factory _$$GenerateRecoveryKeyStateImplCopyWith(
          _$GenerateRecoveryKeyStateImpl value,
          $Res Function(_$GenerateRecoveryKeyStateImpl) then) =
      __$$GenerateRecoveryKeyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenerateRecoveryKeyStatus status,
      ErrorObject? error,
      List<String> recoveryKey,
      RecoveryKeyEntity? data});

  @override
  $RecoveryKeyEntityCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GenerateRecoveryKeyStateImplCopyWithImpl<$Res>
    extends _$GenerateRecoveryKeyStateCopyWithImpl<$Res,
        _$GenerateRecoveryKeyStateImpl>
    implements _$$GenerateRecoveryKeyStateImplCopyWith<$Res> {
  __$$GenerateRecoveryKeyStateImplCopyWithImpl(
      _$GenerateRecoveryKeyStateImpl _value,
      $Res Function(_$GenerateRecoveryKeyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? recoveryKey = null,
    Object? data = freezed,
  }) {
    return _then(_$GenerateRecoveryKeyStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GenerateRecoveryKeyStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      recoveryKey: null == recoveryKey
          ? _value._recoveryKey
          : recoveryKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RecoveryKeyEntity?,
    ));
  }
}

/// @nodoc

class _$GenerateRecoveryKeyStateImpl implements _GenerateRecoveryKeyState {
  const _$GenerateRecoveryKeyStateImpl(
      {required this.status,
      required this.error,
      required final List<String> recoveryKey,
      this.data})
      : _recoveryKey = recoveryKey;

  @override
  final GenerateRecoveryKeyStatus status;
  @override
  final ErrorObject? error;
  final List<String> _recoveryKey;
  @override
  List<String> get recoveryKey {
    if (_recoveryKey is EqualUnmodifiableListView) return _recoveryKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recoveryKey);
  }

  @override
  final RecoveryKeyEntity? data;

  @override
  String toString() {
    return 'GenerateRecoveryKeyState(status: $status, error: $error, recoveryKey: $recoveryKey, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateRecoveryKeyStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._recoveryKey, _recoveryKey) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error,
      const DeepCollectionEquality().hash(_recoveryKey), data);

  /// Create a copy of GenerateRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateRecoveryKeyStateImplCopyWith<_$GenerateRecoveryKeyStateImpl>
      get copyWith => __$$GenerateRecoveryKeyStateImplCopyWithImpl<
          _$GenerateRecoveryKeyStateImpl>(this, _$identity);
}

abstract class _GenerateRecoveryKeyState implements GenerateRecoveryKeyState {
  const factory _GenerateRecoveryKeyState(
      {required final GenerateRecoveryKeyStatus status,
      required final ErrorObject? error,
      required final List<String> recoveryKey,
      final RecoveryKeyEntity? data}) = _$GenerateRecoveryKeyStateImpl;

  @override
  GenerateRecoveryKeyStatus get status;
  @override
  ErrorObject? get error;
  @override
  List<String> get recoveryKey;
  @override
  RecoveryKeyEntity? get data;

  /// Create a copy of GenerateRecoveryKeyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateRecoveryKeyStateImplCopyWith<_$GenerateRecoveryKeyStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
