// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_document_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailDocumentEntity _$DetailDocumentEntityFromJson(Map<String, dynamic> json) {
  return _DetailDocumentEntity.fromJson(json);
}

/// @nodoc
mixin _$DetailDocumentEntity {
  int? get status => throw _privateConstructorUsedError;
  String? get electionType => throw _privateConstructorUsedError;
  List<DetailDocumentVotesEntity>? get votes =>
      throw _privateConstructorUsedError;
  List<String>? get documents => throw _privateConstructorUsedError;

  /// Serializes this DetailDocumentEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailDocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailDocumentEntityCopyWith<DetailDocumentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailDocumentEntityCopyWith<$Res> {
  factory $DetailDocumentEntityCopyWith(DetailDocumentEntity value,
          $Res Function(DetailDocumentEntity) then) =
      _$DetailDocumentEntityCopyWithImpl<$Res, DetailDocumentEntity>;
  @useResult
  $Res call(
      {int? status,
      String? electionType,
      List<DetailDocumentVotesEntity>? votes,
      List<String>? documents});
}

/// @nodoc
class _$DetailDocumentEntityCopyWithImpl<$Res,
        $Val extends DetailDocumentEntity>
    implements $DetailDocumentEntityCopyWith<$Res> {
  _$DetailDocumentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailDocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? electionType = freezed,
    Object? votes = freezed,
    Object? documents = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      electionType: freezed == electionType
          ? _value.electionType
          : electionType // ignore: cast_nullable_to_non_nullable
              as String?,
      votes: freezed == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<DetailDocumentVotesEntity>?,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailDocumentEntityImplCopyWith<$Res>
    implements $DetailDocumentEntityCopyWith<$Res> {
  factory _$$DetailDocumentEntityImplCopyWith(_$DetailDocumentEntityImpl value,
          $Res Function(_$DetailDocumentEntityImpl) then) =
      __$$DetailDocumentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      String? electionType,
      List<DetailDocumentVotesEntity>? votes,
      List<String>? documents});
}

