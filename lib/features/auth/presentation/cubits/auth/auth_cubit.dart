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

import '../../../../../core/errors/errors.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final CheckCredentialsUseCase _checkCredentialsUseCase;
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthCubit(
    this._checkCredentialsUseCase,
    this._loginUseCase,
    this._logoutUseCase,
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

    data.fold(
        (l) => emit(state.copyWith(
              status: AuthStatus.error,
              error: ErrorObject.mapFailureToErrorObject(l),
            )), (r) {
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
        (l) => emit(state.copyWith(
              status: AuthStatus.error,
              error: ErrorObject.mapFailureToErrorObject(l),
            )), (r) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
      ));
    });
  }
}
