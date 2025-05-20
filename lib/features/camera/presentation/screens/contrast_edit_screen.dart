import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/contrast_edit_cubit.dart';

class ContrastEditScreen extends StatefulWidget {
  final String imagePath;
  const ContrastEditScreen({super.key, required this.imagePath});

  @override
  State<ContrastEditScreen> createState() => _ContrastEditScreenState();
}

class _ContrastEditScreenState extends State<ContrastEditScreen> {
  double _contrast = 0.0;
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

  Future<void> _applyContrast(double value) async {
    setState(() => _isProcessing = true);
    final original = File(widget.imagePath);
    final bytes = await original.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) return;
    final mappedContrast = value + 1.0;
    final adjusted = img.adjustColor(image, contrast: mappedContrast);
    final tempPath =
        '${original.parent.path}/contrast_${DateTime.now().millisecondsSinceEpoch}.jpg';
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
        title: const Text('Atur Kontras'),
        backgroundColor: Colors.redAccent,
        actions: [
          Semantics(
            identifier: "button_save_contrast",
            child: IconButton(
              icon: const Icon(Icons.check),
              onPressed: _isProcessing
                  ? null
                  : () {
                      if (_previewFile != null) {
                        context
                            .read<ContrastEditCubit>()
                            .setContrastImage(_previewFile!);
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
                      identifier: "preview_contrast_image",
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
                    identifier: "slider_contrast",
                    child: Slider(
                      value: _contrast,
                      min: -1.0,
                      max: 1.0,
                      divisions: 20,
                      label: _contrast.toStringAsFixed(2),
                      onChanged: (value) {
                        setState(() => _contrast = value);
                        _debounce?.cancel();
                        _debounce =
                            Timer(const Duration(milliseconds: 300), () {
                          _applyContrast(value);
                        });
                      },
                    ),
                  ),
                  const Text('Kontras', style: TextStyle(color: Colors.white)),
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
