///
/// register_state.dart
/// lib/features/auth/presentation/cubits/register
///
/// Created by Indra Mahesa https://github.com/zinct
///

part of 'register_cubit.dart';


enum RegisterStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState({
    required RegisterStatus status,
    required ErrorObject? error,
  }) = _RegisterState;

  factory RegisterState.initial() => const RegisterState(
    status: RegisterStatus.initial,
    error: null,
  );
}




