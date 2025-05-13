///
/// document_entity.dart
/// lib/features/detail/domain/entities
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_entity.g.dart';
part 'document_entity.freezed.dart';

@freezed
sealed class DocumentEntity with _$DocumentEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DocumentEntity({
    int? id,
  }) = _DocumentEntity;

  factory DocumentEntity.fromJson(Map<String, dynamic> json) =>
      _$DocumentEntityFromJson(json);
}
