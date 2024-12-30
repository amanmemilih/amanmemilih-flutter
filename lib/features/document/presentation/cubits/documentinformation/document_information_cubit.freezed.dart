// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_information_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocumentInformationState {
  DocumentInformationStatus get status => throw _privateConstructorUsedError;
  ErrorObject? get error => throw _privateConstructorUsedError;
  List<DocumentListEntity>? get data => throw _privateConstructorUsedError;

  /// Create a copy of DocumentInformationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentInformationStateCopyWith<DocumentInformationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentInformationStateCopyWith<$Res> {
  factory $DocumentInformationStateCopyWith(DocumentInformationState value,
          $Res Function(DocumentInformationState) then) =
      _$DocumentInformationStateCopyWithImpl<$Res, DocumentInformationState>;
  @useResult
  $Res call(
      {DocumentInformationStatus status,
      ErrorObject? error,
      List<DocumentListEntity>? data});
}

/// @nodoc
class _$DocumentInformationStateCopyWithImpl<$Res,
        $Val extends DocumentInformationState>
    implements $DocumentInformationStateCopyWith<$Res> {
  _$DocumentInformationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentInformationState
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
              as DocumentInformationStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DocumentListEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentInformationStateImplCopyWith<$Res>
    implements $DocumentInformationStateCopyWith<$Res> {
  factory _$$DocumentInformationStateImplCopyWith(
          _$DocumentInformationStateImpl value,
          $Res Function(_$DocumentInformationStateImpl) then) =
      __$$DocumentInformationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DocumentInformationStatus status,
      ErrorObject? error,
      List<DocumentListEntity>? data});
}

/// @nodoc
class __$$DocumentInformationStateImplCopyWithImpl<$Res>
    extends _$DocumentInformationStateCopyWithImpl<$Res,
        _$DocumentInformationStateImpl>
    implements _$$DocumentInformationStateImplCopyWith<$Res> {
  __$$DocumentInformationStateImplCopyWithImpl(
      _$DocumentInformationStateImpl _value,
      $Res Function(_$DocumentInformationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentInformationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_$DocumentInformationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DocumentInformationStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DocumentListEntity>?,
    ));
  }
}

/// @nodoc

class _$DocumentInformationStateImpl implements _DocumentInformationState {
  const _$DocumentInformationStateImpl(
      {required this.status,
      required this.error,
      final List<DocumentListEntity>? data})
      : _data = data;

  @override
  final DocumentInformationStatus status;
  @override
  final ErrorObject? error;
  final List<DocumentListEntity>? _data;
  @override
  List<DocumentListEntity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DocumentInformationState(status: $status, error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentInformationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, error, const DeepCollectionEquality().hash(_data));

  /// Create a copy of DocumentInformationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentInformationStateImplCopyWith<_$DocumentInformationStateImpl>
      get copyWith => __$$DocumentInformationStateImplCopyWithImpl<
          _$DocumentInformationStateImpl>(this, _$identity);
}

abstract class _DocumentInformationState implements DocumentInformationState {
  const factory _DocumentInformationState(
      {required final DocumentInformationStatus status,
      required final ErrorObject? error,
      final List<DocumentListEntity>? data}) = _$DocumentInformationStateImpl;

  @override
  DocumentInformationStatus get status;
  @override
  ErrorObject? get error;
  @override
  List<DocumentListEntity>? get data;

  /// Create a copy of DocumentInformationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentInformationStateImplCopyWith<_$DocumentInformationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
