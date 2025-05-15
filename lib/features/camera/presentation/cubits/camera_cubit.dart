import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gal/gal.dart';
import 'package:image/image.dart' as img;
import 'package:amanmemilih_mobile_app/features/camera/presentation/screens/preview_screen.dart';
import 'package:flutter/material.dart';

part 'camera_state.dart';
part 'camera_cubit.freezed.dart';

class CameraCubit extends Cubit<CameraState> {
  final CameraDescription camera;
  CameraController? _controller;

  CameraCubit(this.camera) : super(CameraState.initial());

  Future<void> initialize() async {
    _controller = CameraController(camera, ResolutionPreset.high);
    await _controller!.initialize();
    final permissionStatus = await Gal.requestAccess();
    emit(state.copyWith(
      controller: _controller,
      isInitialized: true,
      permissionsGranted: permissionStatus,
    ));
  }

  void toggleFlash() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    try {
      final newFlash = !state.isFlashOn;
      await _controller!.setFlashMode(
        newFlash ? FlashMode.torch : FlashMode.off,
      );
      emit(state.copyWith(isFlashOn: newFlash));
    } catch (e) {
      // ignore: empty_catches
    }
  }

  void takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    try {
      if (!state.permissionsGranted) {
        final permissionStatus = await Gal.requestAccess();
        emit(state.copyWith(permissionsGranted: permissionStatus));
        if (!permissionStatus) return;
      }
      final tempDir = await getTemporaryDirectory();
      final String filePath =
          '${tempDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final XFile image = await _controller!.takePicture();
      final File savedImage = await File(image.path).copy(filePath);
      final bytes = await savedImage.readAsBytes();
      final img.Image originalImage = img.decodeImage(bytes)!;
      final img.Image fixedImage = img.bakeOrientation(originalImage);
      final File correctedFile = File(filePath)
        ..writeAsBytesSync(img.encodeJpg(fixedImage));
      final newImages = List<File>.from(state.capturedImages)
        ..add(correctedFile);
      emit(state.copyWith(capturedImages: newImages));
    } catch (e) {
      // ignore: empty_catches
    }
  }

  void navigateToEditor(BuildContext context) {
    if (state.capturedImages.isNotEmpty) {
      List<String> imagePaths =
          state.capturedImages.map((file) => file.path).toList();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            imagePaths: imagePaths,
            aspectRatio: state.controller?.value.aspectRatio,
          ),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }
}
