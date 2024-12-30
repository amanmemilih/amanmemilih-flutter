///
/// document_list_entity.dart
/// lib/features/document/domain/entities
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_list_entity.g.dart';
part 'document_list_entity.freezed.dart';

@freezed
sealed class DocumentListEntity with _$DocumentListEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DocumentListEntity({
    int? id,
    String? name,
    int? status,
  }) = _DocumentListEntity;

  factory DocumentListEntity.fromJson(Map<String, dynamic> json) =>
      _$DocumentListEntityFromJson(json);
}
