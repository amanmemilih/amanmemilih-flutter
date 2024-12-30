///
/// presidential_candidat_entity.dart
/// lib/features/candidat/domain/entities
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'presidential_candidat_entity.g.dart';
part 'presidential_candidat_entity.freezed.dart';

@freezed
sealed class PresidentialCandidatEntity with _$PresidentialCandidatEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PresidentialCandidatEntity({
    int? id,
    int? no,
    String? name,
  }) = _PresidentialCandidatEntity;

  factory PresidentialCandidatEntity.fromJson(Map<String, dynamic> json) =>
      _$PresidentialCandidatEntityFromJson(json);
}
