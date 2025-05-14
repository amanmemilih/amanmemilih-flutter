import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crop_image_state.dart';
part 'crop_image_cubit.freezed.dart';

class CropImageCubit extends Cubit<CropImageState> {
  CropImageCubit() : super(const CropImageState.initial());

  void cropImage(File originalImage, {required double aspectRatio}) async {
    emit(const CropImageState.loading());
    try {
      // Implementasi crop menggunakan image_cropper
      // (kode pemanggilan cropper akan diisi di edit_image_screen.dart)
      // Di sini hanya emit success/error
    } catch (e) {
      emit(CropImageState.error(e.toString()));
    }
  }

  void setCroppedImage(File croppedImage) {
    emit(CropImageState.success(croppedImage));
  }
}
