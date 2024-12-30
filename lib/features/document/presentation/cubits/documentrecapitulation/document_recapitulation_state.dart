///
/// document_recapitulation_state.dart
/// lib/features/document/presentation/cubits/document_recapitulation
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'document_recapitulation_cubit.dart';

enum DocumentRecapitulationStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class DocumentRecapitulationState with _$DocumentRecapitulationState {
  const factory DocumentRecapitulationState({
    required DocumentRecapitulationStatus status,
    required ErrorObject? error,
    required int documentIndex,
  }) = _DocumentRecapitulationState;

  factory DocumentRecapitulationState.initial() =>
      const DocumentRecapitulationState(
        status: DocumentRecapitulationStatus.initial,
        error: null,
        documentIndex: 0,
      );
}
