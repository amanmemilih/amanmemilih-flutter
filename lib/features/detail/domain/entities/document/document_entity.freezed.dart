// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentEntity _$DocumentEntityFromJson(Map<String, dynamic> json) {
  return _DocumentEntity.fromJson(json);
}

/// @nodoc
mixin _$DocumentEntity {
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this DocumentEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentEntityCopyWith<DocumentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentEntityCopyWith<$Res> {
  factory $DocumentEntityCopyWith(
          DocumentEntity value, $Res Function(DocumentEntity) then) =
      _$DocumentEntityCopyWithImpl<$Res, DocumentEntity>;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class _$DocumentEntityCopyWithImpl<$Res, $Val extends DocumentEntity>
    implements $DocumentEntityCopyWith<$Res> {
  _$DocumentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentEntityImplCopyWith<$Res>
    implements $DocumentEntityCopyWith<$Res> {
  factory _$$DocumentEntityImplCopyWith(_$DocumentEntityImpl value,
          $Res Function(_$DocumentEntityImpl) then) =
      __$$DocumentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id});
}

/// @nodoc
class __$$DocumentEntityImplCopyWithImpl<$Res>
    extends _$DocumentEntityCopyWithImpl<$Res, _$DocumentEntityImpl>
    implements _$$DocumentEntityImplCopyWith<$Res> {
  __$$DocumentEntityImplCopyWithImpl(
      _$DocumentEntityImpl _value, $Res Function(_$DocumentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$DocumentEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DocumentEntityImpl implements _DocumentEntity {
  const _$DocumentEntityImpl({this.id});

  factory _$DocumentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentEntityImplFromJson(json);

  @override
  final int? id;

  @override
  String toString() {
    return 'DocumentEntity(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentEntityImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentEntityImplCopyWith<_$DocumentEntityImpl> get copyWith =>
      __$$DocumentEntityImplCopyWithImpl<_$DocumentEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentEntityImplToJson(
      this,
    );
  }
}

abstract class _DocumentEntity implements DocumentEntity {
  const factory _DocumentEntity({final int? id}) = _$DocumentEntityImpl;

  factory _DocumentEntity.fromJson(Map<String, dynamic> json) =
      _$DocumentEntityImpl.fromJson;

  @override
  int? get id;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentEntityImplCopyWith<_$DocumentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
