///
/// list_model.dart
/// lib/core/models/list
///
/// Created by Indra Mahesa https://github.com/zinct
///

import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_model_v2.freezed.dart';
part 'list_model_v2.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class ListModelV2<T> with _$ListModelV2<T> {
  const factory ListModelV2({
    int? code,
    bool? success,
    String? message,
    List<T>? result,
  }) = _ListModelV2;

  factory ListModelV2.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$ListModelV2FromJson(json, fromJsonT);
}
