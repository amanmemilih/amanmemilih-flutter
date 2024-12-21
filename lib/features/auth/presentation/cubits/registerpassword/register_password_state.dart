///
/// register_password_state.dart
/// lib/features/auth/presentation/cubits/register_password
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'register_password_cubit.dart';

enum RegisterPasswordStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class RegisterPasswordState with _$RegisterPasswordState {
  const factory RegisterPasswordState({
    required RegisterPasswordStatus status,
    required ErrorObject? error,
    required bool isPasswordHidden,
    required bool isPasswordConfirmationHidden,
  }) = _RegisterPasswordState;

  factory RegisterPasswordState.initial() => const RegisterPasswordState(
        status: RegisterPasswordStatus.initial,
        error: null,
        isPasswordHidden: true,
        isPasswordConfirmationHidden: true,
      );
}
