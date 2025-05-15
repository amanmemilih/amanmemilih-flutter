///
/// auth_cubit.dart
/// lib/features/auth/presentation/cubits/auth
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/usecase/params.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/entities/credential/credential_entity.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/usecases/check_credentials_usecase.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:amanmemilih_mobile_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:amanmemilih_mobile_app/features/auth/data/datasources/auth_local_data_source.dart';

import '../../../../../core/errors/errors.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final CheckCredentialsUseCase _checkCredentialsUseCase;
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final AuthLocalDataSource _localDataSource;

  AuthCubit(
    this._checkCredentialsUseCase,
    this._loginUseCase,
    this._logoutUseCase,
    this._localDataSource,
  ) : super(AuthState.initial());

  void checkCredential() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final data = await _checkCredentialsUseCase.call(NoParams());

    data.fold(
        (l) => emit(state.copyWith(
              status: AuthStatus.error,
              error: ErrorObject.mapFailureToErrorObject(l),
            )), (r) {
      if (r != null) {
        emit(state.copyWith(
          status: AuthStatus.authenticated,
          credential: r,
        ));
      } else {
        emit(state.copyWith(
          status: AuthStatus.unauthenticated,
        ));
      }
    });
  }

  void login(String? username, String? password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final data = await _loginUseCase.call(LoginParams(
      username: username,
      password: password,
    ));

    data.fold((l) {
      // Cek jika error karena koneksi
      final isNetworkError = l.toString().contains('SocketException') ||
          l.toString().contains('Failed host lookup') ||
          l.toString().contains('No address associated with hostname');
      if (isNetworkError) {
        emit(state.copyWith(
          status: AuthStatus.error,
          error: ErrorObject(
            title: 'Koneksi Gagal',
            message:
                'Tidak bisa terhubung ke server. Pastikan koneksi internet aktif.',
            shortMessage: 'Tidak bisa terhubung ke server',
            failure: const Failure.noInternetConnectionFailure(),
          ),
        ));
      } else {
        emit(state.copyWith(
          status: AuthStatus.error,
          error: ErrorObject.mapFailureToErrorObject(l),
        ));
      }
    }, (r) {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        credential: r,
      ));
    });
  }

  void logout() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final data = await _logoutUseCase.call(NoParams());

    data.fold(
      (l) {
        // Tetap clear token lokal walau gagal koneksi
        try {
          _localDataSource.clearToken();
        } catch (_) {}
        emit(state.copyWith(
          status: AuthStatus.unauthenticated,
          error: ErrorObject(
            title: 'Logout Gagal',
            message:
                'Logout gagal karena koneksi. Anda sudah keluar dari aplikasi.',
            shortMessage: 'Logout gagal karena koneksi',
            failure: const Failure.otherErrorFailure(),
          ),
        ));
      },
      (r) {
        emit(state.copyWith(
          status: AuthStatus.unauthenticated,
        ));
      },
    );
  }
}
