///
/// register_recovery_key_state.dart
/// lib/features/auth/presentation/cubits/register_recovery_key
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'register_recovery_key_cubit.dart';

enum RegisterRecoveryKeyStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class RegisterRecoveryKeyState with _$RegisterRecoveryKeyState {
  const factory RegisterRecoveryKeyState({
    required RegisterRecoveryKeyStatus status,
    required ErrorObject? error,
    required bool isKeyHidden,
  }) = _RegisterRecoveryKeyState;

  factory RegisterRecoveryKeyState.initial() => const RegisterRecoveryKeyState(
        status: RegisterRecoveryKeyStatus.initial,
        error: null,
        isKeyHidden: false,
      );
}
