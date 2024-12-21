///
/// register_usecase.dart
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

final class RegisterUseCase extends UseCase<CredentialEntity?, RegisterParams> {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, CredentialEntity?>> call(RegisterParams params) =>
      _repository.register(
        params.username,
        params.password,
        params.phrase1,
        params.phrase2,
        params.phrase3,
        params.phrase4,
        params.phrase5,
        params.phrase6,
        params.phrase7,
        params.phrase8,
        params.phrase9,
        params.phrase10,
        params.phrase11,
        params.phrase12,
      );
}

class RegisterParams extends Equatable {
  final String? username;
  final String? password;
  final String? phrase1;
  final String? phrase2;
  final String? phrase3;
  final String? phrase4;
  final String? phrase5;
  final String? phrase6;
  final String? phrase7;
  final String? phrase8;
  final String? phrase9;
  final String? phrase10;
  final String? phrase11;
  final String? phrase12;

  const RegisterParams({
    this.username,
    this.password,
    this.phrase1,
    this.phrase2,
    this.phrase3,
    this.phrase4,
    this.phrase5,
    this.phrase6,
    this.phrase7,
    this.phrase8,
    this.phrase9,
    this.phrase10,
    this.phrase11,
    this.phrase12,
  });

  @override
  List<Object?> get props => [
        username,
        password,
        phrase1,
        phrase2,
        phrase3,
        phrase4,
        phrase5,
        phrase6,
        phrase7,
        phrase8,
        phrase9,
        phrase10,
        phrase11,
        phrase12,
      ];
}
