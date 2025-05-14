part of 'crop_image_cubit.dart';

@freezed
class CropImageState with _$CropImageState {
  const factory CropImageState.initial() = _Initial;
  const factory CropImageState.loading() = _Loading;
  const factory CropImageState.success(File croppedImage) = _Success;
  const factory CropImageState.error(String message) = _Error;
}
