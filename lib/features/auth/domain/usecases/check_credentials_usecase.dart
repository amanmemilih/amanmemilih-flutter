///
/// check_credentials_usecase.dart
/// lib/features/auth/domain/usecases
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/usecase/params.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/entities/credential/credential_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

final class CheckCredentialsUseCase
    extends UseCase<CredentialEntity?, NoParams> {
  final AuthRepository _repository;

  CheckCredentialsUseCase(this._repository);

  @override
  Future<Either<Failure, CredentialEntity?>> call(NoParams params) =>
      _repository.checkCredential();
}
