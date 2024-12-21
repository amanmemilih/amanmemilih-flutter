///
/// dashboard_repository_v1.dart
/// lib/features/main/data/repositories
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/models/single/single_model.dart';
import 'package:amanmemilih_mobile_app/features/main/domain/entities/dashboard/dashboard_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';

class DashboardRepositoryV1 extends DashboardRepository {
  final DashboardRemoteDataSource _remoteDataSource;

  DashboardRepositoryV1(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, DashboardEntity?>> getSummary() async {
    try {
      final response = await _remoteDataSource.getSummary();
      final model = SingleModel.fromJson(
          response.data, (p0) => DashboardEntity.fromJson(p0));

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      return Right(model.data!);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }
}
