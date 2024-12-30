///
/// candidat_repository.dart
/// lib/features/candidat/domain/repositories
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/candidat/domain/entities/presidentialcandidat/presidential_candidat_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class CandidatRepository {
  Future<Either<Failure, List<PresidentialCandidatEntity>?>> getPresidential();
}
