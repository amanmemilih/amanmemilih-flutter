///
/// login_state.dart
/// lib/features/auth/presentation/cubits/login
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    required LoginStatus status,
    required ErrorObject? error,
    required bool isPasswordHidden,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        status: LoginStatus.initial,
        error: null,
        isPasswordHidden: true,
      );
}
