import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key});

  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  int _currentIndex = 0; // Index gambar yang sedang ditampilkan
  int _selectedToolIndex = -1; // -1 berarti tidak ada alat yang dipilih

  // List alat yang tersedia
  final List<Map<String, dynamic>> _tools = [
    {'label': 'Crop', 'icon': Icons.crop},
    {'label': 'Brightness', 'icon': Icons.brightness_6},
    {'label': 'Contrast', 'icon': Icons.contrast},
    {'label': 'Sharpness', 'icon': Icons.shutter_speed},
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
      body: Column(
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
          // Bottom bar untuk memilih alat pengeditan
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[900],
            child: Column(
              children: [
                //titik titik indikator image carousel_slider
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _tools.map((tool) {
                    final toolIndex = _tools.indexOf(tool);
                    final isSelected = _selectedToolIndex == toolIndex;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedToolIndex = toolIndex;
                        });
                        _navigateToTool(toolIndex, imagePaths);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            tool['icon'],
                            color: isSelected ? Colors.redAccent : Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            tool['label'],
                            style: TextStyle(
                              color:
                                  isSelected ? Colors.redAccent : Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
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
      body: Center(
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
      backgroundColor: Colors.black,
    );
  }
}
