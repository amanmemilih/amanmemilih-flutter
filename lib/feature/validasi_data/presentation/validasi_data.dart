import 'dart:io';

import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/resources/shadows.dart';
import 'package:amanmemilih_mobile_app/core/widgets/outlined_button.dart';
import 'package:amanmemilih_mobile_app/feature/validasi_data/presentation/rekapitulasi_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ValidasiData extends StatefulWidget {
  const ValidasiData({super.key});

  @override
  State<ValidasiData> createState() => _ValidasiDataState();
}

class _ValidasiDataState extends State<ValidasiData> {
  int _currentIndex = 0; // Index gambar yang sedang ditampilkan

  @override
  Widget build(BuildContext context) {
    final TextEditingController suaraSatuController = TextEditingController();
    final TextEditingController suaraDuaController = TextEditingController();
    final TextEditingController suaraTigaController = TextEditingController();
    var imagePaths = ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Validasi Data',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: colorPrimary,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _validasiData(),
                SizedBox(height: 40),
                Text(
                  "Hasil Rekapitulasi Suara",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 24,
                ),
                _formHasilRekapitulasiSuara(suaraSatuController,
                    suaraDuaController, suaraTigaController),
                SizedBox(
                  height: 40,
                ),
                _hasilRekapitulasiSuara(imagePaths),
                SizedBox(
                  height: 40,
                ),
                _tandaTanganPetugas(),
                SizedBox(
                  height: 25,
                ),
                ColorOutlinedButton(
                    title: "Lanjut",
                    onTap: () {
                      Navigator.pushNamed(context, ROUTER.rekapitulasiData,
                          arguments: imagePaths);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _tandaTanganPetugas() {
    return Container(
      child: Column(
        children: [
          Text(
            "Tanda Tangan Petugas",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 24),
          Container(
            child: Image.asset('assets/images/tanda_tangan.jpg'),
          )
        ],
      ),
    );
  }

  Container _hasilRekapitulasiSuara(List<String> imagePaths) {
    return Container(
      child: Column(
        children: [
          Text(
            "Foto Formulir",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 24,
          ),
          _imageCarousel(imagePaths),
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

  Container _formHasilRekapitulasiSuara(
      TextEditingController suaraSatuController,
      TextEditingController suaraDuaController,
      TextEditingController suaraTigaController) {
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
          //Suara Satu
          _suaraCalon(suaraSatuController, "Senator Amstrong"),
          // Suara Dua
          _suaraCalon(suaraDuaController, "YNTKTS"),
          //Suara Tiga
          _suaraCalon(suaraTigaController, "Vergil"),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Container _validasiData() {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              "Validasi Data",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 24),
          _formulirPemilihan(),
        ],
      ),
    );
  }

  Container _suaraCalon(
      TextEditingController suaraSatuController, String namaCalon) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "1.   ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                namaCalon,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              labelText: "jumlah suara"),
                          controller: suaraSatuController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _formulirPemilihan() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BaseShadows.primary[0],
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Formulir Pemilihan",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              child: Row(
                children: [Text("Pilih"), Icon(Icons.arrow_drop_down)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
