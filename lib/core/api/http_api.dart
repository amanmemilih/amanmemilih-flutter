///
/// http_api.dart
/// lib/core/api
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'dart:io';

import 'package:dio/dio.dart';

import 'api.dart';

class HttpApi extends Api {
  @override
  void clearToken() {
    // Implementation not needed as this is a stub class
  }

  @override
  Future<ApiResponse> delete(
    String path, {
    ApiFormData? formData,
    Map<String, String>? formObj,
    Map<String, String>? queryParameters,
    Options? options,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> get(
    String path, {
    Map<String, String>? queryParameters,
    Options? options,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> post(
    String path, {
    ApiFormData? formData,
    Map<String, String>? formObj,
    Map<String, String>? queryParameters,
    Options? options,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> put(
    String path, {
    ApiFormData? formData,
    Map<String, String>? formObj,
    Map<String, String>? queryParameters,
    Options? options,
  }) {
    throw UnimplementedError();
  }

  @override
  void setToken(String token) {}
}

class HttpApiFormData implements ApiFormData {
  @override
  void addField(String key, String value) {}

  @override
  void addFile(String key, File file, {String? filename}) {}

  @override
  getBody() {
    throw UnimplementedError();
  }
}

class HttpApiResponse extends ApiResponse {
  @override
  get data => throw UnimplementedError();

  @override
  get headers => throw UnimplementedError();

  @override
  int? get statusCode => throw UnimplementedError();
}
