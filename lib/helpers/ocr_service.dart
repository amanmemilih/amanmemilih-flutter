import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String get googleVisionApiKey => dotenv.env['GOOGLE_VISION_API_KEY'] ?? '';

class OcrService {
  /// OCR satu gambar, parsing suara paslon (umum)
  static Future<List<String>> extractPaslonVotes(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    await textRecognizer.close();

    // Ambil baris kapital besar (tulisan suara di tengah)
    final lines = recognizedText.text.split('\n');
    final onlyCaps = RegExp(r'^[A-Z ]{5,}0$');
    final List<String> candidateLines = [];
    for (final line in lines) {
      final l = line.trim();
      if (onlyCaps.hasMatch(l) && l.split(' ').length <= 5) {
        candidateLines.add(l);
      }
    }

    // Konversi ke angka
    final List<String> votes = [];
    for (final l in candidateLines) {
      final parsed = parseOcrToNumberChained(l);
      if (parsed != null) votes.add(parsed.toString());
    }

    // Ambil 3 suara pertama (atau kosong jika kurang)
    return List.generate(3, (i) => i < votes.length ? votes[i] : '');
  }

  /// Region-based OCR: crop 3 region suara paslon dari XFile dan jalankan OCR per region
  static Future<Map<String, String>> regionBasedOcr(XFile xfile) async {
    // Load image bytes
    final bytes = await xfile.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) throw Exception('Gagal decode image');

    // Definisikan region (koordinat untuk 1080x1920, tweak jika perlu)
    final regions = <String, List<int>>{
      'paslon1': [700, 200, 300, 100],
      'paslon2': [700, 650, 300, 100],
      'paslon3': [700, 1080, 300, 100],
    };

    final recognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final result = <String, String>{};
    try {
      for (final entry in regions.entries) {
        final x = entry.value[0],
            y = entry.value[1],
            w = entry.value[2],
            h = entry.value[3];
        final cropped = img.copyCrop(image, x: x, y: y, width: w, height: h);
        final croppedBytes = img.encodeJpg(cropped);
        final inputImage =
            InputImage.fromFilePath(await _writeTempJpg(croppedBytes));
        final recognized = await recognizer.processImage(inputImage);
        result[entry.key] = recognized.text.trim();
      }
    } finally {
      await recognizer.close();
    }
    return result;
  }

  /// Helper untuk menulis bytes ke file temporer
  static Future<String> _writeTempJpg(List<int> bytes) async {
    final dir = await getTemporaryDirectory();
    final file = File(
        '${dir.path}/ocr_crop_${DateTime.now().millisecondsSinceEpoch}.jpg');
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  /// Fungsi utilitas: chaining parsing hasil OCR dengan 3 metode
  static int? parseOcrToNumberChained(String ocrRaw) {
    // 1. Coba parsing dengan parser toleran typo/fuzzy
    int? angka = IndonesianNumberOcrParser.parse(ocrRaw);
    if (angka != null) return angka;
    // 2. Jika gagal, coba parsing dengan WordToNumber (untuk input yang sudah bersih)
    angka = WordToNumber.convert(ocrRaw);
    if (angka != null) return angka;
    // 3. Fallback: parsing manual (misal: cek jika input numerik langsung)
    final cleaned = ocrRaw.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.isNotEmpty) {
      return int.tryParse(cleaned);
    }
    // 4. Jika semua gagal, return null
    return null;
  }

  /// Levenshtein Distance (edit distance)
  static int levenshtein(String s, String t) {
    if (s == t) return 0;
    if (s.isEmpty) return t.length;
    if (t.isEmpty) return s.length;
    List<List<int>> d =
        List.generate(s.length + 1, (_) => List.filled(t.length + 1, 0));
    for (int i = 0; i <= s.length; i++) {
      d[i][0] = i;
    }
    for (int j = 0; j <= t.length; j++) {
      d[0][j] = j;
    }
    for (int i = 1; i <= s.length; i++) {
      for (int j = 1; j <= t.length; j++) {
        int cost = s[i - 1] == t[j - 1] ? 0 : 1;
        d[i][j] = [d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost]
            .reduce((a, b) => a < b ? a : b);
      }
    }
    return d[s.length][t.length];
  }

  Future<String?> ocrWithGoogleVision(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    final url =
        'https://vision.googleapis.com/v1/images:annotate?key=$googleVisionApiKey';
    final body = {
      "requests": [
        {
          "image": {"content": base64Image},
          "features": [
            {"type": "TEXT_DETECTION"}
          ]
        }
      ]
    };

    final dio = Dio();
    try {
      final response = await dio.post(
        url,
        data: jsonEncode(body),
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final text = data['responses'][0]['fullTextAnnotation']?['text'];
        return text;
      } else {
        print('Error: ${response.data}');
        return null;
      }
    } catch (e) {
      print('Dio error: $e');
      return null;
    }
  }
}

