import 'dart:io';
import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  // Mengecek izin untuk menyimpan gambar ke galeri
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

  // Menyimpan gambar ke galeri
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Preview Images",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: colorPrimary,
      ),
      body: Column(
        children: [
          // Carousel to display images
          Expanded(
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
                    _currentIndex =
                        index; // Update current index on page change
                  });
                },
              ),
            ),
          ),
          // Button row below the carousel
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.black,
            child: Column(
              children: [
                // Dots indicator for carousel
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.imagePaths.length, (index) {
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
                SizedBox(
                  height: 42,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _customButton(
                      icon: Icons.settings,
                      label: "Edit",
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Edit feature coming soon')),
                        );
                      },
                    ),
                    _customButton(
                      icon: Icons.add,
                      label: "Tambah",
                      onPressed: () {
                        // Navigate back to CameraScreen (you might need to replace this with your actual CameraScreen route)
                        Navigator.pop(
                            context); // Replace with your camera screen navigation
                      },
                    ),
                    _customButton(
                      icon: Icons.check,
                      label: "Selesai",
                      onPressed: () {
                        _saveImagesToGallery();
                        Navigator.pop(context);
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
      color: Color(0xFF242424),
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
