import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import '../cubits/brightness_edit_cubit.dart';
import 'dart:async';

class BrightnessEditScreen extends StatefulWidget {
  final String imagePath;
  const BrightnessEditScreen({super.key, required this.imagePath});

  @override
  State<BrightnessEditScreen> createState() => _BrightnessEditScreenState();
}

class _BrightnessEditScreenState extends State<BrightnessEditScreen> {
  double _brightness = 0.0;
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

  Future<void> _applyBrightness(double value) async {
    setState(() => _isProcessing = true);
    final original = File(widget.imagePath);
    final bytes = await original.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) return;
    final mappedBrightness = value + 1.0;
    final adjusted = img.adjustColor(image, brightness: mappedBrightness);
    final tempPath =
        '${original.parent.path}/brightness_${DateTime.now().millisecondsSinceEpoch}.jpg';
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
        title: const Text('Atur Pencahayaan'),
        backgroundColor: Colors.redAccent,
        actions: [
          Semantics(
            identifier: "button_save_brightness",
            child: IconButton(
              icon: const Icon(Icons.check),
              onPressed: _isProcessing
                  ? null
                  : () {
                      if (_previewFile != null) {
                        context
                            .read<BrightnessEditCubit>()
                            .setBrightnessImage(_previewFile!);
                        Navigator.pop(context, _previewFile!.path);
                      }
                    },
            ),
          ),
        ],
      ),
      body: BlocListener<BrightnessEditCubit, BrightnessEditState>(
        listener: (context, state) {
          state.mapOrNull(
            error: (e) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gagal edit brightness: \\${e.message}')),
            ),
          );
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _previewFile != null
                    ? Semantics(
                        identifier: "preview_brightness_image",
                        child: Image.file(_previewFile!,
                            fit: BoxFit.contain, width: double.infinity))
                    : const Center(child: Text('Gambar tidak dapat dimuat')),
              ),
              if (_isProcessing) const LinearProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Semantics(
                      identifier: "slider_brightness",
                      child: Slider(
                        value: _brightness,
                        min: -1.0,
                        max: 1.0,
                        divisions: 20,
                        label: _brightness.toStringAsFixed(2),
                        onChanged: (value) {
                          setState(() => _brightness = value);
                          _debounce?.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 300), () {
                            _applyBrightness(value);
                          });
                        },
                      ),
                    ),
                    const Text('Brightness',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
