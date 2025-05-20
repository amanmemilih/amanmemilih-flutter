import 'dart:io';

import 'package:amanmemilih_mobile_app/core/components/alerts/alert_error.dart';
import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/resources/shadows.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/args/document_recapitulation_args.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/cubits/documentrecapitulation/document_recapitulation_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentRecapitulationScreen extends StatelessWidget {
  const DocumentRecapitulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as DocumentRecapitulationArgs;

    return BlocProvider(
      create: (context) => getIt<DocumentRecapitulationCubit>(),
      child: DocumentRecapitulationScreenImplement(args: args),
    );
  }
}

class DocumentRecapitulationScreenImplement extends StatelessWidget {
  const DocumentRecapitulationScreenImplement({
    super.key,
    required this.args,
  });

  final DocumentRecapitulationArgs args;

  Widget _formulirRowBold(String nomer, String namaCalon, String jumlahSuara) {
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

  Widget _formulirRow(String textA, String textB) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DocumentRecapitulationCubit,
        DocumentRecapitulationState>(
      listener: (context, state) {
        if (state.status == DocumentRecapitulationStatus.error) {
          alertError(
            context,
            () {},
            title: state.error?.title ?? 'Unknown Error',
            message: // later
                state.error?.message ?? 'Error Message Not Assigned',
          );
        }

        if (state.status == DocumentRecapitulationStatus.success) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
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
                  _fotoFormulir(context),
                  SizedBox(
                    height: 27,
                  ),
                  BlocBuilder<DocumentRecapitulationCubit,
                      DocumentRecapitulationState>(
                    builder: (context, state) {
                      return Semantics(
                        identifier: "button_publikasi",
                        child: AMElevatedButton(
                          title: "Publikasi",
                          isLoading: state.status ==
                              DocumentRecapitulationStatus.loading,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext innerContext) {
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
                                          Semantics(
                                            identifier:
                                                "dialog_button_yes_publikasi",
                                            child: ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<
                                                        DocumentRecapitulationCubit>()
                                                    .uploadDocument(args);
                                                Navigator.pop(context);
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
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Semantics(
                                            identifier:
                                                "dialog_button_no_publikasi",
                                            child: OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor: Colors.red,
                                                side: BorderSide(
                                                    color: Colors.red),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text("No"),
                                            ),
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
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _fotoFormulir(BuildContext context) {
    return Container(
      height: 500, // Tinggi Image nya
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Membuat sudut melengkung
        color: Colors.white,
      ),
      clipBehavior: Clip.hardEdge, // Memastikan konten di dalam rounded corners
      child: CarouselSlider.builder(
        itemCount: args.imagePaths.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(
                20), // ngasih rounded di gambarnya langsung
            child: Image.file(
              File(args.imagePaths[index]),
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
          onPageChanged: (index, reason) =>
              context.read<DocumentRecapitulationCubit>(),
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
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formulirRow("Formulir Pemilihan", args.electionType),
              _formulirRow("Kelurahan", state.credential?.user?.village ?? ''),
              _formulirRow(
                  "Kecamatan", state.credential?.user?.subdistrict ?? ''),
              _formulirRow("Kab/Kota", state.credential?.user?.district ?? ""),
              SizedBox(
                height: 8,
              ),
              if (args.electionType == 'presidential')
                Container(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: Text("Hasil Rekapitulasi Suara",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                ),
              if (args.electionType == 'presidential')
                ...args.votes.map(
                  (e) {
                    return _formulirRowBold(
                      "${e['candidat_no']}. ",
                      e['candidat_name'],
                      "${e['total_votes']}",
                    );
                  },
                ),
              SizedBox(
                height: 36,
              )
            ],
          );
        },
      ),
    );
  }
}
