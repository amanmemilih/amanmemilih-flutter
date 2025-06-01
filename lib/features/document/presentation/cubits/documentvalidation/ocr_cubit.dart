import 'package:flutter_bloc/flutter_bloc.dart';

class OcrState {
  final String rawText;
  final List<String> parsedVotes; // List hasil parsing suara per paslon
  final bool isLoading;
  final String? error;

  OcrState({
    this.rawText = '',
    this.parsedVotes = const [],
    this.isLoading = false,
    this.error,
  });

  OcrState copyWith({
    String? rawText,
    List<String>? parsedVotes,
    bool? isLoading,
    String? error,
  }) {
    return OcrState(
      rawText: rawText ?? this.rawText,
      parsedVotes: parsedVotes ?? this.parsedVotes,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class OcrCubit extends Cubit<OcrState> {
  OcrCubit() : super(OcrState());

  void onOcrResult(String text) {
    // Parsing hasil OCR ke list suara per paslon
    final lines = text.split('\n');
    final List<String> votes = [];
    for (var line in lines) {
      final match =
          RegExp(r'(\d+)\.\s+([A-Za-z\- ]+):\s*(\d+)').firstMatch(line);
      if (match != null) {
        votes.add(match.group(3)!); // Ambil angka suara
      }
    }
    emit(state.copyWith(rawText: text, parsedVotes: votes));
  }

  void setLoading(bool loading) {
    emit(state.copyWith(isLoading: loading));
  }

  void setError(String error) {
    emit(state.copyWith(error: error));
  }

  void clear() {
    emit(OcrState());
  }
}
