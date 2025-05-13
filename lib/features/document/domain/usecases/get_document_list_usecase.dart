///
/// get_document_list_usecase.dart
/// lib/features/document/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/usecase/params.dart';
import 'package:amanmemilih_mobile_app/features/document/domain/entities/documentlist/document_list_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/document_repository.dart';

final class GetDocumentListUseCase
    extends UseCase<List<DocumentListEntity>?, NoParams> {
  final DocumentRepository _repository;

  GetDocumentListUseCase(this._repository);

  @override
  Future<Either<Failure, List<DocumentListEntity>?>> call(NoParams params) =>
      _repository.getListDocument();
}
