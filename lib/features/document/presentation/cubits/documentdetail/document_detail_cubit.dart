///
/// document_detail_cubit.dart
/// lib/features/document/presentation/cubits/document_detail
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/document/domain/entities/detaildocument/detail_document_entity.dart';
import 'package:amanmemilih_mobile_app/features/document/domain/usecases/document_verification_usecase.dart';
import 'package:amanmemilih_mobile_app/features/document/domain/usecases/get_detail_document_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'document_detail_state.dart';
part 'document_detail_cubit.freezed.dart';

class DocumentDetailCubit extends Cubit<DocumentDetailState> {
  final GetDetailDocumentUseCase _getDetailDocumentUseCase;
  final DocumentVerificationUseCase _documentVerificationUseCase;

  DocumentDetailCubit(
    this._getDetailDocumentUseCase,
    this._documentVerificationUseCase,
  ) : super(DocumentDetailState.initial());

  void getData(String? electionType, int? id) async {
    emit(state.copyWith(status: DocumentDetailStatus.loading));

    final data = await _getDetailDocumentUseCase
        .call(GetDetailDocumentParams(electionType: electionType, id: id));

    return data.fold(
        (l) => emit(state.copyWith(
              status: DocumentDetailStatus.error,
              error: ErrorObject.mapFailureToErrorObject(l),
            )),
        (r) => emit(state.copyWith(
              status: DocumentDetailStatus.success,
              data: r,
            )));
  }

  void documentVerification(String? electionType, int? id) async {
    emit(state.copyWith(status: DocumentDetailStatus.submitting));

    final data = await _documentVerificationUseCase
        .call(DocumentVerificationParams(electionType: electionType, id: id));

    return data.fold(
        (l) => emit(state.copyWith(
              status: DocumentDetailStatus.error,
              error: ErrorObject.mapFailureToErrorObject(l),
            )),
        (r) => emit(state.copyWith(
              status: DocumentDetailStatus.success,
            )));
  }
}
