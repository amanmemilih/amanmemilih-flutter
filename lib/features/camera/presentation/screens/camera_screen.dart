import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amanmemilih_mobile_app/features/camera/presentation/cubits/camera_cubit.dart';

class CameraScreen extends StatelessWidget {
  final CameraDescription camera;

  const CameraScreen({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CameraCubit(camera)..initialize(),
      child: BlocBuilder<CameraCubit, CameraState>(
        builder: (context, state) {
          final cubit = context.read<CameraCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Foto Formulir',
                  style: TextStyle(color: Colors.white)),
              backgroundColor: colorPrimary,
              foregroundColor: Colors.white,
            ),
            body: Stack(
              children: [
                if (state.isInitialized)
                  CameraPreview(state.controller!)
                else
                  const Center(child: CircularProgressIndicator()),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const Text(
                        'Pastikan gambar sejajar dengan frame kamera anda',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: cubit.toggleFlash,
                            icon: Icon(
                              state.isFlashOn
                                  ? Icons.flash_on
                                  : Icons.flash_off,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: cubit.takePicture,
                            icon: const Icon(Icons.circle,
                                size: 60, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () => cubit.navigateToEditor(context),
                            icon: const Icon(Icons.photo_library,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.capturedImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () => cubit.navigateToEditor(context),
                                child: Image.file(
                                  state.capturedImages[index],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
