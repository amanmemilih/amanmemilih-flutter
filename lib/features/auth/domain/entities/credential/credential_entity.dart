///
/// credential_entity.dart
/// lib/features/auth/domain/entities
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

// ignore_for_file: invalid_annotation_target

import 'package:amanmemilih_mobile_app/features/user/domain/entities/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential_entity.g.dart';
part 'credential_entity.freezed.dart';

@freezed
sealed class CredentialEntity with _$CredentialEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CredentialEntity({
    String? token,
    UserEntity? user,
  }) = _CredentialEntity;

  factory CredentialEntity.fromJson(Map<String, dynamic> json) =>
      _$CredentialEntityFromJson(json);
}
