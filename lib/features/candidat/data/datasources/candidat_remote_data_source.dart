///
/// candidat_remote_data_source.dart
/// lib/features/candidat/data/datasources
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:dio/dio.dart';

import '../../../../core/api/api.dart';

abstract class CandidatRemoteDataSource {
  Future<ApiResponse> getPresidential();
}

class ApiCandidatRemoteDataSource extends CandidatRemoteDataSource {
  final Api _api;

  ApiCandidatRemoteDataSource(this._api);

  @override
  Future<ApiResponse> getPresidential() {
    return _api.get('presidential-candidats');
  }
}
