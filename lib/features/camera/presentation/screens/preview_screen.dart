import 'dart:io';
import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart'; // Import gal package
import 'package:carousel_slider/carousel_slider.dart'; // Import carousel_slider
import 'package:camera/camera.dart';
import 'package:amanmemilih_mobile_app/features/camera/presentation/screens/camera_screen.dart';

class PreviewScreen extends StatefulWidget {
  final List<String> imagePaths;
  final double? aspectRatio;

  const PreviewScreen({super.key, required this.imagePaths, this.aspectRatio});

  @override
  PreviewScreenState createState() => PreviewScreenState();
}

class PreviewScreenState extends State<PreviewScreen> {
  bool _permissionsGranted = false;
  int _currentIndex = 0; // To keep track of the current slide index
  bool _isFullScreen = false; // State to manage full-screen mode

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final permissionStatus = await Gal.requestAccess();
    setState(() {
      _permissionsGranted = permissionStatus;
    });

    if (!_permissionsGranted && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Storage permission is required to save images')),
      );
    }
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              foregroundColor: Colors.white,
              title: const Text(
                "Preview Images",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: colorPrimary,
              actions: [
                Semantics(
                  identifier: "button_toggle_fullscreen",
                  child: IconButton(
                    icon: const Icon(Icons.fullscreen, color: Colors.white),
                    onPressed: _toggleFullScreen,
                  ),
                ),
              ],
            ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Semantics(
                identifier: "preview_image_gesture",
                child: GestureDetector(
                  onTap: _toggleFullScreen,
                  child: CarouselSlider.builder(
                    itemCount: widget.imagePaths.length,
                    itemBuilder: (context, index, realIndex) {
                      return AspectRatio(
                        aspectRatio: widget.aspectRatio ?? 3 / 4,
                        child: Image.file(
                          File(widget.imagePaths[index]),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: size.height * 0.5,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      aspectRatio: size.aspectRatio,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            if (!_isFullScreen)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.02,
                ),
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(widget.imagePaths.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.01),
                            width: _currentIndex == index ? 12.0 : 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? Colors.redAccent
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _customButton(
                          icon: Icons.settings,
                          label: "Edit",
                          identifier: "button_edit_image",
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              ROUTER.editImageScreen,
                              arguments: widget.imagePaths,
                            );
                          },
                        ),
                        _customButton(
                          icon: Icons.camera_alt,
                          label: "Ambil Gambar Ulang",
                          identifier: "button_retake_image",
                          onPressed: () async {
                            // Ambil kamera utama
                            final cameras = await availableCameras();
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CameraScreen(camera: cameras.first),
                                ),
                              );
                            }
                          },
                        ),
                        _customButton(
                          icon: Icons.check,
                          label: "Selesai",
                          identifier: "button_finish_preview",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ROUTER.documentValidation,
                                arguments: widget.imagePaths);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _customButton({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
  required String identifier,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF242424),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            identifier: identifier,
            child: IconButton(
              icon: Icon(icon, color: Colors.white, size: 30),
              onPressed: onPressed,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}
