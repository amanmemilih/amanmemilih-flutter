// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocumentDetailState {
  DocumentDetailStatus get status => throw _privateConstructorUsedError;
  ErrorObject? get error => throw _privateConstructorUsedError;
  DetailDocumentEntity? get data => throw _privateConstructorUsedError;

  /// Create a copy of DocumentDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentDetailStateCopyWith<DocumentDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentDetailStateCopyWith<$Res> {
  factory $DocumentDetailStateCopyWith(
          DocumentDetailState value, $Res Function(DocumentDetailState) then) =
      _$DocumentDetailStateCopyWithImpl<$Res, DocumentDetailState>;
  @useResult
  $Res call(
      {DocumentDetailStatus status,
      ErrorObject? error,
      DetailDocumentEntity? data});

  $DetailDocumentEntityCopyWith<$Res>? get data;
}

/// @nodoc
class _$DocumentDetailStateCopyWithImpl<$Res, $Val extends DocumentDetailState>
    implements $DocumentDetailStateCopyWith<$Res> {
  _$DocumentDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentDetailStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailDocumentEntity?,
    ) as $Val);
  }

  /// Create a copy of DocumentDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailDocumentEntityCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DetailDocumentEntityCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DocumentDetailStateImplCopyWith<$Res>
    implements $DocumentDetailStateCopyWith<$Res> {
  factory _$$DocumentDetailStateImplCopyWith(_$DocumentDetailStateImpl value,
          $Res Function(_$DocumentDetailStateImpl) then) =
      __$$DocumentDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DocumentDetailStatus status,
      ErrorObject? error,
      DetailDocumentEntity? data});

  @override
  $DetailDocumentEntityCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DocumentDetailStateImplCopyWithImpl<$Res>
    extends _$DocumentDetailStateCopyWithImpl<$Res, _$DocumentDetailStateImpl>
    implements _$$DocumentDetailStateImplCopyWith<$Res> {
  __$$DocumentDetailStateImplCopyWithImpl(_$DocumentDetailStateImpl _value,
      $Res Function(_$DocumentDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_$DocumentDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentDetailStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailDocumentEntity?,
    ));
  }
}

/// @nodoc

class _$DocumentDetailStateImpl implements _DocumentDetailState {
  const _$DocumentDetailStateImpl(
      {required this.status, required this.error, this.data});

  @override
  final DocumentDetailStatus status;
  @override
  final ErrorObject? error;
  @override
  final DetailDocumentEntity? data;

  @override
  String toString() {
    return 'DocumentDetailState(status: $status, error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, data);

  /// Create a copy of DocumentDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentDetailStateImplCopyWith<_$DocumentDetailStateImpl> get copyWith =>
      __$$DocumentDetailStateImplCopyWithImpl<_$DocumentDetailStateImpl>(
          this, _$identity);
}

abstract class _DocumentDetailState implements DocumentDetailState {
  const factory _DocumentDetailState(
      {required final DocumentDetailStatus status,
      required final ErrorObject? error,
      final DetailDocumentEntity? data}) = _$DocumentDetailStateImpl;

  @override
  DocumentDetailStatus get status;
  @override
  ErrorObject? get error;
  @override
  DetailDocumentEntity? get data;

  /// Create a copy of DocumentDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentDetailStateImplCopyWith<_$DocumentDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
