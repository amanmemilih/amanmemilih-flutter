///
/// generate_recovery_key_usecase.dart
/// lib/features/auth/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/auth/domain/entities/recoverykey/recovery_key_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

final class GenerateRecoveryKeyUseCase
    extends UseCase<RecoveryKeyEntity?, GenerateRecoveryKeyParams> {
  final AuthRepository _repository;

  GenerateRecoveryKeyUseCase(this._repository);

  @override
  Future<Either<Failure, RecoveryKeyEntity?>> call(
          GenerateRecoveryKeyParams params) =>
      _repository.generateRecoveryKey(params.username);
}

class GenerateRecoveryKeyParams extends Equatable {
  final String? username;

  const GenerateRecoveryKeyParams({this.username});

  @override
  List<Object?> get props => [username];
}
