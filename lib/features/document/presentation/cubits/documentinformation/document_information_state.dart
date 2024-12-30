///
/// document_information_state.dart
/// lib/features/document/presentation/cubits/document_information
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'document_information_cubit.dart';

enum DocumentInformationStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class DocumentInformationState with _$DocumentInformationState {
  const factory DocumentInformationState({
    required DocumentInformationStatus status,
    required ErrorObject? error,
    List<DocumentListEntity>? data,
  }) = _DocumentInformationState;

  factory DocumentInformationState.initial() => const DocumentInformationState(
        status: DocumentInformationStatus.initial,
        error: null,
      );
}
