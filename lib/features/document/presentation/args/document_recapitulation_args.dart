import 'dart:typed_data';

class DocumentRecapitulationArgs {
  final List<Map<String, dynamic>> votes;
  final List<String> imagePaths;
  final String electionType;
  final Uint8List? signatureBytes;

  DocumentRecapitulationArgs({
    required this.votes,
    required this.imagePaths,
    required this.electionType,
    this.signatureBytes,
  });
}
