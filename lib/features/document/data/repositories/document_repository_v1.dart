///
/// document_repository_v1.dart
/// lib/features/document/data/repositories
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/models/empty/empty_model.dart';
import 'package:amanmemilih_mobile_app/core/models/list/list_model.dart';
import 'package:amanmemilih_mobile_app/core/models/single/single_model.dart';
import 'package:amanmemilih_mobile_app/features/document/data/models/requests/upload_document_request.dart';
import 'package:amanmemilih_mobile_app/features/document/domain/entities/detaildocument/detail_document_entity.dart';
import 'package:amanmemilih_mobile_app/features/document/domain/entities/documentlist/document_list_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/repositories/document_repository.dart';
import '../datasources/document_remote_data_source.dart';

class DocumentRepositoryV1 extends DocumentRepository {
  final DocumentRemoteDataSource _remoteDataSource;

  DocumentRepositoryV1(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, void>> uploadDocument(
      UploadDocumentRequest request) async {
    try {
      final response = await _remoteDataSource.uploadDocument(request);
      final model = EmptyModel.fromJson(response.data);

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      return Right(true);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<DocumentListEntity>?>> getListDocument() async {
    try {
      final response = await _remoteDataSource.getListDocument();
      final model = ListModel.fromJson(
          response.data, (p0) => DocumentListEntity.fromJson(p0));

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      return Right(model.data!);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }

  @override
  Future<Either<Failure, DetailDocumentEntity?>> getDetailDocument(
      String? electionType, int? id) async {
    try {
      final response =
          await _remoteDataSource.getDetailDocument(electionType, id);

      final model = SingleModel.fromJson(
          response.data, (p0) => DetailDocumentEntity.fromJson(p0));

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      return Right(model.data!);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> documentVerification(
      String? electionType, int? id) async {
    try {
      final response =
          await _remoteDataSource.documentVerification(electionType, id);
      final model = EmptyModel.fromJson(response.data);

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      return Right(true);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }
}
