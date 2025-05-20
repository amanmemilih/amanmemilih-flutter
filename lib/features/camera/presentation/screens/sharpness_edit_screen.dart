import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/sharpness_edit_cubit.dart';

class SharpnessEditScreen extends StatefulWidget {
  final String imagePath;
  const SharpnessEditScreen({super.key, required this.imagePath});

  @override
  State<SharpnessEditScreen> createState() => _SharpnessEditScreenState();
}

class _SharpnessEditScreenState extends State<SharpnessEditScreen> {
  double _sharpness = 0.0;
  File? _previewFile;
  bool _isProcessing = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _previewFile = File(widget.imagePath);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _applySharpness(double value) async {
    setState(() => _isProcessing = true);
    final original = File(widget.imagePath);
    final bytes = await original.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) return;
    final mappedSharpness = value + 1.0; // -1..1 => 0..2
    img.Image adjusted;
    if (mappedSharpness < 1.0) {
      // Blur jika < 1.0
      adjusted = img.gaussianBlur(image,
          radius: ((1.0 - mappedSharpness) * 5).round());
    } else if (mappedSharpness > 1.0) {
      // Sharpen simulasi: gaussianBlur dengan radius kecil (1 = tajam)
      adjusted = img.gaussianBlur(image,
          radius: (2 - (mappedSharpness - 1.0) * 1.5).clamp(0.5, 2).toInt());
    } else {
      adjusted = image;
    }
    final tempPath =
        '${original.parent.path}/sharpness_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final result = File(tempPath)..writeAsBytesSync(img.encodeJpg(adjusted));
    setState(() {
      _previewFile = result;
      _isProcessing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atur Ketajaman'),
        backgroundColor: Colors.redAccent,
        actions: [
          Semantics(
            identifier: "button_save_sharpness",
            child: IconButton(
              icon: const Icon(Icons.check),
              onPressed: _isProcessing
                  ? null
                  : () {
                      if (_previewFile != null) {
                        context
                            .read<SharpnessEditCubit>()
                            .setSharpnessImage(_previewFile!);
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
            Expanded(
              child: _previewFile != null
                  ? Semantics(
                      identifier: "preview_sharpness_image",
                      child: Image.file(_previewFile!,
                          fit: BoxFit.contain, width: double.infinity),
                    )
                  : const Center(child: Text('Gambar tidak dapat dimuat')),
            ),
            if (_isProcessing) const LinearProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Semantics(
                    identifier: "slider_sharpness",
                    child: Slider(
                      value: _sharpness,
                      min: -1.0,
                      max: 1.0,
                      divisions: 20,
                      label: _sharpness.toStringAsFixed(2),
                      onChanged: (value) {
                        setState(() => _sharpness = value);
                        _debounce?.cancel();
                        _debounce =
                            Timer(const Duration(milliseconds: 300), () {
                          _applySharpness(value);
                        });
                      },
                    ),
                  ),
                  const Text('Ketajaman',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
