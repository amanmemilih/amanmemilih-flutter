// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presidential_candidat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PresidentialCandidatEntity _$PresidentialCandidatEntityFromJson(
    Map<String, dynamic> json) {
  return _PresidentialCandidatEntity.fromJson(json);
}

/// @nodoc
mixin _$PresidentialCandidatEntity {
  int? get id => throw _privateConstructorUsedError;
  int? get no => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this PresidentialCandidatEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PresidentialCandidatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PresidentialCandidatEntityCopyWith<PresidentialCandidatEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresidentialCandidatEntityCopyWith<$Res> {
  factory $PresidentialCandidatEntityCopyWith(PresidentialCandidatEntity value,
          $Res Function(PresidentialCandidatEntity) then) =
      _$PresidentialCandidatEntityCopyWithImpl<$Res,
          PresidentialCandidatEntity>;
  @useResult
  $Res call({int? id, int? no, String? name});
}

/// @nodoc
class _$PresidentialCandidatEntityCopyWithImpl<$Res,
        $Val extends PresidentialCandidatEntity>
    implements $PresidentialCandidatEntityCopyWith<$Res> {
  _$PresidentialCandidatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PresidentialCandidatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? no = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      no: freezed == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PresidentialCandidatEntityImplCopyWith<$Res>
    implements $PresidentialCandidatEntityCopyWith<$Res> {
  factory _$$PresidentialCandidatEntityImplCopyWith(
          _$PresidentialCandidatEntityImpl value,
          $Res Function(_$PresidentialCandidatEntityImpl) then) =
      __$$PresidentialCandidatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? no, String? name});
}

/// @nodoc
class __$$PresidentialCandidatEntityImplCopyWithImpl<$Res>
    extends _$PresidentialCandidatEntityCopyWithImpl<$Res,
        _$PresidentialCandidatEntityImpl>
    implements _$$PresidentialCandidatEntityImplCopyWith<$Res> {
  __$$PresidentialCandidatEntityImplCopyWithImpl(
      _$PresidentialCandidatEntityImpl _value,
      $Res Function(_$PresidentialCandidatEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresidentialCandidatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? no = freezed,
    Object? name = freezed,
  }) {
    return _then(_$PresidentialCandidatEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      no: freezed == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PresidentialCandidatEntityImpl implements _PresidentialCandidatEntity {
  const _$PresidentialCandidatEntityImpl({this.id, this.no, this.name});

  factory _$PresidentialCandidatEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PresidentialCandidatEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final int? no;
  @override
  final String? name;

  @override
  String toString() {
    return 'PresidentialCandidatEntity(id: $id, no: $no, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresidentialCandidatEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, no, name);

  /// Create a copy of PresidentialCandidatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PresidentialCandidatEntityImplCopyWith<_$PresidentialCandidatEntityImpl>
      get copyWith => __$$PresidentialCandidatEntityImplCopyWithImpl<
          _$PresidentialCandidatEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresidentialCandidatEntityImplToJson(
      this,
    );
  }
}

abstract class _PresidentialCandidatEntity
    implements PresidentialCandidatEntity {
  const factory _PresidentialCandidatEntity(
      {final int? id,
      final int? no,
      final String? name}) = _$PresidentialCandidatEntityImpl;

  factory _PresidentialCandidatEntity.fromJson(Map<String, dynamic> json) =
      _$PresidentialCandidatEntityImpl.fromJson;

  @override
  int? get id;
  @override
  int? get no;
  @override
  String? get name;

  /// Create a copy of PresidentialCandidatEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PresidentialCandidatEntityImplCopyWith<_$PresidentialCandidatEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
