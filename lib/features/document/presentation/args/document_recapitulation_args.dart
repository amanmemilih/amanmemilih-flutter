class DocumentRecapitulationArgs {
  final List<Map<String, dynamic>> votes;
  final List<String> imagePaths;
  final String electionType;

  DocumentRecapitulationArgs({
    required this.votes,
    required this.imagePaths,
    required this.electionType,
  });
}
