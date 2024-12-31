///
/// document_remote_data_source.dart
/// lib/features/document/data/datasources
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'dart:io';

import 'package:amanmemilih_mobile_app/features/document/data/models/requests/upload_document_request.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api.dart';

abstract class DocumentRemoteDataSource {
  Future<ApiResponse> getListDocument();
  Future<ApiResponse> getDetailDocument(String? electionType, int? id);
  Future<ApiResponse> documentVerification(String? electionType, int? id);
  Future<ApiResponse> uploadDocument(UploadDocumentRequest request);
}

class ApiDocumentRemoteDataSource extends DocumentRemoteDataSource {
  final Api _api;

  ApiDocumentRemoteDataSource(this._api);

  @override
  Future<ApiResponse> getListDocument() {
    return _api.get('documents');
  }

  @override
  Future<ApiResponse> getDetailDocument(String? electionType, int? id) {
    return _api.get('documents/$id', queryParameters: {
      'election_type': electionType.toString(),
    });
  }

  @override
  Future<ApiResponse> uploadDocument(UploadDocumentRequest request) {
    final formData = getIt<ApiFormData>();

    formData.addField('election_type', request.electionType ?? "");

    // Votes
    var index = 0;
    for (final UploadDocumentVoteRequest row in request.votes ?? []) {
      formData.addField("vote[$index][candidat_id]", "${row.candidatId}");
      formData.addField("vote[$index][total_votes]", "${row.totalVotes}");
      index++;
    }

    // Documents
    for (final String row in request.imagePaths ?? []) {
      formData.addFile('documents[]', File(row));
    }

    return _api.post(
      'documents',
      formData: formData,
      options: Options(
        contentType: Headers.multipartFormDataContentType,
      ),
    );
  }

  @override
  Future<ApiResponse> documentVerification(String? electionType, int? id) {
    return _api.post('documents/$id/verified', formObj: {
      'election_type': electionType.toString(),
    });
  }
}
