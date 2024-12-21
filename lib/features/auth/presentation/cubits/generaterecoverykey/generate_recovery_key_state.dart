///
/// generate_recovery_key_state.dart
/// lib/features/auth/presentation/cubits/generate_recovery_key
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'generate_recovery_key_cubit.dart';

enum GenerateRecoveryKeyStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class GenerateRecoveryKeyState with _$GenerateRecoveryKeyState {
  const factory GenerateRecoveryKeyState({
    required GenerateRecoveryKeyStatus status,
    required ErrorObject? error,
    required List<String> recoveryKey,
    RecoveryKeyEntity? data,
  }) = _GenerateRecoveryKeyState;

  factory GenerateRecoveryKeyState.initial() => const GenerateRecoveryKeyState(
        status: GenerateRecoveryKeyStatus.initial,
        error: null,
        recoveryKey: [],
      );
}
