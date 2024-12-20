import 'dart:io';

import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/resources/shadows.dart';
import 'package:amanmemilih_mobile_app/core/widgets/outlined_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RekapitulasiData extends StatefulWidget {
  const RekapitulasiData({super.key});

  @override
  State<RekapitulasiData> createState() => _RekapitulasiDataState();
}

class _RekapitulasiDataState extends State<RekapitulasiData> {
  int _currentIndex = 0; // Index gambar yang sedang ditampilkan
  @override
  Widget build(BuildContext context) {
    var imagePaths = ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Rekapitulasi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: colorPrimary,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Detail Formulir",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 24,
                  ),
                  _detailFormulir(),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Foto Formulir",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 24,
                  ),
                  _imageCarousel(imagePaths),
                  SizedBox(
                    height: 27,
                  ),
                  ColorOutlinedButton(
                    title: "Publikasi",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.red[100],
                                  radius: 24,
                                  child: Icon(
                                    Icons.help_outline,
                                    size: 32,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "Setelah data dipublikasikan, anda tidak dapat mengubahnya lagi. Lanjutkan?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Aksi untuk tombol "Ya"

                                        Navigator.pushNamed(
                                            context, ROUTER.bottomNavBar);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        // Aksi untuk tombol "Tidak"
                                        Navigator.pop(context);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.red,
                                        side: BorderSide(color: Colors.red),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text("No"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _imageCarousel(List<String> imagePaths) {
    return Container(
      height: 500, // Tinggi Image nya
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Membuat sudut melengkung
        color: Colors.white,
      ),
      clipBehavior: Clip.hardEdge, // Memastikan konten di dalam rounded corners
      child: CarouselSlider.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(
                20), // ngasih rounded di gambarnya langsung
            child: Image.file(
              File(imagePaths[index]),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          );
        },
        options: CarouselOptions(
          height: 500,
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
    );
  }

  Container _detailFormulir() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BaseShadows.primary[0],
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _formulirRow("Formulir Pemilihan", "Pemilihan Presiden"),
          _formulirRow("TPS", "012"),
          _formulirRow("Kelurahan", "Tanah Garam"),
          _formulirRow("Kecamatan", "Lubuk Sikarah"),
          _formulirRow("Kab/Kota", "Kota Solok"),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Text("Hasil Rekapitulasi Suara",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ),
          _formulirRowBold("1. ", "Senator Amstrong", "57"),
          _formulirRowBold("2. ", "YNTKTS", "100"),
          _formulirRowBold("3. ", "Vergil", "16"),
          SizedBox(
            height: 36,
          )
        ],
      ),
    );
  }

  Container _formulirRowBold(
      String nomer, String namaCalon, String jumlahSuara) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nomer + namaCalon,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          Text(jumlahSuara,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
        ],
      ),
    );
  }

  Padding _formulirRow(String textA, String textB) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textA,
              style: TextStyle(fontSize: 16),
            ),
            Text(textB, style: TextStyle(fontSize: 16))
          ],
        ),
      ),
    );
  }
}
