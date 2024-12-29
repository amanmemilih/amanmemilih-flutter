///
/// auth_repository_v1.dart
/// lib/features/auth/data/repositories
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/models/empty/empty_model.dart';
import 'package:amanmemilih_mobile_app/core/models/single/single_model.dart';
import 'package:amanmemilih_mobile_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/entities/credential/credential_entity.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/entities/recoverykey/recovery_key_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryV1 extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryV1(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, CredentialEntity?>> checkCredential() async {
    try {
      // Set Last Token
      final token = await _localDataSource.getToken();

      if (token != null) {
        _remoteDataSource.setToken(token);
      }

      final response = await _remoteDataSource.checkCredentials();
      final model = SingleModel.fromJson(
          response.data, (p0) => CredentialEntity.fromJson(p0));

      if (model.code == 401) {
        return Right(null);
      }

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      // Store token to headers
      _remoteDataSource.setToken(model.data!.token!);

      // Store token to local storage
      _localDataSource.setToken(model.data!.token!);

      return Right(model.data!);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }

  @override
  Future<Either<Failure, RecoveryKeyEntity?>> generateRecoveryKey(
      String? username) async {
    try {
      final response = await _remoteDataSource.generateRecoveryKey(username);
      final model = SingleModel.fromJson(
          response.data, (p0) => RecoveryKeyEntity.fromJson(p0));

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      return Right(model.data!);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }

  @override
  Future<Either<Failure, CredentialEntity?>> login(
      String? username, String? password) async {
    try {
      final response = await _remoteDataSource.login(username, password);
      final model = SingleModel.fromJson(
          response.data, (p0) => CredentialEntity.fromJson(p0));

      if (model.code == 401) {
        throw InvalidLoginCredentialException();
      }

      if (model.code == 422) {
        throw UserNotRegisteredException();
      }

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      if (model.data!.token == null) {
        throw const UnableToProcessException();
      }

      // Store token to headers
      _remoteDataSource.setToken(model.data!.token!);

      // Store token to local storage
      _localDataSource.setToken(model.data!.token!);

      return Right(model.data!);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }

  @override
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
  ) async {
    try {
      final response = await _remoteDataSource.register(
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
      );

      final model = SingleModel.fromJson(
          response.data, (p0) => CredentialEntity.fromJson(p0));

      if (model.code == 401) {
        throw InvalidLoginCredentialException();
      }

      if (model.code == 422) {
        throw InvalidRegisterPhraseException();
      }

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      if (model.data!.token == null) {
        throw const UnableToProcessException();
      }

      // Store token to headers
      _remoteDataSource.setToken(model.data!.token!);

      // Store token to local storage
      _localDataSource.setToken(model.data!.token!);

      return Right(model.data!);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await _remoteDataSource.logout();
      final model = EmptyModel.fromJson(response.data);

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      // Clear all token
      _remoteDataSource.clearToken();
      _localDataSource.clearToken();

      return Right(true);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(
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
  ) async {
    try {
      final response = await _remoteDataSource.forgotPassword(
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
      );
      final model = EmptyModel.fromJson(response.data);

      if (model.code == 422) {
        throw InvalidRegisterPhraseException();
      }

      if (model.success == false) {
        throw ApiException(model.code, model.message);
      }

      return Right(true);
    } catch (err, stackTrace) {
      return Left(CatchError.getFailure(err, stackTrace));
    }
  }
}
