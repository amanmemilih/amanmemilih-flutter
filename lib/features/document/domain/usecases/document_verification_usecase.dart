///
/// document_verification_usecase.dart
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

final class DocumentVerificationUseCase
    extends UseCase<void, DocumentVerificationParams> {
  final DocumentRepository _repository;

  DocumentVerificationUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(DocumentVerificationParams params) =>
      _repository.documentVerification(params.electionType, params.id);
}

class DocumentVerificationParams extends Equatable {
  final int? id;
  final String? electionType;

  const DocumentVerificationParams({this.id, this.electionType});

  @override
  List<Object?> get props => [id, electionType];
}
