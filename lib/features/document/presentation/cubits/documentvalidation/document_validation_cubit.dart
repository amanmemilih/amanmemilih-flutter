///
/// document_validation_cubit.dart
/// lib/features/document/presentation/cubits/document_validation
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/usecase/params.dart';
import 'package:amanmemilih_mobile_app/features/candidat/domain/entities/presidentialcandidat/presidential_candidat_entity.dart';
import 'package:amanmemilih_mobile_app/features/candidat/domain/usecases/get_presidential_candidat_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/errors.dart';

part 'document_validation_state.dart';
part 'document_validation_cubit.freezed.dart';

class DocumentValidationCubit extends Cubit<DocumentValidationState> {
  final GetPresidentialCandidatUseCase _presidentialCandidatUseCase;

  final List<Map<String, dynamic>> electionTypeValues = [
    {
      'label': "PILPRES",
      'value': 'presidential',
    },
    {
      'label': "PILEG DPR",
      'value': 'dpr',
    },
    {
      'label': "PILEG DPRD PROVINSI",
      'value': 'dprd_province',
    },
    {
      'label': "PILEG DPRD KAB/KOTA",
      'value': 'dprd_district',
    },
    {
      'label': "PEMILU DPD",
      'value': 'dpd',
    },
  ];

  DocumentValidationCubit(this._presidentialCandidatUseCase)
      : super(DocumentValidationState.initial());

  void getData() async {
    emit(state.copyWith(status: DocumentValidationStatus.loading));

    final data = await _presidentialCandidatUseCase.call(NoParams());

    return data.fold(
        (l) => emit(state.copyWith(
              status: DocumentValidationStatus.error,
              error: ErrorObject.mapFailureToErrorObject(l),
            )), (r) {
      emit(state.copyWith(
        status: DocumentValidationStatus.success,
        presidentialCandidats: r,
        voteControllers: List.generate(
          r!.length,
          (index) => TextEditingController(),
        ),
      ));
    });
  }

  void changeElectionType(String type) {
    emit(state.copyWith(
      electionType: type,
    ));
  }

  void changeDocumentIndex(int index) {
    emit(state.copyWith(
      documentIndex: index,
    ));
  }
}
