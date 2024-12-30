///
/// get_presidential_candidat_usecase.dart
/// lib/features/candidat/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/usecase/params.dart';
import 'package:amanmemilih_mobile_app/features/candidat/domain/entities/presidentialcandidat/presidential_candidat_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/candidat_repository.dart';

final class GetPresidentialCandidatUseCase
    extends UseCase<List<PresidentialCandidatEntity>?, NoParams> {
  final CandidatRepository _repository;

  GetPresidentialCandidatUseCase(this._repository);

  @override
  Future<Either<Failure, List<PresidentialCandidatEntity>?>> call(
          NoParams params) =>
      _repository.getPresidential();
}
