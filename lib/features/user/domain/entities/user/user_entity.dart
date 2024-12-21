///
/// user_entity.dart
/// lib/features/user/domain/entities
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.g.dart';
part 'user_entity.freezed.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserEntity({
    int? id,
    String? username,
    String? address,
    String? village,
    String? subdistrict,
    String? district,
    String? province,
    String? region,
    String? createdAt,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
