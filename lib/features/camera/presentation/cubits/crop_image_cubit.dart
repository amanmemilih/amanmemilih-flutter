import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';

part 'crop_image_state.dart';
part 'crop_image_cubit.freezed.dart';

class CropImageCubit extends Cubit<CropImageState> {
  CropImageCubit() : super(const CropImageState.initial());

  void cropImage(File originalImage, {required double aspectRatio}) async {
    emit(const CropImageState.loading());
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: originalImage.path,
        aspectRatio: CropAspectRatio(ratioX: aspectRatio, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Gambar',
            toolbarColor: const Color(0xFFFF5353),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Crop Gambar',
            aspectRatioLockEnabled: true,
          ),
        ],
      );
      if (croppedFile != null) {
        emit(CropImageState.success(File(croppedFile.path)));
      } else {
        emit(const CropImageState.error('Crop dibatalkan'));
      }
    } catch (e) {
      emit(CropImageState.error(e.toString()));
    }
  }

  void setCroppedImage(File croppedImage) {
    emit(CropImageState.success(croppedImage));
  }
}
