// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentListEntity _$DocumentListEntityFromJson(Map<String, dynamic> json) {
  return _DocumentListEntity.fromJson(json);
}

/// @nodoc
mixin _$DocumentListEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get electionType => throw _privateConstructorUsedError;

  /// Serializes this DocumentListEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentListEntityCopyWith<DocumentListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentListEntityCopyWith<$Res> {
  factory $DocumentListEntityCopyWith(
          DocumentListEntity value, $Res Function(DocumentListEntity) then) =
      _$DocumentListEntityCopyWithImpl<$Res, DocumentListEntity>;
  @useResult
  $Res call({int? id, String? name, int? status, String? electionType});
}

/// @nodoc
class _$DocumentListEntityCopyWithImpl<$Res, $Val extends DocumentListEntity>
    implements $DocumentListEntityCopyWith<$Res> {
  _$DocumentListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? electionType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      electionType: freezed == electionType
          ? _value.electionType
          : electionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentListEntityImplCopyWith<$Res>
    implements $DocumentListEntityCopyWith<$Res> {
  factory _$$DocumentListEntityImplCopyWith(_$DocumentListEntityImpl value,
          $Res Function(_$DocumentListEntityImpl) then) =
      __$$DocumentListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, int? status, String? electionType});
}

/// @nodoc
class __$$DocumentListEntityImplCopyWithImpl<$Res>
    extends _$DocumentListEntityCopyWithImpl<$Res, _$DocumentListEntityImpl>
    implements _$$DocumentListEntityImplCopyWith<$Res> {
  __$$DocumentListEntityImplCopyWithImpl(_$DocumentListEntityImpl _value,
      $Res Function(_$DocumentListEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? electionType = freezed,
  }) {
    return _then(_$DocumentListEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      electionType: freezed == electionType
          ? _value.electionType
          : electionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DocumentListEntityImpl implements _DocumentListEntity {
  const _$DocumentListEntityImpl(
      {this.id, this.name, this.status, this.electionType});

  factory _$DocumentListEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentListEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? status;
  @override
  final String? electionType;

  @override
  String toString() {
    return 'DocumentListEntity(id: $id, name: $name, status: $status, electionType: $electionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentListEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.electionType, electionType) ||
                other.electionType == electionType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status, electionType);

  /// Create a copy of DocumentListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentListEntityImplCopyWith<_$DocumentListEntityImpl> get copyWith =>
      __$$DocumentListEntityImplCopyWithImpl<_$DocumentListEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentListEntityImplToJson(
      this,
    );
  }
}

abstract class _DocumentListEntity implements DocumentListEntity {
  const factory _DocumentListEntity(
      {final int? id,
      final String? name,
      final int? status,
      final String? electionType}) = _$DocumentListEntityImpl;

  factory _DocumentListEntity.fromJson(Map<String, dynamic> json) =
      _$DocumentListEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get status;
  @override
  String? get electionType;

  /// Create a copy of DocumentListEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentListEntityImplCopyWith<_$DocumentListEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
