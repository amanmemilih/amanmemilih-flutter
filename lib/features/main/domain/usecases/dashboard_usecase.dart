///
/// dashboard_usecase.dart
/// lib/features/main/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/usecase/params.dart';
import 'package:amanmemilih_mobile_app/features/main/domain/entities/dashboard/dashboard_entity.dart';
import 'package:amanmemilih_mobile_app/features/main/domain/repositories/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';

final class DashboardUseCase extends UseCase<DashboardEntity?, NoParams> {
  final DashboardRepository _repository;

  DashboardUseCase(this._repository);

  @override
  Future<Either<Failure, DashboardEntity?>> call(NoParams params) =>
      _repository.getSummary();
}
