// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraState {
  CameraController? get controller => throw _privateConstructorUsedError;
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get isFlashOn => throw _privateConstructorUsedError;
  List<File> get capturedImages => throw _privateConstructorUsedError;
  bool get permissionsGranted => throw _privateConstructorUsedError;

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CameraStateCopyWith<CameraState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res, CameraState>;
  @useResult
  $Res call(
      {CameraController? controller,
      bool isInitialized,
      bool isFlashOn,
      List<File> capturedImages,
      bool permissionsGranted});
}

/// @nodoc
class _$CameraStateCopyWithImpl<$Res, $Val extends CameraState>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? isInitialized = null,
    Object? isFlashOn = null,
    Object? capturedImages = null,
    Object? permissionsGranted = null,
  }) {
    return _then(_value.copyWith(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlashOn: null == isFlashOn
          ? _value.isFlashOn
          : isFlashOn // ignore: cast_nullable_to_non_nullable
              as bool,
      capturedImages: null == capturedImages
          ? _value.capturedImages
          : capturedImages // ignore: cast_nullable_to_non_nullable
              as List<File>,
      permissionsGranted: null == permissionsGranted
          ? _value.permissionsGranted
          : permissionsGranted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraStateImplCopyWith<$Res>
    implements $CameraStateCopyWith<$Res> {
  factory _$$CameraStateImplCopyWith(
          _$CameraStateImpl value, $Res Function(_$CameraStateImpl) then) =
      __$$CameraStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CameraController? controller,
      bool isInitialized,
      bool isFlashOn,
      List<File> capturedImages,
      bool permissionsGranted});
}

/// @nodoc
class __$$CameraStateImplCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$CameraStateImpl>
    implements _$$CameraStateImplCopyWith<$Res> {
  __$$CameraStateImplCopyWithImpl(
      _$CameraStateImpl _value, $Res Function(_$CameraStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? isInitialized = null,
    Object? isFlashOn = null,
    Object? capturedImages = null,
    Object? permissionsGranted = null,
  }) {
    return _then(_$CameraStateImpl(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlashOn: null == isFlashOn
          ? _value.isFlashOn
          : isFlashOn // ignore: cast_nullable_to_non_nullable
              as bool,
      capturedImages: null == capturedImages
          ? _value._capturedImages
          : capturedImages // ignore: cast_nullable_to_non_nullable
              as List<File>,
      permissionsGranted: null == permissionsGranted
          ? _value.permissionsGranted
          : permissionsGranted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CameraStateImpl implements _CameraState {
  const _$CameraStateImpl(
      {this.controller,
      this.isInitialized = false,
      this.isFlashOn = false,
      final List<File> capturedImages = const <File>[],
      this.permissionsGranted = false})
      : _capturedImages = capturedImages;

  @override
  final CameraController? controller;
  @override
  @JsonKey()
  final bool isInitialized;
  @override
  @JsonKey()
  final bool isFlashOn;
  final List<File> _capturedImages;
  @override
  @JsonKey()
  List<File> get capturedImages {
    if (_capturedImages is EqualUnmodifiableListView) return _capturedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capturedImages);
  }

  @override
  @JsonKey()
  final bool permissionsGranted;

  @override
  String toString() {
    return 'CameraState(controller: $controller, isInitialized: $isInitialized, isFlashOn: $isFlashOn, capturedImages: $capturedImages, permissionsGranted: $permissionsGranted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraStateImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isFlashOn, isFlashOn) ||
                other.isFlashOn == isFlashOn) &&
            const DeepCollectionEquality()
                .equals(other._capturedImages, _capturedImages) &&
            (identical(other.permissionsGranted, permissionsGranted) ||
                other.permissionsGranted == permissionsGranted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      controller,
      isInitialized,
      isFlashOn,
      const DeepCollectionEquality().hash(_capturedImages),
      permissionsGranted);

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraStateImplCopyWith<_$CameraStateImpl> get copyWith =>
      __$$CameraStateImplCopyWithImpl<_$CameraStateImpl>(this, _$identity);
}

abstract class _CameraState implements CameraState {
  const factory _CameraState(
      {final CameraController? controller,
      final bool isInitialized,
      final bool isFlashOn,
      final List<File> capturedImages,
      final bool permissionsGranted}) = _$CameraStateImpl;

  @override
  CameraController? get controller;
  @override
  bool get isInitialized;
  @override
  bool get isFlashOn;
  @override
  List<File> get capturedImages;
  @override
  bool get permissionsGranted;

  /// Create a copy of CameraState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraStateImplCopyWith<_$CameraStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
