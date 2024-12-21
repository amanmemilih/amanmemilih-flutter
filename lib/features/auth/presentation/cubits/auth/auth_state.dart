///
/// auth_state.dart
/// lib/features/auth/presentation/cubits/auth
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'auth_cubit.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  loading,
  error,
  registerSuccess,
  registerError
}

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStatus status,
    required ErrorObject? error,
    CredentialEntity? credential,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
        status: AuthStatus.unauthenticated,
        error: null,
      );
}
