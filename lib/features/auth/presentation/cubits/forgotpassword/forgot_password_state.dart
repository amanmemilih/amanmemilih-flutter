///
/// forgot_password_state.dart
/// lib/features/auth/presentation/cubits/forgot_password
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'forgot_password_cubit.dart';

enum ForgotPasswordStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required ForgotPasswordStatus status,
    required ErrorObject? error,
    required bool isKeyHidden,
    required bool isPasswordHidden,
    required bool isPasswordConfirmationHidden,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() => const ForgotPasswordState(
        status: ForgotPasswordStatus.initial,
        error: null,
        isKeyHidden: false,
        isPasswordConfirmationHidden: false,
        isPasswordHidden: false,
      );
}
