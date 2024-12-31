///
/// document_detail_state.dart
/// lib/features/document/presentation/cubits/document_detail
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'document_detail_cubit.dart';

enum DocumentDetailStatus {
  initial,
  loading,
  success,
  error,
  submitting,
}

@freezed
sealed class DocumentDetailState with _$DocumentDetailState {
  const factory DocumentDetailState({
    required DocumentDetailStatus status,
    required ErrorObject? error,
    DetailDocumentEntity? data,
  }) = _DocumentDetailState;

  factory DocumentDetailState.initial() => const DocumentDetailState(
        status: DocumentDetailStatus.initial,
        error: null,
      );
}
