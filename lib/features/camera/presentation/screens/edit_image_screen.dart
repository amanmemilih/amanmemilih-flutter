import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key});

  @override
  EditImageScreenState createState() => EditImageScreenState();
}

class EditImageScreenState extends State<EditImageScreen> {
  int _currentIndex = 0; // Index gambar yang sedang ditampilkan
  int _selectedToolIndex = -1; // -1 berarti tidak ada alat yang dipilih

  // List alat yang tersedia
  final List<Map<String, dynamic>> _tools = [
    {'label': 'Pangkas', 'icon': Icons.crop},
    {'label': 'Pencahayaan', 'icon': Icons.brightness_6},
    {'label': 'Kontras', 'icon': Icons.contrast},
    {'label': 'Ketajaman', 'icon': Icons.shutter_speed},
  ];

  @override
  Widget build(BuildContext context) {
    var imagePaths = ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Foto'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: _saveEdits,
            icon: const Icon(Icons.check),
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
            Container(
              color: Colors.grey[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 100.w, top: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        imagePaths.length,
                        (index) => Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.redAccent
                                : Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _tools.map((tool) {
                        final toolIndex = _tools.indexOf(tool);
                        final isSelected = _selectedToolIndex == toolIndex;

                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedToolIndex = toolIndex;
                              });
                              _navigateToTool(toolIndex, imagePaths);
                            },
                            child: Column(
                              children: [
                                Icon(
                                  tool['icon'],
                                  color: isSelected
                                      ? Colors.redAccent
                                      : Colors.white,
                                ),
                                SizedBox(height: 6.w),
                                Text(
                                  tool['label'],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.redAccent
                                        : Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 70.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Navigasi ke halaman fitur tertentu
  void _navigateToTool(int toolIndex, List<String> imagePaths) async {
    final selectedImagePath = imagePaths.isNotEmpty
        ? imagePaths[_currentIndex.clamp(0, imagePaths.length - 1)]
        : null;

    if (selectedImagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak ada gambar untuk diedit')),
      );
      return;
    }

    final editedImagePath = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceholderScreen(
          title: _tools[toolIndex]['label'],
          imagePath: selectedImagePath,
        ),
      ),
    );

    if (editedImagePath != null) {
      setState(() {
        imagePaths[_currentIndex] = editedImagePath; // Update hasil edit
      });
    }
  }

  // Fungsi untuk menyimpan hasil edit
  void _saveEdits() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gambar berhasil disimpan ke'),
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
