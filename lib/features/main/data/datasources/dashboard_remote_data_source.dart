///
/// dashboard_remote_data_source.dart
/// lib/features/main/data/datasources
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import '../../../../core/api/api.dart';

abstract class DashboardRemoteDataSource {
  Future<ApiResponse> getSummary();
}

class ApiDashboardRemoteDataSource extends DashboardRemoteDataSource {
  final Api _api;

  ApiDashboardRemoteDataSource(this._api);

  @override
  Future<ApiResponse> getSummary() {
    return _api.get('dashboard');
  }
}
