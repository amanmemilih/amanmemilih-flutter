///
/// document_validation_state.dart
/// lib/features/document/presentation/cubits/document_validation
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'document_validation_cubit.dart';

enum DocumentValidationStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class DocumentValidationState with _$DocumentValidationState {
  const factory DocumentValidationState({
    required DocumentValidationStatus status,
    required ErrorObject? error,
    required int documentIndex,
    required List<TextEditingController> voteControllers,
    required String electionType,
    List<PresidentialCandidatEntity>? presidentialCandidats,
  }) = _DocumentValidationState;

  factory DocumentValidationState.initial() => const DocumentValidationState(
        status: DocumentValidationStatus.initial,
        error: null,
        documentIndex: 0,
        voteControllers: [],
        electionType: 'presidential',
      );
}
