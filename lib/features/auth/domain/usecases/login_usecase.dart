///
/// login_usecase.dart
/// lib/features/auth/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/auth/domain/entities/credential/credential_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

final class LoginUseCase extends UseCase<CredentialEntity?, LoginParams> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, CredentialEntity?>> call(LoginParams params) =>
      _repository.login(params.username, params.password);
}

class LoginParams extends Equatable {
  final String? username;
  final String? password;

  const LoginParams({
    this.username,
    this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
