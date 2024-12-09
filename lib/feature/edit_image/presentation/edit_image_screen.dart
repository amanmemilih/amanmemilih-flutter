import 'dart:io';

import 'package:flutter/material.dart';

class EditImageScreen extends StatefulWidget {
  final String imagePath;

  const EditImageScreen({super.key, required this.imagePath});

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  int _selectedToolIndex = 0; // Index untuk alat yang sedang dipilih

  // List alat yang tersedia
  final List<String> _tools = ['Crop', 'Kecerahan', 'Kontras', 'Ketajaman'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Foto'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () {
              // Simpan hasil pengeditan
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Gambar telah disimpan!')),
              );
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          // Area untuk menampilkan gambar
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(
                child: Image.file(
                  File(widget.imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Bottom bar untuk memilih alat pengeditan
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_tools.length, (index) {
                final isSelected = _selectedToolIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedToolIndex = index;
                      _navigateToTool(index); // Navigasi ke fitur yang dipilih
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getIconForTool(index),
                        color: isSelected ? Colors.redAccent : Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _tools[index],
                        style: TextStyle(
                          color: isSelected ? Colors.redAccent : Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Navigasi ke halaman fitur tertentu
  void _navigateToTool(int index) {
    switch (index) {
      case 0:
        // Navigasi ke fitur Crop
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Placeholder(), // Ganti dengan halaman crop
          ),
        );
        break;
      case 1:
        // Navigasi ke fitur Kecerahan
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Placeholder(), // Ganti dengan halaman kecerahan
          ),
        );
        break;
      case 2:
        // Navigasi ke fitur Kontras
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Placeholder(), // Ganti dengan halaman kontras
          ),
        );
        break;
      case 3:
        // Navigasi ke fitur Ketajaman
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Placeholder(), // Ganti dengan halaman ketajaman
          ),
        );
        break;
    }
  }

  // Mengambil icon berdasarkan fitur
  IconData _getIconForTool(int index) {
    switch (index) {
      case 0:
        return Icons.crop;
      case 1:
        return Icons.brightness_6;
      case 2:
        return Icons.contrast;
      case 3:
        return Icons.shutter_speed;
      default:
        return Icons.edit;
    }
  }
}
