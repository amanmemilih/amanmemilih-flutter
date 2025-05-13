///
/// single_model.dart
/// lib/core/models/single
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_model.freezed.dart';
part 'single_model.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class SingleModel<T> with _$SingleModel<T> {
  const factory SingleModel({
    int? code,
    bool? success,
    String? message,
    T? data,
  }) = _SingleModel;

  factory SingleModel.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$SingleModelFromJson(json, fromJsonT);
}
