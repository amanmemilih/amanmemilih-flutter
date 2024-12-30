// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_document_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadDocumentRequest _$UploadDocumentRequestFromJson(
    Map<String, dynamic> json) {
  return _UploadDocumentRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadDocumentRequest {
  String? get electionType => throw _privateConstructorUsedError;
  List<UploadDocumentVoteRequest>? get votes =>
      throw _privateConstructorUsedError;
  List<String>? get imagePaths => throw _privateConstructorUsedError;

  /// Serializes this UploadDocumentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadDocumentRequestCopyWith<UploadDocumentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadDocumentRequestCopyWith<$Res> {
  factory $UploadDocumentRequestCopyWith(UploadDocumentRequest value,
          $Res Function(UploadDocumentRequest) then) =
      _$UploadDocumentRequestCopyWithImpl<$Res, UploadDocumentRequest>;
  @useResult
  $Res call(
      {String? electionType,
      List<UploadDocumentVoteRequest>? votes,
      List<String>? imagePaths});
}

/// @nodoc
class _$UploadDocumentRequestCopyWithImpl<$Res,
        $Val extends UploadDocumentRequest>
    implements $UploadDocumentRequestCopyWith<$Res> {
  _$UploadDocumentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? electionType = freezed,
    Object? votes = freezed,
    Object? imagePaths = freezed,
  }) {
    return _then(_value.copyWith(
      electionType: freezed == electionType
          ? _value.electionType
          : electionType // ignore: cast_nullable_to_non_nullable
              as String?,
      votes: freezed == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<UploadDocumentVoteRequest>?,
      imagePaths: freezed == imagePaths
          ? _value.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadDocumentRequestImplCopyWith<$Res>
    implements $UploadDocumentRequestCopyWith<$Res> {
  factory _$$UploadDocumentRequestImplCopyWith(
          _$UploadDocumentRequestImpl value,
          $Res Function(_$UploadDocumentRequestImpl) then) =
      __$$UploadDocumentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? electionType,
      List<UploadDocumentVoteRequest>? votes,
      List<String>? imagePaths});
}

/// @nodoc
class __$$UploadDocumentRequestImplCopyWithImpl<$Res>
    extends _$UploadDocumentRequestCopyWithImpl<$Res,
        _$UploadDocumentRequestImpl>
    implements _$$UploadDocumentRequestImplCopyWith<$Res> {
  __$$UploadDocumentRequestImplCopyWithImpl(_$UploadDocumentRequestImpl _value,
      $Res Function(_$UploadDocumentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? electionType = freezed,
    Object? votes = freezed,
    Object? imagePaths = freezed,
  }) {
    return _then(_$UploadDocumentRequestImpl(
      electionType: freezed == electionType
          ? _value.electionType
          : electionType // ignore: cast_nullable_to_non_nullable
              as String?,
      votes: freezed == votes
          ? _value._votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<UploadDocumentVoteRequest>?,
      imagePaths: freezed == imagePaths
          ? _value._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UploadDocumentRequestImpl implements _UploadDocumentRequest {
  const _$UploadDocumentRequestImpl(
      {this.electionType,
      final List<UploadDocumentVoteRequest>? votes,
      final List<String>? imagePaths})
      : _votes = votes,
        _imagePaths = imagePaths;

  factory _$UploadDocumentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadDocumentRequestImplFromJson(json);

  @override
  final String? electionType;
  final List<UploadDocumentVoteRequest>? _votes;
  @override
  List<UploadDocumentVoteRequest>? get votes {
    final value = _votes;
    if (value == null) return null;
    if (_votes is EqualUnmodifiableListView) return _votes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _imagePaths;
  @override
  List<String>? get imagePaths {
    final value = _imagePaths;
    if (value == null) return null;
    if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UploadDocumentRequest(electionType: $electionType, votes: $votes, imagePaths: $imagePaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadDocumentRequestImpl &&
            (identical(other.electionType, electionType) ||
                other.electionType == electionType) &&
            const DeepCollectionEquality().equals(other._votes, _votes) &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      electionType,
      const DeepCollectionEquality().hash(_votes),
      const DeepCollectionEquality().hash(_imagePaths));

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadDocumentRequestImplCopyWith<_$UploadDocumentRequestImpl>
      get copyWith => __$$UploadDocumentRequestImplCopyWithImpl<
          _$UploadDocumentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadDocumentRequestImplToJson(
      this,
    );
  }
}

abstract class _UploadDocumentRequest implements UploadDocumentRequest {
  const factory _UploadDocumentRequest(
      {final String? electionType,
      final List<UploadDocumentVoteRequest>? votes,
      final List<String>? imagePaths}) = _$UploadDocumentRequestImpl;

  factory _UploadDocumentRequest.fromJson(Map<String, dynamic> json) =
      _$UploadDocumentRequestImpl.fromJson;

  @override
  String? get electionType;
  @override
  List<UploadDocumentVoteRequest>? get votes;
  @override
  List<String>? get imagePaths;

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadDocumentRequestImplCopyWith<_$UploadDocumentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UploadDocumentVoteRequest _$UploadDocumentVoteRequestFromJson(
    Map<String, dynamic> json) {
  return _UploadDocumentVoteRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadDocumentVoteRequest {
  int? get candidatId => throw _privateConstructorUsedError;
  int? get totalVotes => throw _privateConstructorUsedError;

  /// Serializes this UploadDocumentVoteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadDocumentVoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadDocumentVoteRequestCopyWith<UploadDocumentVoteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadDocumentVoteRequestCopyWith<$Res> {
  factory $UploadDocumentVoteRequestCopyWith(UploadDocumentVoteRequest value,
          $Res Function(UploadDocumentVoteRequest) then) =
      _$UploadDocumentVoteRequestCopyWithImpl<$Res, UploadDocumentVoteRequest>;
  @useResult
  $Res call({int? candidatId, int? totalVotes});
}

/// @nodoc
class _$UploadDocumentVoteRequestCopyWithImpl<$Res,
        $Val extends UploadDocumentVoteRequest>
    implements $UploadDocumentVoteRequestCopyWith<$Res> {
  _$UploadDocumentVoteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadDocumentVoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidatId = freezed,
    Object? totalVotes = freezed,
  }) {
    return _then(_value.copyWith(
      candidatId: freezed == candidatId
          ? _value.candidatId
          : candidatId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVotes: freezed == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadDocumentVoteRequestImplCopyWith<$Res>
    implements $UploadDocumentVoteRequestCopyWith<$Res> {
  factory _$$UploadDocumentVoteRequestImplCopyWith(
          _$UploadDocumentVoteRequestImpl value,
          $Res Function(_$UploadDocumentVoteRequestImpl) then) =
      __$$UploadDocumentVoteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? candidatId, int? totalVotes});
}

/// @nodoc
class __$$UploadDocumentVoteRequestImplCopyWithImpl<$Res>
    extends _$UploadDocumentVoteRequestCopyWithImpl<$Res,
        _$UploadDocumentVoteRequestImpl>
    implements _$$UploadDocumentVoteRequestImplCopyWith<$Res> {
  __$$UploadDocumentVoteRequestImplCopyWithImpl(
      _$UploadDocumentVoteRequestImpl _value,
      $Res Function(_$UploadDocumentVoteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadDocumentVoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidatId = freezed,
    Object? totalVotes = freezed,
  }) {
    return _then(_$UploadDocumentVoteRequestImpl(
      candidatId: freezed == candidatId
          ? _value.candidatId
          : candidatId // ignore: cast_nullable_to_non_nullable
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
class _$UploadDocumentVoteRequestImpl implements _UploadDocumentVoteRequest {
  const _$UploadDocumentVoteRequestImpl({this.candidatId, this.totalVotes});

  factory _$UploadDocumentVoteRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadDocumentVoteRequestImplFromJson(json);

  @override
  final int? candidatId;
  @override
  final int? totalVotes;

  @override
  String toString() {
    return 'UploadDocumentVoteRequest(candidatId: $candidatId, totalVotes: $totalVotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadDocumentVoteRequestImpl &&
            (identical(other.candidatId, candidatId) ||
                other.candidatId == candidatId) &&
            (identical(other.totalVotes, totalVotes) ||
                other.totalVotes == totalVotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, candidatId, totalVotes);

  /// Create a copy of UploadDocumentVoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadDocumentVoteRequestImplCopyWith<_$UploadDocumentVoteRequestImpl>
      get copyWith => __$$UploadDocumentVoteRequestImplCopyWithImpl<
          _$UploadDocumentVoteRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadDocumentVoteRequestImplToJson(
      this,
    );
  }
}

abstract class _UploadDocumentVoteRequest implements UploadDocumentVoteRequest {
  const factory _UploadDocumentVoteRequest(
      {final int? candidatId,
      final int? totalVotes}) = _$UploadDocumentVoteRequestImpl;

  factory _UploadDocumentVoteRequest.fromJson(Map<String, dynamic> json) =
      _$UploadDocumentVoteRequestImpl.fromJson;

  @override
  int? get candidatId;
  @override
  int? get totalVotes;

  /// Create a copy of UploadDocumentVoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadDocumentVoteRequestImplCopyWith<_$UploadDocumentVoteRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
