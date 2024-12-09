import 'dart:io';
import 'package:amanmemilih_mobile_app/feature/camera/presentation/preview_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gal/gal.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({super.key, required this.camera});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final List<File> _capturedImages = [];
  bool _permissionsGranted = false;
  bool _isFlashOn = false; // State to track flash status

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
    _initializePermissions(); // Initialize permissions when the screen loads
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

      // Update flash mode on the camera
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

  void _addCapturedImage(File image) {
    if (!_capturedImages.any((img) => img.path == image.path)) {
      setState(() {
        _capturedImages.add(image);
      });
    }
  }

  void _navigateToEditor(File image) {
    _addCapturedImage(image);

    List<String> existingImagePaths =
        _capturedImages.map((file) => file.path).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewScreen(imagePaths: existingImagePaths),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foto Formulir'),
        backgroundColor: Colors.redAccent,
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
                      onPressed: () {
                        if (_capturedImages.isNotEmpty) {
                          _navigateToEditor(_capturedImages.last);
                        }
                      },
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
                      return GestureDetector(
                        onTap: () => _navigateToEditor(_capturedImages[index]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
