///
/// auth_repository.dart
/// lib/features/auth/domain/repositories
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/features/auth/domain/entities/credential/credential_entity.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/entities/recoverykey/recovery_key_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class AuthRepository {
  Future<Either<Failure, CredentialEntity?>> checkCredential();
  Future<Either<Failure, CredentialEntity?>> login(
    String? username,
    String? password,
  );
  Future<Either<Failure, CredentialEntity?>> register(
    String? username,
    String? password,
    String? phrase1,
    String? phrase2,
    String? phrase3,
    String? phrase4,
    String? phrase5,
    String? phrase6,
    String? phrase7,
    String? phrase8,
    String? phrase9,
    String? phrase10,
    String? phrase11,
    String? phrase12,
  );
  Future<Either<Failure, RecoveryKeyEntity?>> generateRecoveryKey(
      String? username);
  Future<Either<Failure, void>> logout();
}
