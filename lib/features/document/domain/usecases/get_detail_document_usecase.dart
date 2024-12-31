///
/// get_detail_document_usecase.dart
/// lib/features/document/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/document/domain/entities/detaildocument/detail_document_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/document_repository.dart';

final class GetDetailDocumentUseCase
    extends UseCase<DetailDocumentEntity?, GetDetailDocumentParams> {
  final DocumentRepository _repository;

  GetDetailDocumentUseCase(this._repository);

  @override
  Future<Either<Failure, DetailDocumentEntity?>> call(
          GetDetailDocumentParams params) =>
      _repository.getDetailDocument(params.electionType, params.id);
}

class GetDetailDocumentParams extends Equatable {
  final int? id;
  final String? electionType;

  const GetDetailDocumentParams({this.id, this.electionType});

  @override
  List<Object?> get props => [id, electionType];
}
