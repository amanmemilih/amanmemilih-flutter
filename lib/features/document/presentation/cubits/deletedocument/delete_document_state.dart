///
/// delete_document_state.dart
/// lib/features/document/presentation/cubits/delete_document
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'delete_document_cubit.dart';


enum DeleteDocumentStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class DeleteDocumentState with _$DeleteDocumentState {
  const factory DeleteDocumentState({
    required DeleteDocumentStatus status,
    required ErrorObject? error,
  }) = _DeleteDocumentState;

  factory DeleteDocumentState.initial() => const DeleteDocumentState(
    status: DeleteDocumentStatus.initial,
    error: null,
  );
}




