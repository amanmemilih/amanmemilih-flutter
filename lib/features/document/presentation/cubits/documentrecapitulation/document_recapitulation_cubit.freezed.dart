// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_recapitulation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocumentRecapitulationState {
  DocumentRecapitulationStatus get status => throw _privateConstructorUsedError;
  ErrorObject? get error => throw _privateConstructorUsedError;
  int get documentIndex => throw _privateConstructorUsedError;

  /// Create a copy of DocumentRecapitulationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentRecapitulationStateCopyWith<DocumentRecapitulationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentRecapitulationStateCopyWith<$Res> {
  factory $DocumentRecapitulationStateCopyWith(
          DocumentRecapitulationState value,
          $Res Function(DocumentRecapitulationState) then) =
      _$DocumentRecapitulationStateCopyWithImpl<$Res,
          DocumentRecapitulationState>;
  @useResult
  $Res call(
      {DocumentRecapitulationStatus status,
      ErrorObject? error,
      int documentIndex});
}

/// @nodoc
class _$DocumentRecapitulationStateCopyWithImpl<$Res,
        $Val extends DocumentRecapitulationState>
    implements $DocumentRecapitulationStateCopyWith<$Res> {
  _$DocumentRecapitulationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentRecapitulationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? documentIndex = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentRecapitulationStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      documentIndex: null == documentIndex
          ? _value.documentIndex
          : documentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentRecapitulationStateImplCopyWith<$Res>
    implements $DocumentRecapitulationStateCopyWith<$Res> {
  factory _$$DocumentRecapitulationStateImplCopyWith(
          _$DocumentRecapitulationStateImpl value,
          $Res Function(_$DocumentRecapitulationStateImpl) then) =
      __$$DocumentRecapitulationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DocumentRecapitulationStatus status,
      ErrorObject? error,
      int documentIndex});
}

/// @nodoc
class __$$DocumentRecapitulationStateImplCopyWithImpl<$Res>
    extends _$DocumentRecapitulationStateCopyWithImpl<$Res,
        _$DocumentRecapitulationStateImpl>
    implements _$$DocumentRecapitulationStateImplCopyWith<$Res> {
  __$$DocumentRecapitulationStateImplCopyWithImpl(
      _$DocumentRecapitulationStateImpl _value,
      $Res Function(_$DocumentRecapitulationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentRecapitulationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? documentIndex = null,
  }) {
    return _then(_$DocumentRecapitulationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentRecapitulationStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      documentIndex: null == documentIndex
          ? _value.documentIndex
          : documentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DocumentRecapitulationStateImpl
    implements _DocumentRecapitulationState {
  const _$DocumentRecapitulationStateImpl(
      {required this.status, required this.error, required this.documentIndex});

  @override
  final DocumentRecapitulationStatus status;
  @override
  final ErrorObject? error;
  @override
  final int documentIndex;

  @override
  String toString() {
    return 'DocumentRecapitulationState(status: $status, error: $error, documentIndex: $documentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentRecapitulationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.documentIndex, documentIndex) ||
                other.documentIndex == documentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, documentIndex);

  /// Create a copy of DocumentRecapitulationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentRecapitulationStateImplCopyWith<_$DocumentRecapitulationStateImpl>
      get copyWith => __$$DocumentRecapitulationStateImplCopyWithImpl<
          _$DocumentRecapitulationStateImpl>(this, _$identity);
}

abstract class _DocumentRecapitulationState
    implements DocumentRecapitulationState {
  const factory _DocumentRecapitulationState(
      {required final DocumentRecapitulationStatus status,
      required final ErrorObject? error,
      required final int documentIndex}) = _$DocumentRecapitulationStateImpl;

  @override
  DocumentRecapitulationStatus get status;
  @override
  ErrorObject? get error;
  @override
  int get documentIndex;

  /// Create a copy of DocumentRecapitulationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentRecapitulationStateImplCopyWith<_$DocumentRecapitulationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
