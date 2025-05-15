import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brightness_edit_state.dart';
part 'brightness_edit_cubit.freezed.dart';

class BrightnessEditCubit extends Cubit<BrightnessEditState> {
  BrightnessEditCubit() : super(const BrightnessEditState.initial());

  void editBrightness(File originalImage, double brightness) async {
    emit(const BrightnessEditState.loading());
    try {
      // Implementasi edit brightness akan diisi di edit_image_screen.dart
      // Di sini hanya emit success/error
    } catch (e) {
      emit(BrightnessEditState.error(e.toString()));
    }
  }

  void setBrightnessImage(File editedImage) {
    emit(BrightnessEditState.success(editedImage));
  }
}
