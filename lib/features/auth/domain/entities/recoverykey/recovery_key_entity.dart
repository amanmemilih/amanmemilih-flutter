///
/// recovery_key_entity.dart
/// lib/features/auth/domain/entities
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_key_entity.g.dart';
part 'recovery_key_entity.freezed.dart';

@freezed
sealed class RecoveryKeyEntity with _$RecoveryKeyEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RecoveryKeyEntity({
    @JsonKey(name: 'phrase_1') String? phrase1,
    @JsonKey(name: 'phrase_2') String? phrase2,
    @JsonKey(name: 'phrase_3') String? phrase3,
    @JsonKey(name: 'phrase_4') String? phrase4,
    @JsonKey(name: 'phrase_5') String? phrase5,
    @JsonKey(name: 'phrase_6') String? phrase6,
    @JsonKey(name: 'phrase_7') String? phrase7,
    @JsonKey(name: 'phrase_8') String? phrase8,
    @JsonKey(name: 'phrase_9') String? phrase9,
    @JsonKey(name: 'phrase_10') String? phrase10,
    @JsonKey(name: 'phrase_11') String? phrase11,
    @JsonKey(name: 'phrase_12') String? phrase12,
  }) = _RecoveryKeyEntity;

  factory RecoveryKeyEntity.fromJson(Map<String, dynamic> json) =>
      _$RecoveryKeyEntityFromJson(json);
}
