import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/router.dart';
import '../cubits/crop_image_cubit.dart';
import '../cubits/brightness_edit_cubit.dart';
import '../cubits/contrast_edit_cubit.dart';
import '../cubits/sharpness_edit_cubit.dart';
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
  final bool _showControls = true;

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
                onPressed: () {
                  // Kembalikan seluruh list imagePaths ke preview
                  Navigator.pop(context, imagePaths);
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _editMenuButton(
                          icon: Icons.crop,
                          label: 'Crop',
                          onTap: () async {
                            final selectedImagePath = imagePaths[_currentIndex];
                            // Panggil cropper (misal aspectRatio 3/4, bisa diubah sesuai kebutuhan)
                            context.read<CropImageCubit>().cropImage(
                                  File(selectedImagePath),
                                  aspectRatio: 3 / 4,
                                );
                          },
                        ),
                        SizedBox(width: 16),
                        _editMenuButton(
                          icon: Icons.brightness_6,
                          label: 'Kecerahan',
                          onTap: () => _navigateToEditScreen(
                              ROUTER.brightnessEditScreen),
                        ),
                        SizedBox(width: 16),
                        _editMenuButton(
                          icon: Icons.contrast,
                          label: 'Kontras',
                          onTap: () =>
                              _navigateToEditScreen(ROUTER.contrastEditScreen),
                        ),
                        SizedBox(width: 16),
                        _editMenuButton(
                          icon: Icons.blur_on,
                          label: 'Ketajaman',
                          onTap: () =>
                              _navigateToEditScreen(ROUTER.sharpnessEditScreen),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menyimpan hasil edit

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
            builder: (context) => BlocProvider(
              create: (_) => SharpnessEditCubit(),
              child: SharpnessEditScreen(imagePath: selectedImagePath),
            ),
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

  Widget _editMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Color(0xFF242424),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 36),
            SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
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
