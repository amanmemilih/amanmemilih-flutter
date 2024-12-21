import 'package:amanmemilih_mobile_app/features/auth/domain/entities/recoverykey/recovery_key_entity.dart';

class RegisterRecoveryKeyArgs {
  final String username;
  final String password;
  final String passwordConfirmation;
  final RecoveryKeyEntity key;

  RegisterRecoveryKeyArgs({
    required this.username,
    required this.password,
    required this.passwordConfirmation,
    required this.key,
  });
}
