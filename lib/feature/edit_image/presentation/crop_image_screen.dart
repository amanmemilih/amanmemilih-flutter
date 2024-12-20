import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';

class CropImageScreen extends StatefulWidget {
  const CropImageScreen({super.key});

  @override
  _CropImageScreenState createState() => _CropImageScreenState();
}

class _CropImageScreenState extends State<CropImageScreen> {
  late String imagePath;
  File? croppedImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    imagePath = ModalRoute.of(context)?.settings.arguments as String;
  }

  Future<void> _cropImage() async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.redAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Crop Image',
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          croppedImage = File(croppedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal melakukan crop: $e")),
      );
    }
  }

  Future<void> _rotateImage() async {
    try {
      if (croppedImage == null) {
        throw Exception("Tidak ada gambar untuk dirotasi.");
      }

      // Simpan gambar hasil rotasi di direktori sementara
      final directory = await getTemporaryDirectory();
      final rotatedFilePath = '${directory.path}/rotated_image.jpg';

      // Rotasi dengan mengganti orientasi EXIF
      final rotatedFile = await ImageCropper().cropImage(
        sourcePath: croppedImage!.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Rotate Image',
            toolbarColor: Colors.redAccent,
            toolbarWidgetColor: Colors.white,
          ),
        ],
      );

      if (rotatedFile != null) {
        setState(() {
          croppedImage = File(rotatedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal memutar gambar: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual Crop & Rotate'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: _cropImage,
            icon: const Icon(Icons.crop),
          ),
          IconButton(
            onPressed: _rotateImage,
            icon: const Icon(Icons.rotate_left),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: croppedImage != null
                  ? Image.file(croppedImage!)
                  : Image.file(File(imagePath)),
            ),
          ),
          const Divider(color: Colors.white),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _customButton(
                  icon: Icons.crop,
                  label: 'Crop',
                  onPressed: _cropImage,
                ),
                _customButton(
                  icon: Icons.rotate_left,
                  label: 'Rotate',
                  onPressed: _rotateImage,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

Widget _customButton({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        decoration: BoxDecoration(
          color: const Color(0xFF242424),
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.white, size: 30),
          onPressed: onPressed,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    ],
  );
}
