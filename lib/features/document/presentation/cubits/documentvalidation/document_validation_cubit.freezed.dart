// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_validation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocumentValidationState {
  DocumentValidationStatus get status => throw _privateConstructorUsedError;
  ErrorObject? get error => throw _privateConstructorUsedError;
  int get documentIndex => throw _privateConstructorUsedError;
  List<TextEditingController> get voteControllers =>
      throw _privateConstructorUsedError;
  String get electionType => throw _privateConstructorUsedError;
  List<PresidentialCandidatEntity>? get presidentialCandidats =>
      throw _privateConstructorUsedError;

  /// Create a copy of DocumentValidationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentValidationStateCopyWith<DocumentValidationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentValidationStateCopyWith<$Res> {
  factory $DocumentValidationStateCopyWith(DocumentValidationState value,
          $Res Function(DocumentValidationState) then) =
      _$DocumentValidationStateCopyWithImpl<$Res, DocumentValidationState>;
  @useResult
  $Res call(
      {DocumentValidationStatus status,
      ErrorObject? error,
      int documentIndex,
      List<TextEditingController> voteControllers,
      String electionType,
      List<PresidentialCandidatEntity>? presidentialCandidats});
}

/// @nodoc
class _$DocumentValidationStateCopyWithImpl<$Res,
        $Val extends DocumentValidationState>
    implements $DocumentValidationStateCopyWith<$Res> {
  _$DocumentValidationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentValidationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? documentIndex = null,
    Object? voteControllers = null,
    Object? electionType = null,
    Object? presidentialCandidats = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentValidationStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      documentIndex: null == documentIndex
          ? _value.documentIndex
          : documentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      voteControllers: null == voteControllers
          ? _value.voteControllers
          : voteControllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
      electionType: null == electionType
          ? _value.electionType
          : electionType // ignore: cast_nullable_to_non_nullable
              as String,
      presidentialCandidats: freezed == presidentialCandidats
          ? _value.presidentialCandidats
          : presidentialCandidats // ignore: cast_nullable_to_non_nullable
              as List<PresidentialCandidatEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentValidationStateImplCopyWith<$Res>
    implements $DocumentValidationStateCopyWith<$Res> {
  factory _$$DocumentValidationStateImplCopyWith(
          _$DocumentValidationStateImpl value,
          $Res Function(_$DocumentValidationStateImpl) then) =
      __$$DocumentValidationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DocumentValidationStatus status,
      ErrorObject? error,
      int documentIndex,
      List<TextEditingController> voteControllers,
      String electionType,
      List<PresidentialCandidatEntity>? presidentialCandidats});
}

/// @nodoc
class __$$DocumentValidationStateImplCopyWithImpl<$Res>
    extends _$DocumentValidationStateCopyWithImpl<$Res,
        _$DocumentValidationStateImpl>
    implements _$$DocumentValidationStateImplCopyWith<$Res> {
  __$$DocumentValidationStateImplCopyWithImpl(
      _$DocumentValidationStateImpl _value,
      $Res Function(_$DocumentValidationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentValidationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? documentIndex = null,
    Object? voteControllers = null,
    Object? electionType = null,
    Object? presidentialCandidats = freezed,
  }) {
    return _then(_$DocumentValidationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentValidationStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      documentIndex: null == documentIndex
          ? _value.documentIndex
          : documentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      voteControllers: null == voteControllers
          ? _value._voteControllers
          : voteControllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
      electionType: null == electionType
          ? _value.electionType
          : electionType // ignore: cast_nullable_to_non_nullable
              as String,
      presidentialCandidats: freezed == presidentialCandidats
          ? _value._presidentialCandidats
          : presidentialCandidats // ignore: cast_nullable_to_non_nullable
              as List<PresidentialCandidatEntity>?,
    ));
  }
}

/// @nodoc

class _$DocumentValidationStateImpl implements _DocumentValidationState {
  const _$DocumentValidationStateImpl(
      {required this.status,
      required this.error,
      required this.documentIndex,
      required final List<TextEditingController> voteControllers,
      required this.electionType,
      final List<PresidentialCandidatEntity>? presidentialCandidats})
      : _voteControllers = voteControllers,
        _presidentialCandidats = presidentialCandidats;

  @override
  final DocumentValidationStatus status;
  @override
  final ErrorObject? error;
  @override
  final int documentIndex;
  final List<TextEditingController> _voteControllers;
  @override
  List<TextEditingController> get voteControllers {
    if (_voteControllers is EqualUnmodifiableListView) return _voteControllers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voteControllers);
  }

  @override
  final String electionType;
  final List<PresidentialCandidatEntity>? _presidentialCandidats;
  @override
  List<PresidentialCandidatEntity>? get presidentialCandidats {
    final value = _presidentialCandidats;
    if (value == null) return null;
    if (_presidentialCandidats is EqualUnmodifiableListView)
      return _presidentialCandidats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DocumentValidationState(status: $status, error: $error, documentIndex: $documentIndex, voteControllers: $voteControllers, electionType: $electionType, presidentialCandidats: $presidentialCandidats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentValidationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.documentIndex, documentIndex) ||
                other.documentIndex == documentIndex) &&
            const DeepCollectionEquality()
                .equals(other._voteControllers, _voteControllers) &&
            (identical(other.electionType, electionType) ||
                other.electionType == electionType) &&
            const DeepCollectionEquality()
                .equals(other._presidentialCandidats, _presidentialCandidats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      error,
      documentIndex,
      const DeepCollectionEquality().hash(_voteControllers),
      electionType,
      const DeepCollectionEquality().hash(_presidentialCandidats));

  /// Create a copy of DocumentValidationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentValidationStateImplCopyWith<_$DocumentValidationStateImpl>
      get copyWith => __$$DocumentValidationStateImplCopyWithImpl<
          _$DocumentValidationStateImpl>(this, _$identity);
}

abstract class _DocumentValidationState implements DocumentValidationState {
  const factory _DocumentValidationState(
          {required final DocumentValidationStatus status,
          required final ErrorObject? error,
          required final int documentIndex,
          required final List<TextEditingController> voteControllers,
          required final String electionType,
          final List<PresidentialCandidatEntity>? presidentialCandidats}) =
      _$DocumentValidationStateImpl;

  @override
  DocumentValidationStatus get status;
  @override
  ErrorObject? get error;
  @override
  int get documentIndex;
  @override
  List<TextEditingController> get voteControllers;
  @override
  String get electionType;
  @override
  List<PresidentialCandidatEntity>? get presidentialCandidats;

  /// Create a copy of DocumentValidationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentValidationStateImplCopyWith<_$DocumentValidationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
