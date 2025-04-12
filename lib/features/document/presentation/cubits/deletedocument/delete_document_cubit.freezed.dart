// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_document_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteDocumentState {
  DeleteDocumentStatus get status => throw _privateConstructorUsedError;
  ErrorObject? get error => throw _privateConstructorUsedError;

  /// Create a copy of DeleteDocumentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteDocumentStateCopyWith<DeleteDocumentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteDocumentStateCopyWith<$Res> {
  factory $DeleteDocumentStateCopyWith(
          DeleteDocumentState value, $Res Function(DeleteDocumentState) then) =
      _$DeleteDocumentStateCopyWithImpl<$Res, DeleteDocumentState>;
  @useResult
  $Res call({DeleteDocumentStatus status, ErrorObject? error});
}

/// @nodoc
class _$DeleteDocumentStateCopyWithImpl<$Res, $Val extends DeleteDocumentState>
    implements $DeleteDocumentStateCopyWith<$Res> {
  _$DeleteDocumentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteDocumentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeleteDocumentStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteDocumentStateImplCopyWith<$Res>
    implements $DeleteDocumentStateCopyWith<$Res> {
  factory _$$DeleteDocumentStateImplCopyWith(_$DeleteDocumentStateImpl value,
          $Res Function(_$DeleteDocumentStateImpl) then) =
      __$$DeleteDocumentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DeleteDocumentStatus status, ErrorObject? error});
}

/// @nodoc
class __$$DeleteDocumentStateImplCopyWithImpl<$Res>
    extends _$DeleteDocumentStateCopyWithImpl<$Res, _$DeleteDocumentStateImpl>
    implements _$$DeleteDocumentStateImplCopyWith<$Res> {
  __$$DeleteDocumentStateImplCopyWithImpl(_$DeleteDocumentStateImpl _value,
      $Res Function(_$DeleteDocumentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteDocumentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$DeleteDocumentStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeleteDocumentStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
    ));
  }
}

/// @nodoc

class _$DeleteDocumentStateImpl implements _DeleteDocumentState {
  const _$DeleteDocumentStateImpl({required this.status, required this.error});

  @override
  final DeleteDocumentStatus status;
  @override
  final ErrorObject? error;

  @override
  String toString() {
    return 'DeleteDocumentState(status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteDocumentStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  /// Create a copy of DeleteDocumentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteDocumentStateImplCopyWith<_$DeleteDocumentStateImpl> get copyWith =>
      __$$DeleteDocumentStateImplCopyWithImpl<_$DeleteDocumentStateImpl>(
          this, _$identity);
}

abstract class _DeleteDocumentState implements DeleteDocumentState {
  const factory _DeleteDocumentState(
      {required final DeleteDocumentStatus status,
      required final ErrorObject? error}) = _$DeleteDocumentStateImpl;

  @override
  DeleteDocumentStatus get status;
  @override
  ErrorObject? get error;

  /// Create a copy of DeleteDocumentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteDocumentStateImplCopyWith<_$DeleteDocumentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
