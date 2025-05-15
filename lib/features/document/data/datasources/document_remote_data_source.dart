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
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/api/api.dart';

abstract class DocumentRemoteDataSource {
  Future<ApiResponse> getListDocument();
  Future<ApiResponse> getDetailDocument(String? electionType, int? id);
  Future<ApiResponse> documentVerification(String? electionType, int? id);
  Future<ApiResponse> deleteDocument(String? electionType, int? id);
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
  Future<ApiResponse> uploadDocument(UploadDocumentRequest request) async {
    final formData = getIt<ApiFormData>();

    formData.addField('election_type', request.electionType ?? "");

    // Votes
    var index = 0;
    for (final UploadDocumentVoteRequest row in request.votes ?? []) {
      formData.addField("vote[$index][candidat_id]", "${row.candidatId}");
      formData.addField("vote[$index][total_votes]", "${row.totalVotes}");
      index++;
    }

    // Documents (compress before upload)
    for (final String row in request.imagePaths ?? []) {
      final file = File(row);
      final dir = await getTemporaryDirectory();
      final targetPath =
          "${dir.path}/${DateTime.now().millisecondsSinceEpoch}_${file.uri.pathSegments.last}";
      final compressedXFile = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 70, // Bisa diubah sesuai kebutuhan
      );
      if (compressedXFile != null &&
          await File(compressedXFile.path).exists()) {
        formData.addFile('documents[]', File(compressedXFile.path));
      } else {
        // fallback jika gagal kompres
        formData.addFile('documents[]', file);
      }
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

  @override
  Future<ApiResponse> deleteDocument(String? electionType, int? id) {
    return _api.delete('documents/$id', formObj: {
      'election_type': electionType.toString(),
    });
  }
}
