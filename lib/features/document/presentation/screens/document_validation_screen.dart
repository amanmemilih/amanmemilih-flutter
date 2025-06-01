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
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

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
  }

  Future<void> _runOcrOnFirstImage() async {
    setState(() {
      _isOcrLoading = true;
    });
    try {
      final imageFile = File(widget.imagePaths[0]);
      final votes = await extractPaslonVotes(imageFile);
      final cubit = context.read<DocumentValidationCubit>();
      cubit.setVoteControllersFromOcr(votes);
    } catch (e) {
      // Bisa tampilkan error jika mau
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
                          Semantics(
                            identifier: "dropdown_election_type",
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
                                            .toPngBytes();
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

// Fungsi untuk ekstraksi suara paslon dari gambar C1
Future<List<String>> extractPaslonVotes(File imageFile) async {
  final inputImage = InputImage.fromFile(imageFile);
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final RecognizedText recognizedText =
      await textRecognizer.processImage(inputImage);
  await textRecognizer.close();

  // Ambil baris kapital besar (tulisan suara di tengah)
  final lines = recognizedText.text.split('\n');
  print('--- OCR RAW LINES ---');
  for (final l in lines) {
    print(l);
  }
  final onlyCaps = RegExp(r'^[A-Z ]{5,}$');
  final List<String> candidateLines = [];
  print('--- OCR FILTERED KAPITAL ---');
  for (final line in lines) {
    final l = line.trim();
    if (onlyCaps.hasMatch(l) && l.split(' ').length <= 5) {
      print(l);
      candidateLines.add(l);
    }
  }

  // Konversi ke angka
  final List<String> votes = [];
  for (final l in candidateLines) {
    final parsed = _parseIndonesianNumber(l);
    if (parsed != null) votes.add(parsed.toString());
  }

  // Ambil 3 suara pertama (atau kosong jika kurang)
  return List.generate(3, (i) => i < votes.length ? votes[i] : '');
}

int levenshtein(String s, String t) {
  if (s == t) return 0;
  if (s.isEmpty) return t.length;
  if (t.isEmpty) return s.length;
  List<List<int>> d =
      List.generate(s.length + 1, (_) => List.filled(t.length + 1, 0));
  for (int i = 0; i <= s.length; i++) d[i][0] = i;
  for (int j = 0; j <= t.length; j++) d[0][j] = j;
  for (int i = 1; i <= s.length; i++) {
    for (int j = 1; j <= t.length; j++) {
      int cost = s[i - 1] == t[j - 1] ? 0 : 1;
      d[i][j] = [d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost]
          .reduce((a, b) => a < b ? a : b);
    }
  }
  return d[s.length][t.length];
}

int? _parseIndonesianNumber(String text) {
  final map = {
    'NOL': 0,
    'SATU': 1,
    'DUA': 2,
    'TIGA': 3,
    'EMPAT': 4,
    'LIMA': 5,
    'ENAM': 6,
    'TUJUH': 7,
    'DELAPAN': 8,
    'SEMBILAN': 9,
    'SEPULUH': 10,
    'SEBELAS': 11,
    'DUA BELAS': 12,
    'TIGA BELAS': 13,
    'EMPAT BELAS': 14,
    'LIMA BELAS': 15,
    'DUA PULUH': 20,
    'TIGA PULUH': 30,
    'EMPAT PULUH': 40,
    'LIMA PULUH': 50,
    'SEMBILAN BELAS': 19,
    'SERATUS': 100,
    'SERIBU': 1000,
  };
  text = text.trim().toUpperCase();
  text = text
      .replaceAll('1', 'I')
      .replaceAll('0', 'O')
      .replaceAll('5', 'S')
      .replaceAll('8', 'B')
      .replaceAll('6', 'G')
      .replaceAll('2', 'Z');
  // Split frasa menjadi kata
  final words = text.split(' ');
  int total = 0;
  for (var word in words) {
    // Replace typo manual per kata
    word = word
        .replaceAll('SESELAH', 'SEBELAS')
        .replaceAll('SEBILAS', 'SEBELAS')
        .replaceAll('SEBELA', 'SEBELAS')
        .replaceAll('SEBELLAS', 'SEBELAS')
        .replaceAll('OUA', 'DUA')
        .replaceAll('TLGA', 'TIGA')
        .replaceAll('L1MA', 'LIMA')
        .replaceAll('T1GA', 'TIGA')
        .replaceAll('ENAN', 'ENAM')
        .replaceAll('TUJU', 'TUJUH')
        .replaceAll('DELAPAN', 'DELAPAN')
        .replaceAll('SEMB1LAN', 'SEMBILAN');
    // Fuzzy match per kata
    String? bestMatch;
    int minDist = 2;
    for (final key in map.keys.where((k) => k.split(' ').length == 1)) {
      int dist = levenshtein(word, key);
      if (dist < minDist) {
        minDist = dist;
        bestMatch = key;
      }
    }
    if (bestMatch != null) {
      total += map[bestMatch]!;
    }
  }
  // Cek juga frasa penuh (untuk kasus seperti 'DUA PULUH', 'SERATUS', dsb)
  if (map.containsKey(text)) return map[text];
  // Fuzzy match frasa penuh
  int minDist = 3;
  String? bestMatch;
  for (final key in map.keys) {
    int dist = levenshtein(text, key);
    if (dist < minDist) {
      minDist = dist;
      bestMatch = key;
    }
  }
  if (bestMatch != null) return map[bestMatch];
  // Jika total > 0, return total
  return total > 0 ? total : null;
}
