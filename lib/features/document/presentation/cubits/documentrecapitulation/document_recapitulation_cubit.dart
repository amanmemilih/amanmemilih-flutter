///
/// document_recapitulation_cubit.dart
/// lib/features/document/presentation/cubits/document_recapitulation
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/document/data/models/requests/upload_document_request.dart';
import 'package:amanmemilih_mobile_app/features/document/domain/usecases/upload_document_usecase.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/args/document_recapitulation_args.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'document_recapitulation_state.dart';
part 'document_recapitulation_cubit.freezed.dart';

class DocumentRecapitulationCubit extends Cubit<DocumentRecapitulationState> {
  final UploadDocumentUseCase _useCase;

  DocumentRecapitulationCubit(
    this._useCase,
  ) : super(DocumentRecapitulationState.initial());

  void uploadDocument(DocumentRecapitulationArgs args) async {
    emit(state.copyWith(status: DocumentRecapitulationStatus.loading));

    final result = await _useCase.call(UploadDocumentRequest(
      imagePaths: args.imagePaths,
      electionType: args.electionType,
      votes: args.electionType == 'presidential'
          ? args.votes
              .map((e) => UploadDocumentVoteRequest(
                  candidatId: e['candidat_id'],
                  totalVotes: int.parse(e['total_votes'])))
              .toList()
          : [],
    ));

    result.fold(
      (l) => emit(state.copyWith(
        status: DocumentRecapitulationStatus.error,
        error: ErrorObject.mapFailureToErrorObject(l),
      )),
      (r) => emit(state.copyWith(
        status: DocumentRecapitulationStatus.success,
      )),
    );
  }

  void changeDocumentIndex(int index) {
    emit(state.copyWith(
      documentIndex: index,
    ));
  }
}
