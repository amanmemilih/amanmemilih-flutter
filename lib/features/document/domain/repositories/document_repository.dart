///
/// document_repository.dart
/// lib/features/document/domain/repositories
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/document/data/models/requests/upload_document_request.dart';
import 'package:amanmemilih_mobile_app/features/document/domain/entities/documentlist/document_list_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class DocumentRepository {
  Future<Either<Failure, List<DocumentListEntity>?>> getListDocument();
  Future<Either<Failure, void>> uploadDocument(UploadDocumentRequest request);
}
