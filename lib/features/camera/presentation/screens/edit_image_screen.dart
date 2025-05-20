import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/router.dart';
import '../cubits/crop_image_cubit.dart';
import '../cubits/brightness_edit_cubit.dart';
import '../cubits/contrast_edit_cubit.dart';
import 'brightness_edit_screen.dart';
import 'contrast_edit_screen.dart';
import 'sharpness_edit_screen.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key});

  @override
  EditImageScreenState createState() => EditImageScreenState();
}

class EditImageScreenState extends State<EditImageScreen> {
  int _currentIndex = 0; // Index gambar yang sedang ditampilkan
  final bool _showControls = false;
  File? _previewFile;

  @override
  Widget build(BuildContext context) {
    var imagePaths = ModalRoute.of(context)!.settings.arguments as List<String>;
    return BlocListener<CropImageCubit, CropImageState>(
      listener: (context, state) {
        state.mapOrNull(
          success: (s) {
            setState(() {
              imagePaths[_currentIndex] = s.croppedImage.path;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Gambar berhasil di-crop')),
            );
          },
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Crop gagal: ${e.message}')),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Foto'),
          backgroundColor: Colors.redAccent,
          actions: [
            Semantics(
              identifier: "button_save_edit",
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: _previewFile == null
                    ? null
                    : () {
                        if (_previewFile != null) {
                          Navigator.pop(context, _previewFile!.path);
                        }
                      },
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Area untuk menampilkan gambar
              Expanded(
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: imagePaths.length,
                      itemBuilder: (context, index, realIndex) {
                        try {
                          return Image.file(
                            File(imagePaths[index]),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        } catch (e) {
                          return const Center(
                            child: Text('Gambar tidak dapat dimuat'),
                          );
                        }
                      },
                      options: CarouselOptions(
                        height: double.infinity,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (_showControls)
                Container(
                  color: Colors.black87,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Semantics(
                            identifier: "button_edit_brightness",
                            child: _buildEditButton(
                              icon: Icons.brightness_6,
                              label: 'Brightness',
                              onPressed: () => _navigateToEditScreen(
                                  ROUTER.brightnessEditScreen),
                            ),
                          ),
                          Semantics(
                            identifier: "button_edit_contrast",
                            child: _buildEditButton(
                              icon: Icons.contrast,
                              label: 'Contrast',
                              onPressed: () => _navigateToEditScreen(
                                  ROUTER.contrastEditScreen),
                            ),
                          ),
                          Semantics(
                            identifier: "button_edit_sharpness",
                            child: _buildEditButton(
                              icon: Icons.blur_on,
                              label: 'Sharpness',
                              onPressed: () => _navigateToEditScreen(
                                  ROUTER.sharpnessEditScreen),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Semantics(
                            identifier: "button_rotate_left",
                            child: _buildEditButton(
                              icon: Icons.rotate_left,
                              label: 'Rotate Left',
                              onPressed: () => _rotateImage(-90),
                            ),
                          ),
                          Semantics(
                            identifier: "button_rotate_right",
                            child: _buildEditButton(
                              icon: Icons.rotate_right,
                              label: 'Rotate Right',
                              onPressed: () => _rotateImage(90),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menyimpan hasil edit

  Widget _buildEditButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }

  void _rotateImage(int degrees) {
    // Implementasi rotasi gambar
  }

  void _navigateToEditScreen(ROUTER screen) async {
    final imagePaths =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    final selectedImagePath = imagePaths[_currentIndex];
    String? editedImagePath;

    switch (screen) {
      case ROUTER.brightnessEditScreen:
        editedImagePath = await Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => BrightnessEditCubit(),
              child: BrightnessEditScreen(imagePath: selectedImagePath),
            ),
          ),
        );
        break;
      case ROUTER.contrastEditScreen:
        editedImagePath = await Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => ContrastEditCubit(),
              child: ContrastEditScreen(imagePath: selectedImagePath),
            ),
          ),
        );
        break;
      case ROUTER.sharpnessEditScreen:
        editedImagePath = await Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SharpnessEditScreen(imagePath: selectedImagePath),
          ),
        );
        break;
    }

    if (editedImagePath != null) {
      setState(() {
        imagePaths[_currentIndex] = editedImagePath!;
      });
    }
  }
}

// Placeholder untuk setiap fitur
class PlaceholderScreen extends StatelessWidget {
  final String title;
  final String imagePath;

  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(File(imagePath)),
              const SizedBox(height: 20),
              Text(
                'Tool: $title',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
