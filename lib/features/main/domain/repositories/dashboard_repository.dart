///
/// dashboard_repository.dart
/// lib/features/main/domain/repositories
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/main/domain/entities/dashboard/dashboard_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardEntity?>> getSummary();
}
