///
/// delete_document_cubit.dart
/// lib/features/document/presentation/cubits/delete_document
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/document/domain/usecases/delete_document_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'delete_document_state.dart';
part 'delete_document_cubit.freezed.dart';

class DeleteDocumentCubit extends Cubit<DeleteDocumentState> {
  final DeleteDocumentUseCase _useCase;

  DeleteDocumentCubit(this._useCase) : super(DeleteDocumentState.initial());

  void deleteDocument(String? electionType, int? id) async {
    emit(state.copyWith(status: DeleteDocumentStatus.loading));

    final data = await _useCase
        .call(DeleteDocumentParams(electionType: electionType, id: id));

    data.fold(
      (l) {
        if (!isClosed) {
          emit(state.copyWith(
            status: DeleteDocumentStatus.error,
            error: ErrorObject.mapFailureToErrorObject(l),
          ));
        }
      },
      (r) {
        if (!isClosed) {
          emit(state.copyWith(
            status: DeleteDocumentStatus.success,
          ));
        }
      },
    );
  }
}
