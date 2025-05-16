///
/// document_information_cubit.dart
/// lib/features/document/presentation/cubits/document_information
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/usecase/params.dart';
import 'package:amanmemilih_mobile_app/features/document/domain/entities/documentlist/document_list_entity.dart';
import 'package:amanmemilih_mobile_app/features/document/domain/usecases/get_document_list_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'document_information_state.dart';
part 'document_information_cubit.freezed.dart';

class DocumentInformationCubit extends Cubit<DocumentInformationState> {
  final GetDocumentListUseCase _useCase;

  DocumentInformationCubit(
    this._useCase,
  ) : super(DocumentInformationState.initial());

  void getData() async {
    emit(state.copyWith(status: DocumentInformationStatus.loading));

    final data = await _useCase.call(NoParams());

    return data.fold(
      (l) {
        if (!isClosed) {
          emit(state.copyWith(
            status: DocumentInformationStatus.error,
            error: ErrorObject.mapFailureToErrorObject(l),
          ));
        }
      },
      (r) {
        if (!isClosed) {
          emit(state.copyWith(
            status: DocumentInformationStatus.success,
            data: r,
          ));
        }
      },
    );
  }
}
