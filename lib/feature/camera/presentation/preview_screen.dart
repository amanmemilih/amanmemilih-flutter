import 'dart:io';
import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/feature/validasi_data/presentation/validasi_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart'; // Import gal package
import 'package:carousel_slider/carousel_slider.dart'; // Import carousel_slider

class PreviewScreen extends StatefulWidget {
  final List<String> imagePaths;

  const PreviewScreen({super.key, required this.imagePaths});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
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

    if (!_permissionsGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Storage permission is required to save images')),
      );
    }
  }

  Future<void> _saveImagesToGallery() async {
    if (!_permissionsGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission is required')),
      );
      return;
    }

    try {
      for (var path in widget.imagePaths) {
        final image = File(path);
        await Gal.putImageBytes(image.readAsBytesSync());
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Images saved to gallery!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving images: $e')),
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
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              title: const Text(
                "Preview Images",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: colorPrimary,
              actions: [
                IconButton(
                  icon: const Icon(Icons.fullscreen, color: Colors.white),
                  onPressed: _toggleFullScreen,
                ),
              ],
            ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _toggleFullScreen,
              child: CarouselSlider.builder(
                itemCount: widget.imagePaths.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.file(
                    File(widget.imagePaths[index]),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  aspectRatio: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
          if (!_isFullScreen)
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    //membuat dots atau titik titik di carousel_slider
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(widget.imagePaths.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
                  const SizedBox(
                    height: 42,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _customButton(
                        icon: Icons.settings,
                        label: "Edit",
                        onPressed: () {
                          final selectedImagePath =
                              widget.imagePaths[_currentIndex];
                          Navigator.pushNamed(
                            context,
                            ROUTER.editImageScreen,
                            arguments: widget.imagePaths,
                          );
                        },
                      ),
                      _customButton(
                        icon: Icons.add,
                        label: "Tambah",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      _customButton(
                        icon: Icons.check,
                        label: "Selesai",
                        onPressed: () {
                          _saveImagesToGallery();
                          Navigator.pushNamed(context, ROUTER.validasiData,
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
    );
  }
}

Widget _customButton({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF242424),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(icon, color: Colors.white, size: 30),
              onPressed: onPressed,
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
    ),
  );
}
