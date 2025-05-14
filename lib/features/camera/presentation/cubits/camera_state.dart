part of 'camera_cubit.dart';

@freezed
class CameraState with _$CameraState {
  const factory CameraState({
    CameraController? controller,
    @Default(false) bool isInitialized,
    @Default(false) bool isFlashOn,
    @Default(<File>[]) List<File> capturedImages,
    @Default(false) bool permissionsGranted,
  }) = _CameraState;

  factory CameraState.initial() => const _CameraState();
}
