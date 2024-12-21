// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardEntity _$DashboardEntityFromJson(Map<String, dynamic> json) {
  return _DashboardEntity.fromJson(json);
}

/// @nodoc
mixin _$DashboardEntity {
  int? get notUploaded => throw _privateConstructorUsedError;
  int? get uploaded => throw _privateConstructorUsedError;
  int? get verified => throw _privateConstructorUsedError;

  /// Serializes this DashboardEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardEntityCopyWith<DashboardEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEntityCopyWith<$Res> {
  factory $DashboardEntityCopyWith(
          DashboardEntity value, $Res Function(DashboardEntity) then) =
      _$DashboardEntityCopyWithImpl<$Res, DashboardEntity>;
  @useResult
  $Res call({int? notUploaded, int? uploaded, int? verified});
}

/// @nodoc
class _$DashboardEntityCopyWithImpl<$Res, $Val extends DashboardEntity>
    implements $DashboardEntityCopyWith<$Res> {
  _$DashboardEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notUploaded = freezed,
    Object? uploaded = freezed,
    Object? verified = freezed,
  }) {
    return _then(_value.copyWith(
      notUploaded: freezed == notUploaded
          ? _value.notUploaded
          : notUploaded // ignore: cast_nullable_to_non_nullable
              as int?,
      uploaded: freezed == uploaded
          ? _value.uploaded
          : uploaded // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardEntityImplCopyWith<$Res>
    implements $DashboardEntityCopyWith<$Res> {
  factory _$$DashboardEntityImplCopyWith(_$DashboardEntityImpl value,
          $Res Function(_$DashboardEntityImpl) then) =
      __$$DashboardEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? notUploaded, int? uploaded, int? verified});
}

/// @nodoc
class __$$DashboardEntityImplCopyWithImpl<$Res>
    extends _$DashboardEntityCopyWithImpl<$Res, _$DashboardEntityImpl>
    implements _$$DashboardEntityImplCopyWith<$Res> {
  __$$DashboardEntityImplCopyWithImpl(
      _$DashboardEntityImpl _value, $Res Function(_$DashboardEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notUploaded = freezed,
    Object? uploaded = freezed,
    Object? verified = freezed,
  }) {
    return _then(_$DashboardEntityImpl(
      notUploaded: freezed == notUploaded
          ? _value.notUploaded
          : notUploaded // ignore: cast_nullable_to_non_nullable
              as int?,
      uploaded: freezed == uploaded
          ? _value.uploaded
          : uploaded // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DashboardEntityImpl implements _DashboardEntity {
  const _$DashboardEntityImpl({this.notUploaded, this.uploaded, this.verified});

  factory _$DashboardEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardEntityImplFromJson(json);

  @override
  final int? notUploaded;
  @override
  final int? uploaded;
  @override
  final int? verified;

  @override
  String toString() {
    return 'DashboardEntity(notUploaded: $notUploaded, uploaded: $uploaded, verified: $verified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardEntityImpl &&
            (identical(other.notUploaded, notUploaded) ||
                other.notUploaded == notUploaded) &&
            (identical(other.uploaded, uploaded) ||
                other.uploaded == uploaded) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notUploaded, uploaded, verified);

  /// Create a copy of DashboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardEntityImplCopyWith<_$DashboardEntityImpl> get copyWith =>
      __$$DashboardEntityImplCopyWithImpl<_$DashboardEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardEntityImplToJson(
      this,
    );
  }
}

abstract class _DashboardEntity implements DashboardEntity {
  const factory _DashboardEntity(
      {final int? notUploaded,
      final int? uploaded,
      final int? verified}) = _$DashboardEntityImpl;

  factory _DashboardEntity.fromJson(Map<String, dynamic> json) =
      _$DashboardEntityImpl.fromJson;

  @override
  int? get notUploaded;
  @override
  int? get uploaded;
  @override
  int? get verified;

  /// Create a copy of DashboardEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardEntityImplCopyWith<_$DashboardEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
