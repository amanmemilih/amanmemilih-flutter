///
/// auth_local_data_source.dart
/// lib/features/auth/data/datasources
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/constants/hive.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  Future setToken(String token);
  Future<String?> getToken();
  Future clearToken();
}

class HiveAuthLocalDataSource extends AuthLocalDataSource {
  HiveAuthLocalDataSource();

  @override
  Future clearToken() async {
    final box = await Hive.openBox(HIVE.databaseName);
    box.delete(HIVE.tokenData);
  }

  @override
  Future<String?> getToken() async {
    final box = await Hive.openBox(HIVE.databaseName);
    return box.get(HIVE.tokenData);
  }

  @override
  Future setToken(String token) async {
    final box = await Hive.openBox(HIVE.databaseName);
    box.put(HIVE.tokenData, token);
  }
}
