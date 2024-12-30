///
/// candidat_repository_v1.dart
/// lib/features/candidat/data/repositories
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/models/list/list_model.dart';
import 'package:amanmemilih_mobile_app/features/candidat/domain/entities/presidentialcandidat/presidential_candidat_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/repositories/candidat_repository.dart';
import '../datasources/candidat_remote_data_source.dart';

class CandidatRepositoryV1 extends CandidatRepository {
  final CandidatRemoteDataSource _remoteDataSource;

  CandidatRepositoryV1(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, List<PresidentialCandidatEntity>?>>
      getPresidential() async {
    try {
      final response = await _remoteDataSource.getPresidential();
      final model = ListModel.fromJson(
          response.data, (p0) => PresidentialCandidatEntity.fromJson(p0));

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      return Right(model.data!);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }
}
