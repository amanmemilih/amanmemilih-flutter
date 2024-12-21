///
/// logout_usecase.dart
/// lib/features/auth/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/usecase/params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

final class LogoutUseCase extends UseCase<void, NoParams> {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) => _repository.logout();
}