class WordToNumber {
  static const Map<String, int> _units = {
    "NOL": 0,
    "SATU": 1,
    "DUA": 2,
    "TIGA": 3,
    "EMPAT": 4,
    "LIMA": 5,
    "ENAM": 6,
    "TUJUH": 7,
    "DELAPAN": 8,
    "SEMBILAN": 9,
  };

  static const Map<String, int> _teens = {
    "SEPULUH": 10,
    "SEBELAS": 11,
    "DUA BELAS": 12,
    "TIGA BELAS": 13,
    "EMPAT BELAS": 14,
    "LIMA BELAS": 15,
    "ENAM BELAS": 16,
    "TUJUH BELAS": 17,
    "DELAPAN BELAS": 18,
    "SEMBILAN BELAS": 19,
  };

  static const Map<String, int> _tens = {
    "DUA PULUH": 20,
    "TIGA PULUH": 30,
    "EMPAT PULUH": 40,
    "LIMA PULUH": 50,
    "ENAM PULUH": 60,
    "TUJUH PULUH": 70,
    "DELAPAN PULUH": 80,
    "SEMBILAN PULUH": 90,
  };

  /// Convert number words (0-99, Bahasa Indonesia) to int
  static int? convert(String input) {
    if (input.trim().isEmpty) return null;
    // Normalisasi: uppercase, hapus spasi ganda
    final normalized = input
        .toUpperCase()
        .replaceAll(RegExp(r'[^A-Z ]'), ' ')
        .replaceAll(RegExp(r' +'), ' ')
        .trim();

    // 1. Cek satuan langsung
    if (_units.containsKey(normalized)) return _units[normalized];

    // 2. Cek belasan (SEPULUH, SEBELAS, DUA BELAS, dst)
    if (_teens.containsKey(normalized)) return _teens[normalized];

    // 3. Cek puluhan bulat (DUA PULUH, TIGA PULUH, dst)
    if (_tens.containsKey(normalized)) return _tens[normalized];

    // 4. Cek pola "[PULUH] [SATUAN]" (misal: DUA PULUH SATU)
    final words = normalized.split(' ');
    if (words.length == 3 &&
        words[1] == 'PULUH' &&
        _units.containsKey(words[0]) &&
        _units.containsKey(words[2])) {
      final puluh = _units[words[0]]!;
      final satuan = _units[words[2]]!;
      return puluh * 10 + satuan;
    }

    // 5. Cek pola "[PULUH] [SATUAN]" dengan spasi berlebih
    if (words.length > 3) {
      // Gabungkan kata ke-1 dan ke-2 untuk puluhan, sisanya satuan
      final puluhPhrase = '${words[0]} ${words[1]}';
      final satuanPhrase = words.sublist(2).join(' ');
      if (_tens.containsKey(puluhPhrase) && _units.containsKey(satuanPhrase)) {
        return _tens[puluhPhrase]! + _units[satuanPhrase]!;
      }
    }

    return null; // Tidak dikenali
  }
}

class IndonesianNumberOcrParser {
  // Daftar frasa angka valid dan mapping ke nilai numerik
  static const Map<String, int> _numberMap = {
    "NOL": 0,
    "SATU": 1,
    "DUA": 2,
    "TIGA": 3,
    "EMPAT": 4,
    "LIMA": 5,
    "ENAM": 6,
    "TUJUH": 7,
    "DELAPAN": 8,
    "SEMBILAN": 9,
    "SEPULUH": 10,
    "SEBELAS": 11,
    "DUA BELAS": 12,
    "TIGA BELAS": 13,
    "EMPAT BELAS": 14,
    "LIMA BELAS": 15,
    "ENAM BELAS": 16,
    "TUJUH BELAS": 17,
    "DELAPAN BELAS": 18,
    "SEMBILAN BELAS": 19,
    "DUA PULUH": 20,
    "TIGA PULUH": 30,
    "EMPAT PULUH": 40,
    "LIMA PULUH": 50,
    "ENAM PULUH": 60,
    "TUJUH PULUH": 70,
    "DELAPAN PULUH": 80,
    "SEMBILAN PULUH": 90,
    "SERATUS": 100,
    "SERIBU": 1000,
  };

