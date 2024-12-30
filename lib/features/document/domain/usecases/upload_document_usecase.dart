///
/// upload_document_usecase.dart
/// lib/features/document/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/document/data/models/requests/upload_document_request.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/document_repository.dart';

final class UploadDocumentUseCase extends UseCase<void, UploadDocumentRequest> {
  final DocumentRepository _repository;

  UploadDocumentUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(UploadDocumentRequest params) =>
      _repository.uploadDocument(params);
}
