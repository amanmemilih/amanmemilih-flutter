// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credential_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CredentialEntity _$CredentialEntityFromJson(Map<String, dynamic> json) {
  return _CredentialEntity.fromJson(json);
}

/// @nodoc
mixin _$CredentialEntity {
  String? get token => throw _privateConstructorUsedError;
  UserEntity? get user => throw _privateConstructorUsedError;

  /// Serializes this CredentialEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CredentialEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CredentialEntityCopyWith<CredentialEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialEntityCopyWith<$Res> {
  factory $CredentialEntityCopyWith(
          CredentialEntity value, $Res Function(CredentialEntity) then) =
      _$CredentialEntityCopyWithImpl<$Res, CredentialEntity>;
  @useResult
  $Res call({String? token, UserEntity? user});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$CredentialEntityCopyWithImpl<$Res, $Val extends CredentialEntity>
    implements $CredentialEntityCopyWith<$Res> {
  _$CredentialEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CredentialEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ) as $Val);
  }

  /// Create a copy of CredentialEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CredentialEntityImplCopyWith<$Res>
    implements $CredentialEntityCopyWith<$Res> {
  factory _$$CredentialEntityImplCopyWith(_$CredentialEntityImpl value,
          $Res Function(_$CredentialEntityImpl) then) =
      __$$CredentialEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token, UserEntity? user});

  @override
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$CredentialEntityImplCopyWithImpl<$Res>
    extends _$CredentialEntityCopyWithImpl<$Res, _$CredentialEntityImpl>
    implements _$$CredentialEntityImplCopyWith<$Res> {
  __$$CredentialEntityImplCopyWithImpl(_$CredentialEntityImpl _value,
      $Res Function(_$CredentialEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CredentialEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_$CredentialEntityImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CredentialEntityImpl implements _CredentialEntity {
  const _$CredentialEntityImpl({this.token, this.user});

  factory _$CredentialEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CredentialEntityImplFromJson(json);

  @override
  final String? token;
  @override
  final UserEntity? user;

  @override
  String toString() {
    return 'CredentialEntity(token: $token, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialEntityImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, user);

  /// Create a copy of CredentialEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CredentialEntityImplCopyWith<_$CredentialEntityImpl> get copyWith =>
      __$$CredentialEntityImplCopyWithImpl<_$CredentialEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CredentialEntityImplToJson(
      this,
    );
  }
}

abstract class _CredentialEntity implements CredentialEntity {
  const factory _CredentialEntity(
      {final String? token, final UserEntity? user}) = _$CredentialEntityImpl;

  factory _CredentialEntity.fromJson(Map<String, dynamic> json) =
      _$CredentialEntityImpl.fromJson;

  @override
  String? get token;
  @override
  UserEntity? get user;

  /// Create a copy of CredentialEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CredentialEntityImplCopyWith<_$CredentialEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
