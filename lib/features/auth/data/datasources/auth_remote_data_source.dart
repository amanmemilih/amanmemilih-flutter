///
/// auth_remote_data_source.dart
/// lib/features/auth/data/datasources
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/extensions/string_extension.dart';

import '../../../../core/api/api.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponse> checkCredentials();
  Future<ApiResponse> login(
    String? username,
    String? password,
  );
  Future<ApiResponse> register(
    String? username,
    String? password,
    String? phrase1,
    String? phrase2,
    String? phrase3,
    String? phrase4,
    String? phrase5,
    String? phrase6,
    String? phrase7,
    String? phrase8,
    String? phrase9,
    String? phrase10,
    String? phrase11,
    String? phrase12,
  );
  Future<ApiResponse> forgotPassword(
    String? password,
    String? phrase1,
    String? phrase2,
    String? phrase3,
    String? phrase4,
    String? phrase5,
    String? phrase6,
    String? phrase7,
    String? phrase8,
    String? phrase9,
    String? phrase10,
    String? phrase11,
    String? phrase12,
  );
  Future<ApiResponse> generateRecoveryKey(String? username);

  Future<ApiResponse> logout();

  void clearToken();

  void setToken(String token);
}

class ApiAuthRemoteDataSource extends AuthRemoteDataSource {
  final Api _api;

  ApiAuthRemoteDataSource(this._api);

  @override
  Future<ApiResponse> checkCredentials() {
    return _api.get('check-credentials');
  }

  @override
  void clearToken() {
    _api.clearToken();
  }

  @override
  Future<ApiResponse> login(String? username, String? password) {
    return _api.post('login', formObj: {
      'username': username.preventNull(),
      'password': password.preventNull(),
    });
  }

  @override
  Future<ApiResponse> register(
      String? username,
      String? password,
      String? phrase1,
      String? phrase2,
      String? phrase3,
      String? phrase4,
      String? phrase5,
      String? phrase6,
      String? phrase7,
      String? phrase8,
      String? phrase9,
      String? phrase10,
      String? phrase11,
      String? phrase12) {
    return _api.post('register', formObj: {
      'username': username.preventNull(),
      'password': password.preventNull(),
      'phrase_1': phrase1 == '' ? '???' : phrase1.preventNull(),
      'phrase_2': phrase2 == '' ? '???' : phrase2.preventNull(),
      'phrase_3': phrase3 == '' ? '???' : phrase3.preventNull(),
      'phrase_4': phrase4 == '' ? '???' : phrase4.preventNull(),
      'phrase_5': phrase5 == '' ? '???' : phrase5.preventNull(),
      'phrase_6': phrase6 == '' ? '???' : phrase6.preventNull(),
      'phrase_7': phrase7 == '' ? '???' : phrase7.preventNull(),
      'phrase_8': phrase8 == '' ? '???' : phrase8.preventNull(),
      'phrase_9': phrase9 == '' ? '???' : phrase9.preventNull(),
      'phrase_10': phrase10 == '' ? '???' : phrase10.preventNull(),
      'phrase_11': phrase11 == '' ? '???' : phrase11.preventNull(),
      'phrase_12': phrase12 == '' ? '???' : phrase12.preventNull(),
    });
  }

  @override
  Future<ApiResponse> forgotPassword(
      String? password,
      String? phrase1,
      String? phrase2,
      String? phrase3,
      String? phrase4,
      String? phrase5,
      String? phrase6,
      String? phrase7,
      String? phrase8,
      String? phrase9,
      String? phrase10,
      String? phrase11,
      String? phrase12) {
    return _api.post('forgot-password', formObj: {
      'password': password.preventNull(),
      'phrase_1': phrase1 == '' ? '???' : phrase1.preventNull(),
      'phrase_2': phrase2 == '' ? '???' : phrase2.preventNull(),
      'phrase_3': phrase3 == '' ? '???' : phrase3.preventNull(),
      'phrase_4': phrase4 == '' ? '???' : phrase4.preventNull(),
      'phrase_5': phrase5 == '' ? '???' : phrase5.preventNull(),
      'phrase_6': phrase6 == '' ? '???' : phrase6.preventNull(),
      'phrase_7': phrase7 == '' ? '???' : phrase7.preventNull(),
      'phrase_8': phrase8 == '' ? '???' : phrase8.preventNull(),
      'phrase_9': phrase9 == '' ? '???' : phrase9.preventNull(),
      'phrase_10': phrase10 == '' ? '???' : phrase10.preventNull(),
      'phrase_11': phrase11 == '' ? '???' : phrase11.preventNull(),
      'phrase_12': phrase12 == '' ? '???' : phrase12.preventNull(),
    });
  }

  @override
  void setToken(String token) {
    _api.setToken(token);
  }

  @override
  Future<ApiResponse> generateRecoveryKey(String? username) {
    return _api.post('recovery-key', formObj: {
      'username': username.preventNull(),
    });
  }

  @override
  Future<ApiResponse> logout() {
    return _api.get('logout');
  }
}
