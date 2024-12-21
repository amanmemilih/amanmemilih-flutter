///
/// dashboard_entity.dart
/// lib/features/main/domain/entities
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_entity.g.dart';
part 'dashboard_entity.freezed.dart';

@freezed
sealed class DashboardEntity with _$DashboardEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DashboardEntity({
    int? notUploaded,
    int? uploaded,
    int? verified,
  }) = _DashboardEntity;

  factory DashboardEntity.fromJson(Map<String, dynamic> json) =>
      _$DashboardEntityFromJson(json);
}