  // Daftar typo umum dan perbaikannya
  static const Map<String, String> _typoMap = {
    // Satuan
    "LMA": "LIMA",
    "L1MA": "LIMA",
    "T1GA": "TIGA",
    "TLGA": "TIGA",
    "ENAN": "ENAM",
    "TUJU": "TUJUH",
    "SEMB1LAN": "SEMBILAN",
    "SEBILAN": "SEMBILAN",
    "DELAPAM": "DELAPAN",
    // Puluhan
    "DLA PULUH": "DUA PULUH",
    "DLA": "DUA",
    "OUA": "DUA",
    "LMA PULUH": "LIMA PULUH",
    "T1GA PULUH": "TIGA PULUH",
    "TLGA PULUH": "TIGA PULUH",
    "ENAM PULUH": "ENAM PULUH",
    "TUJU PULUH": "TUJUH PULUH",
    "DELAPAN PULUH": "DELAPAN PULUH",
    // Belasan
    "SESELAH": "SEBELAS",
    "SEBILAS": "SEBELAS",
    "SEBELA": "SEBELAS",
    "SEBELLAS": "SEBELAS",
    "SEMBILAH BELAS": "SEMBILAN BELAS",
    // Ratusan
    "SERATOS": "SERATUS",
    "SERATU": "SERATUS",
    "SERATUSS": "SERATUS",
    // Ribuan
    "SERIBU": "SERIBU",
    // Lain-lain typo umum
    "O": "0",
    "I": "1",
    "S": "5",
    "B": "8",
    "G": "6",
  };

  /// Public method: dari hasil OCR, return angka (int) atau null jika gagal
  static int? parse(String ocrText) {
    if (ocrText.trim().isEmpty) return null;
    String normalized = _normalize(ocrText);
    normalized = _replaceTypos(normalized);
    // Fuzzy match ke frasa penuh dulu
    final bestPhrase = _fuzzyMatch(normalized, _numberMap.keys.toList());
    if (bestPhrase != null && _levenshtein(normalized, bestPhrase) <= 2) {
      return _numberMap[bestPhrase];
    }
    // Jika tidak ketemu, coba per kata (untuk kasus typo berat)
    final words = normalized.split(' ');
    int total = 0;
    bool found = false;
    for (final word in words) {
      final bestWord = _fuzzyMatch(
          word, _numberMap.keys.where((k) => !k.contains(' ')).toList());
      if (bestWord != null && _levenshtein(word, bestWord) <= 2) {
        total += _numberMap[bestWord]!;
        found = true;
      }
    }
    // Parsing kombinasi ratusan + puluhan + satuan (misal: SERATUS DUA PULUH TIGA)
    if (!found && words.length >= 2) {
      int sum = 0;
      int? lastValue;
      for (int i = 0; i < words.length; i++) {
        String sub = words.sublist(i).join(' ');
        final best = _fuzzyMatch(sub, _numberMap.keys.toList());
        if (best != null && _levenshtein(sub, best) <= 2) {
          sum += _numberMap[best]!;
          lastValue = _numberMap[best];
          break;
        }
      }
      if (lastValue != null) {
        // Cek sisa kata di depan
        final sisa = words.sublist(0, words.length - 1).join(' ');
        final sisaVal = parse(sisa);
        if (sisaVal != null) sum += sisaVal;
        if (sum > 0) return sum;
      }
    }
    // Jika masih tidak ketemu, coba parse angka langsung dan hapus semua leading zero
    if (!found) {
      final digits = normalized.replaceAll(RegExp(r'[^0-9]'), '');
      if (digits.isNotEmpty) {
        // Hapus semua angka 0 di depan, kecuali jika hasil akhirnya kosong (artinya 0)
        final cleaned = digits.replaceFirst(RegExp(r'^0+'), '');
        return int.tryParse(cleaned.isEmpty ? '0' : cleaned);
      }
    }
    return found ? total : null;
  }

  /// Normalisasi: uppercase, hapus non-alphabet, trim spasi ganda
  static String _normalize(String text) {
    final upper = text.toUpperCase();
    final onlyAlpha = upper.replaceAll(RegExp(r'[^A-Z ]'), ' ');
    return onlyAlpha.replaceAll(RegExp(r' +'), ' ').trim();
  }

  /// Replace typo umum berdasarkan _typoMap
  static String _replaceTypos(String text) {
    String result = text;
    _typoMap.forEach((k, v) {
      result = result.replaceAll(k, v);
    });
    return result;
  }

  /// Fuzzy match: cari string di candidates yang paling mirip dengan input
  static String? _fuzzyMatch(String input, List<String> candidates) {
    int minDist = 1000;
    String? best;
    for (final cand in candidates) {
      final dist = _levenshtein(input, cand);
      if (dist < minDist) {
        minDist = dist;
        best = cand;
      }
    }
    return best;
  }

  /// Levenshtein Distance (edit distance)
  static int _levenshtein(String s, String t) {
    if (s == t) return 0;
    if (s.isEmpty) return t.length;
    if (t.isEmpty) return s.length;
    List<List<int>> d =
        List.generate(s.length + 1, (_) => List.filled(t.length + 1, 0));
    for (int i = 0; i <= s.length; i++) {
      d[i][0] = i;
    }
    for (int j = 0; j <= t.length; j++) {
      d[0][j] = j;
    }
    for (int i = 1; i <= s.length; i++) {
      for (int j = 1; j <= t.length; j++) {
        int cost = s[i - 1] == t[j - 1] ? 0 : 1;
        d[i][j] = [d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost]
            .reduce((a, b) => a < b ? a : b);
      }
    }
    return d[s.length][t.length];
  }
}
