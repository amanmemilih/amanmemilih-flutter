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
import 'package:signature/signature.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/cubits/documentinformation/document_information_cubit.dart';
import '../../../../helpers/ocr_service.dart';
import 'package:amanmemilih_mobile_app/features/camera/presentation/cubits/crop_image_cubit.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class DocumentValidationScreen extends StatelessWidget {
  const DocumentValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var imagePaths = ModalRoute.of(context)!.settings.arguments as List<String>;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DocumentValidationCubit>()..getData(),
        ),
        BlocProvider(
          create: (context) => getIt<DocumentInformationCubit>()..getData(),
        ),
      ],
      child: DocumentValidationScreenImplement(imagePaths: imagePaths),
    );
  }
}

class DocumentValidationScreenImplement extends StatefulWidget {
  const DocumentValidationScreenImplement({
    super.key,
    required this.imagePaths,
  });

  final List<String> imagePaths;

  @override
  State<DocumentValidationScreenImplement> createState() =>
      _DocumentValidationScreenImplementState();
}

class _DocumentValidationScreenImplementState
    extends State<DocumentValidationScreenImplement> {
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  Uint8List? _signatureBytes;
  final _formKey = GlobalKey<FormState>();
  bool _isOcrLoading = false;
  bool _ocrHasRun = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final infoState = context.read<DocumentInformationCubit>().state;
      final uploadedTypes = (infoState.data ?? <dynamic>[])
          .where((e) => (e.status ?? 0) != 0 && e.electionType != null)
          .map((e) => e.electionType)
          .toSet();
      final cubit = context.read<DocumentValidationCubit>();
      final firstAvailable = cubit.electionTypeValues.firstWhere(
          (e) => !uploadedTypes.contains(e['value']),
          orElse: () => cubit.electionTypeValues.first);
      if (uploadedTypes.contains(cubit.state.electionType)) {
        cubit.changeElectionType(firstAvailable['value']);
      }
    });
  }

  Future<void> _runOcrOnFirstImage() async {
    setState(() {
      _isOcrLoading = true;
    });
    try {
      final imageFile = File(widget.imagePaths[0]);
      final cropper = CropImageCubit();
      // Jika cropTulisanBaris tidak ada, proses seluruh gambar dan ambil 3 baris kapital terpanjang
      final inputImage = InputImage.fromFile(imageFile);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final recognizedText = await textRecognizer.processImage(inputImage);
      await textRecognizer.close();
      final lines = recognizedText.text.split('\n');
      print('[DEBUG][OCR] Semua baris hasil OCR:');
      for (final l in lines) {
        print('[DEBUG][OCR] > $l');
      }
      // Filter baris kandidat: baris yang mengandung digit ATAU fuzzy match kata kunci angka Indonesia
      final onlyCaps = RegExp(r'^[A-Z ]{5,}$');
      final keywords = [
        'NOL',
        'SATU',
        'DUA',
        'TIGA',
        'EMPAT',
        'LIMA',
        'ENAM',
        'TUJUH',
        'DELAPAN',
        'SEMBILAN',
        'PULUH',
        'BELAS',
        'SERATUS',
        'SERIBU'
      ];
      bool fuzzyContainsKeyword(String text) {
        final words = text.toUpperCase().split(' ');
        for (final word in words) {
          for (final k in keywords) {
            if (OcrService.levenshtein(word, k) <= 2) return true;
          }
        }
        return false;
      }

      // Baris yang mengandung kata kunci angka (fuzzy)
      final keywordLines = lines.where((l) {
        final lt = l.trim();
        return fuzzyContainsKeyword(lt);
      }).toList();
      // Baris yang mengandung digit
      final digitLines =
          lines.where((l) => RegExp(r'[0-9]').hasMatch(l)).toList();
      // Gabungkan, prioritaskan keywordLines, lalu digitLines (tanpa duplikat)
      final Set<String> candidateSet = {};
      candidateSet.addAll(keywordLines);
      for (final l in digitLines) {
        if (candidateSet.length >= 3) break;
        candidateSet.add(l);
      }
      final candidateLines = candidateSet.toList();
      // Ambil 3 baris terpanjang
      candidateLines.sort((a, b) => b.length.compareTo(a.length));
      while (candidateLines.length < 3) {
        candidateLines.add('');
      }
      final votes = <String>[];
      for (int i = 0; i < 3; i++) {
        if (i < candidateLines.length) {
          print('[DEBUG][OCR] Baris kandidat $i: ${candidateLines[i]}');
          final angka = OcrService.parseOcrToNumberChained(candidateLines[i]);
          print('[DEBUG][OCR] Parsing ke angka: $angka');
          votes.add(angka?.toString().padLeft(3, '0') ?? '');
        } else {
          votes.add('');
        }
      }
      final cubit = context.read<DocumentValidationCubit>();
      cubit.setVoteControllersFromOcr(votes);
    } catch (e) {
      // Tampilkan error jika perlu
    }
    setState(() {
      _isOcrLoading = false;
      _ocrHasRun = true;
    });
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<DocumentValidationCubit, DocumentValidationState>(
          listener: (context, state) async {
            if (state.status == DocumentValidationStatus.success &&
                !_ocrHasRun) {
              await _runOcrOnFirstImage();
            }
          },
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Form(
                      key: _formKey,
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
                          BlocBuilder<DocumentInformationCubit,
                              DocumentInformationState>(
                            builder: (context, infoState) {
                              // Null safety: jika data null, pakai list kosong
                              final uploadedTypes =
                                  (infoState.data ?? <dynamic>[])
                                      .where((e) =>
                                          (e.status ?? 0) != 0 &&
                                          e.electionType != null)
                                      .map((e) => e.electionType)
                                      .toSet();
                              return Semantics(
                                identifier: "dropdown_election_type",
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: state.electionType,
                                    items: context
                                        .read<DocumentValidationCubit>()
                                        .electionTypeValues
                                        .map((e) {
                                      final isUploaded =
                                          uploadedTypes.contains(e['value']);
                                      return DropdownMenuItem<String>(
                                        value: e['value'],
                                        enabled: !isUploaded,
                                        child: Text(
                                          e['label'],
                                          style: TextStyle(
                                            color: isUploaded
                                                ? Colors.grey
                                                : Colors.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null &&
                                          !uploadedTypes.contains(value)) {
                                        context
                                            .read<DocumentValidationCubit>()
                                            .changeElectionType(value);
                                      }
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          state.electionType == 'presidential'
                              ? Column(
                                  children: [
                                    SizedBox(height: 40),
                                    Text(
                                      "Hasil Rekapitulasi Suara",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ...state.presidentialCandidats
                                                  ?.asMap()
                                                  .entries
                                                  .map(
                                                (e) {
                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
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
                                                                              FontWeight.w700),
                                                                    ),
                                                                    Text(
                                                                      e.value.name ??
                                                                          '',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 12,
                                                                ),
                                                                Semantics(
                                                                  identifier:
                                                                      "vote_input_${e.key}",
                                                                  child:
                                                                      TextFormField(
                                                                    decoration: InputDecoration(
                                                                        enabledBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors
                                                                                    .grey,
                                                                                width:
                                                                                    1),
                                                                            borderRadius: BorderRadius.all(Radius.circular(
                                                                                20))),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black, width: 1),
                                                                            borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                        labelText: "jumlah suara"),
                                                                    controller:
                                                                        state.voteControllers[
                                                                            e.key],
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    inputFormatters: <TextInputFormatter>[
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp(r'[0-9]')),
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly
                                                                    ],
                                                                    validator: (v) => v ==
                                                                                null ||
                                                                            v.isEmpty
                                                                        ? 'Wajib diisi'
                                                                        : null,
                                                                  ),
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
                                    SizedBox(height: 8),
                                    SizedBox(height: 16),
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
                                child: Semantics(
                                  identifier: "carousel_document_images",
                                  child: CarouselSlider.builder(
                                    itemCount: widget.imagePaths.length,
                                    itemBuilder: (context, index, realIndex) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          File(widget.imagePaths[index]),
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
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Tanda Tangan Petugas",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Signature(
                              controller: _signatureController,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => _signatureController.clear(),
                                child: Text("Hapus"),
                              ),
                              SizedBox(width: 12),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          state.status == DocumentValidationStatus.success
                              ? Container(
                                  key:
                                      const ValueKey("container_button_lanjut"),
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Semantics(
                                    identifier: "button_lanjut",
                                    child: AMOutlinedButton(
                                      title: "Lanjut",
                                      onTap: () async {
                                        // Ambil uploadedTypes dari DocumentInformationCubit
                                        final infoState = context
                                            .read<DocumentInformationCubit>()
                                            .state;
                                        final uploadedTypes =
                                            (infoState.data ?? <dynamic>[])
                                                .where((e) =>
                                                    (e.status ?? 0) != 0 &&
                                                    e.electionType != null)
                                                .map((e) => e.electionType)
                                                .toSet();
                                        if (uploadedTypes
                                            .contains(state.electionType)) {
                                          _showError(
                                              "Dokumen ${state.electionType.toUpperCase()} sudah pernah di-upload, silakan pilih dokumen lain.");
                                          return;
                                        }
                                        // Validasi form
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          _showError(
                                              "Semua input suara harus diisi.");
                                          return;
                                        }
                                        // Validasi TTD
                                        if (!_signatureController.isNotEmpty) {
                                          _showError(
                                              "Tanda tangan harus diisi.");
                                          return;
                                        }
                                        final data = await _signatureController
                                            .toPngBytes(
                                          height: 360,
                                          width: 720,
                                        );
                                        setState(() {
                                          _signatureBytes = data;
                                        });
                                        if (!mounted) return;
                                        Navigator.pushNamed(
                                          context,
                                          ROUTER.documentRecapitulation,
                                          arguments: DocumentRecapitulationArgs(
                                            votes: state.presidentialCandidats!
                                                .asMap()
                                                .entries
                                                .map((e) => {
                                                      'candidat_name':
                                                          e.value.name,
                                                      'candidat_no': e.value.no,
                                                      'candidat_id': e.value.id,
                                                      'total_votes': state
                                                          .voteControllers[
                                                              e.key]
                                                          .text,
                                                    })
                                                .toList(),
                                            electionType: state.electionType,
                                            imagePaths: widget.imagePaths,
                                            signatureBytes: _signatureBytes,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        if (_isOcrLoading)
          Container(
            color: Colors.black.withAlpha((0.4 * 255).toInt()),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
