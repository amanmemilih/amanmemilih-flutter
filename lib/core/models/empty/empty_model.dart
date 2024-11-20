///
/// empty_model.dart
/// lib/core/models/empty
///
/// Created by Indra Mahesa https://github.com/zinct
///

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'empty_model.g.dart';
part 'empty_model.freezed.dart';

@freezed
sealed class EmptyModel with _$EmptyModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EmptyModel({
    int? code,
    bool? success,
    String? message,
  }) = _EmptyModel;

  factory EmptyModel.fromJson(Map<String, dynamic> json) =>
      _$EmptyModelFromJson(json);
}
