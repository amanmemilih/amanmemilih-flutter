import 'dart:io';
import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/feature/camera/presentation/preview_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gal/gal.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({super.key, required this.camera});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final List<File> _capturedImages = [];
  bool _permissionsGranted = false;
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
    _initializePermissions();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializePermissions() async {
    final permissionStatus = await Gal.requestAccess();
    setState(() {
      _permissionsGranted = permissionStatus;
    });
  }

  Future<void> _toggleFlash() async {
    if (!_controller.value.isInitialized) return;

    try {
      setState(() {
        _isFlashOn = !_isFlashOn;
      });

      await _controller.setFlashMode(
        _isFlashOn ? FlashMode.torch : FlashMode.off,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error toggling flash: $e')),
      );
    }
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      if (!_permissionsGranted) {
        await _initializePermissions();
        if (!_permissionsGranted) return;
      }

      final tempDir = await getTemporaryDirectory();
      final String filePath =
          '${tempDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final XFile image = await _controller.takePicture();
      final File savedImage = await File(image.path).copy(filePath);

      final bytes = await savedImage.readAsBytes();
      final img.Image originalImage = img.decodeImage(bytes)!;
      final img.Image fixedImage = img.bakeOrientation(originalImage);

      final File correctedFile = File(filePath)
        ..writeAsBytesSync(img.encodeJpg(fixedImage));

      setState(() {
        _capturedImages.add(correctedFile);
      });
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error taking picture: $e')),
      );
    }
  }

  void _navigateToEditor() {
    if (_capturedImages.isNotEmpty) {
      List<String> imagePaths =
          _capturedImages.map((file) => file.path).toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(imagePaths: imagePaths),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Foto Formulir', style: TextStyle(color: Colors.white)),
        backgroundColor: colorPrimary,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
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
                      onPressed: _toggleFlash,
                      icon: Icon(
                        _isFlashOn ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: _takePicture,
                      icon: const Icon(Icons.circle,
                          size: 60, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: _navigateToEditor,
                      icon:
                          const Icon(Icons.photo_library, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _capturedImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () => _navigateToEditor(),
                          child: Image.file(
                            _capturedImages[index],
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
  }
}
