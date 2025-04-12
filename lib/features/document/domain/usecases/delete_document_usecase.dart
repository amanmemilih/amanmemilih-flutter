///
/// delete_document_usecase.dart
/// lib/features/document/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/document_repository.dart';

final class DeleteDocumentUseCase extends UseCase<void, DeleteDocumentParams> {
  final DocumentRepository _repository;

  DeleteDocumentUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(DeleteDocumentParams params) =>
      _repository.deleteDocument(params.electionType, params.id);
}

class DeleteDocumentParams extends Equatable {
  final int? id;
  final String? electionType;

  const DeleteDocumentParams({this.id, this.electionType});

  @override
  List<Object?> get props => [id, electionType];
}