/// @nodoc
class __$$DetailDocumentEntityImplCopyWithImpl<$Res>
    extends _$DetailDocumentEntityCopyWithImpl<$Res, _$DetailDocumentEntityImpl>
    implements _$$DetailDocumentEntityImplCopyWith<$Res> {
  __$$DetailDocumentEntityImplCopyWithImpl(_$DetailDocumentEntityImpl _value,
      $Res Function(_$DetailDocumentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailDocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? electionType = freezed,
    Object? votes = freezed,
    Object? documents = freezed,
  }) {
    return _then(_$DetailDocumentEntityImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      electionType: freezed == electionType
          ? _value.electionType
          : electionType // ignore: cast_nullable_to_non_nullable
              as String?,
      votes: freezed == votes
          ? _value._votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<DetailDocumentVotesEntity>?,
      documents: freezed == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DetailDocumentEntityImpl implements _DetailDocumentEntity {
  const _$DetailDocumentEntityImpl(
      {this.status,
      this.electionType,
      final List<DetailDocumentVotesEntity>? votes,
      final List<String>? documents})
      : _votes = votes,
        _documents = documents;

  factory _$DetailDocumentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailDocumentEntityImplFromJson(json);

  @override
  final int? status;
  @override
  final String? electionType;
  final List<DetailDocumentVotesEntity>? _votes;
  @override
  List<DetailDocumentVotesEntity>? get votes {
    final value = _votes;
    if (value == null) return null;
    if (_votes is EqualUnmodifiableListView) return _votes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _documents;
  @override
  List<String>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DetailDocumentEntity(status: $status, electionType: $electionType, votes: $votes, documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailDocumentEntityImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.electionType, electionType) ||
                other.electionType == electionType) &&
            const DeepCollectionEquality().equals(other._votes, _votes) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      electionType,
      const DeepCollectionEquality().hash(_votes),
      const DeepCollectionEquality().hash(_documents));

  /// Create a copy of DetailDocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailDocumentEntityImplCopyWith<_$DetailDocumentEntityImpl>
      get copyWith =>
          __$$DetailDocumentEntityImplCopyWithImpl<_$DetailDocumentEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailDocumentEntityImplToJson(
      this,
    );
  }
}

abstract class _DetailDocumentEntity implements DetailDocumentEntity {
  const factory _DetailDocumentEntity(
      {final int? status,
      final String? electionType,
      final List<DetailDocumentVotesEntity>? votes,
      final List<String>? documents}) = _$DetailDocumentEntityImpl;

  factory _DetailDocumentEntity.fromJson(Map<String, dynamic> json) =
      _$DetailDocumentEntityImpl.fromJson;

  @override
  int? get status;
  @override
  String? get electionType;
  @override
  List<DetailDocumentVotesEntity>? get votes;
  @override
  List<String>? get documents;

  /// Create a copy of DetailDocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailDocumentEntityImplCopyWith<_$DetailDocumentEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailDocumentVotesEntity _$DetailDocumentVotesEntityFromJson(
    Map<String, dynamic> json) {
  return _DetailDocumentVotesEntity.fromJson(json);
}

/// @nodoc
mixin _$DetailDocumentVotesEntity {
  String? get candidatName => throw _privateConstructorUsedError;
  int? get candidatNo => throw _privateConstructorUsedError;
  int? get totalVotes => throw _privateConstructorUsedError;

  /// Serializes this DetailDocumentVotesEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailDocumentVotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailDocumentVotesEntityCopyWith<DetailDocumentVotesEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailDocumentVotesEntityCopyWith<$Res> {
  factory $DetailDocumentVotesEntityCopyWith(DetailDocumentVotesEntity value,
          $Res Function(DetailDocumentVotesEntity) then) =
      _$DetailDocumentVotesEntityCopyWithImpl<$Res, DetailDocumentVotesEntity>;
  @useResult
  $Res call({String? candidatName, int? candidatNo, int? totalVotes});
}

/// @nodoc
class _$DetailDocumentVotesEntityCopyWithImpl<$Res,
        $Val extends DetailDocumentVotesEntity>
    implements $DetailDocumentVotesEntityCopyWith<$Res> {
  _$DetailDocumentVotesEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailDocumentVotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidatName = freezed,
    Object? candidatNo = freezed,
    Object? totalVotes = freezed,
  }) {
    return _then(_value.copyWith(
      candidatName: freezed == candidatName
          ? _value.candidatName
          : candidatName // ignore: cast_nullable_to_non_nullable
              as String?,
      candidatNo: freezed == candidatNo
          ? _value.candidatNo
          : candidatNo // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVotes: freezed == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailDocumentVotesEntityImplCopyWith<$Res>
    implements $DetailDocumentVotesEntityCopyWith<$Res> {
  factory _$$DetailDocumentVotesEntityImplCopyWith(
          _$DetailDocumentVotesEntityImpl value,
          $Res Function(_$DetailDocumentVotesEntityImpl) then) =
      __$$DetailDocumentVotesEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? candidatName, int? candidatNo, int? totalVotes});
}

/// @nodoc
class __$$DetailDocumentVotesEntityImplCopyWithImpl<$Res>
    extends _$DetailDocumentVotesEntityCopyWithImpl<$Res,
        _$DetailDocumentVotesEntityImpl>
    implements _$$DetailDocumentVotesEntityImplCopyWith<$Res> {
  __$$DetailDocumentVotesEntityImplCopyWithImpl(
      _$DetailDocumentVotesEntityImpl _value,
      $Res Function(_$DetailDocumentVotesEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailDocumentVotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidatName = freezed,
    Object? candidatNo = freezed,
    Object? totalVotes = freezed,
  }) {
    return _then(_$DetailDocumentVotesEntityImpl(
      candidatName: freezed == candidatName
          ? _value.candidatName
          : candidatName // ignore: cast_nullable_to_non_nullable
              as String?,
      candidatNo: freezed == candidatNo
          ? _value.candidatNo
          : candidatNo // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVotes: freezed == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DetailDocumentVotesEntityImpl implements _DetailDocumentVotesEntity {
  const _$DetailDocumentVotesEntityImpl(
      {this.candidatName, this.candidatNo, this.totalVotes});

  factory _$DetailDocumentVotesEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailDocumentVotesEntityImplFromJson(json);

  @override
  final String? candidatName;
  @override
  final int? candidatNo;
  @override
  final int? totalVotes;

  @override
  String toString() {
    return 'DetailDocumentVotesEntity(candidatName: $candidatName, candidatNo: $candidatNo, totalVotes: $totalVotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailDocumentVotesEntityImpl &&
            (identical(other.candidatName, candidatName) ||
                other.candidatName == candidatName) &&
            (identical(other.candidatNo, candidatNo) ||
                other.candidatNo == candidatNo) &&
            (identical(other.totalVotes, totalVotes) ||
                other.totalVotes == totalVotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, candidatName, candidatNo, totalVotes);

  /// Create a copy of DetailDocumentVotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailDocumentVotesEntityImplCopyWith<_$DetailDocumentVotesEntityImpl>
      get copyWith => __$$DetailDocumentVotesEntityImplCopyWithImpl<
          _$DetailDocumentVotesEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailDocumentVotesEntityImplToJson(
      this,
    );
  }
}

abstract class _DetailDocumentVotesEntity implements DetailDocumentVotesEntity {
  const factory _DetailDocumentVotesEntity(
      {final String? candidatName,
      final int? candidatNo,
      final int? totalVotes}) = _$DetailDocumentVotesEntityImpl;

  factory _DetailDocumentVotesEntity.fromJson(Map<String, dynamic> json) =
      _$DetailDocumentVotesEntityImpl.fromJson;

  @override
  String? get candidatName;
  @override
  int? get candidatNo;
  @override
  int? get totalVotes;

  /// Create a copy of DetailDocumentVotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailDocumentVotesEntityImplCopyWith<_$DetailDocumentVotesEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
