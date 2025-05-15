part of 'brightness_edit_cubit.dart';

@freezed
class BrightnessEditState with _$BrightnessEditState {
  const factory BrightnessEditState.initial() = _Initial;
  const factory BrightnessEditState.loading() = _Loading;
  const factory BrightnessEditState.success(File editedImage) = _Success;
  const factory BrightnessEditState.error(String message) = _Error;
}
