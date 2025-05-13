import 'dart:io';

import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/resources/shadows.dart';
import 'package:amanmemilih_mobile_app/core/widgets/outlined_button.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/args/document_recapitulation_args.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/cubits/documentvalidation/document_validation_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentValidationScreen extends StatelessWidget {
  const DocumentValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var imagePaths = ModalRoute.of(context)!.settings.arguments as List<String>;

    return BlocProvider(
      create: (context) => getIt<DocumentValidationCubit>()..getData(),
      child: DocumentValidationScreenImplement(imagePaths: imagePaths),
    );
  }
}

class DocumentValidationScreenImplement extends StatelessWidget {
  const DocumentValidationScreenImplement({
    super.key,
    required this.imagePaths,
  });

  final List<String> imagePaths;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocumentValidationCubit, DocumentValidationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Validasi Data",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BaseShadows.primary[0],
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: state.electionType,
                          items: context
                              .read<DocumentValidationCubit>()
                              .electionTypeValues
                              .map((e) {
                            return DropdownMenuItem<String>(
                              value: e['value'],
                              child: Text(e['label']),
                            );
                          }).toList(),
                          onChanged: (value) => context
                              .read<DocumentValidationCubit>()
                              .changeElectionType(value!),
                        ),
                      ),
                    ),
                    state.electionType == 'presidential'
                        ? Column(
                            children: [
                              SizedBox(height: 40),
                              Text(
                                "Hasil Rekapitulasi Suara",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Container(
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
                                    ...state.presidentialCandidats
                                            ?.asMap()
                                            .entries
                                            .map(
                                          (e) {
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${e.value.no}.   ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Text(
                                                                e.value.name ??
                                                                    '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 12,
                                                          ),
                                                          TextFormField(
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            1),
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            20))),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            1),
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            20))),
                                                                labelText:
                                                                    "jumlah suara"),
                                                            controller: state
                                                                    .voteControllers[
                                                                e.key],
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            inputFormatters: <TextInputFormatter>[
                                                              // for below version 2 use this
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                              // for version 2 and greater youcan also use this
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        ) ??
                                        [],
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          "Foto Formulir",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          height: 500, // Tinggi Image nya
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Membuat sudut melengkung
                            color: Colors.white,
                          ),
                          clipBehavior: Clip
                              .hardEdge, // Memastikan konten di dalam rounded corners
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
                              onPageChanged: (index, reason) => context
                                  .read<DocumentValidationCubit>()
                                  .changeDocumentIndex(index),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    state.status == DocumentValidationStatus.success
                        ? ColorOutlinedButton(
                            title: "Lanjut",
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ROUTER.documentRecapitulation,
                                arguments: DocumentRecapitulationArgs(
                                  votes: state.presidentialCandidats!
                                      .asMap()
                                      .entries
                                      .map((e) => {
                                            'candidat_name': e.value.name,
                                            'candidat_no': e.value.no,
                                            'candidat_id': e.value.id,
                                            'total_votes': state
                                                .voteControllers[e.key].text,
                                          })
                                      .toList(),
                                  electionType: state.electionType,
                                  imagePaths: imagePaths,
                                ),
                              );
                            },
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
