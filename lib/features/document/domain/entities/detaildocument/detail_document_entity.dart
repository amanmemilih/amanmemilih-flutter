///
/// detail_document_entity.dart
/// lib/features/document/domain/entities
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_document_entity.g.dart';
part 'detail_document_entity.freezed.dart';

@freezed
sealed class DetailDocumentEntity with _$DetailDocumentEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DetailDocumentEntity({
    int? status,
    String? electionType,
    List<DetailDocumentVotesEntity>? votes,
    List<String>? documents,
  }) = _DetailDocumentEntity;

  factory DetailDocumentEntity.fromJson(Map<String, dynamic> json) =>
      _$DetailDocumentEntityFromJson(json);
}

@freezed
sealed class DetailDocumentVotesEntity with _$DetailDocumentVotesEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DetailDocumentVotesEntity({
    String? candidatName,
    int? candidatNo,
    int? totalVotes,
  }) = _DetailDocumentVotesEntity;

  factory DetailDocumentVotesEntity.fromJson(Map<String, dynamic> json) =>
      _$DetailDocumentVotesEntityFromJson(json);
}
