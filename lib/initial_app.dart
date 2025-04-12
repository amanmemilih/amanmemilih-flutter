import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:localization/localization.dart';
import 'package:path_provider/path_provider.dart';

import 'core/constants/file.dart';
import 'core/https/http_client_overrides.dart';
import 'injection_container.dart' as di;

class InitialApp {
  static Future<void> execute() async {
    _initWidget();
    _initDependencyInjection();
    _initHttp();
    await _initIntl();
    _initLocalization();
    await _initHive();
  }

  static void _initDependencyInjection() {
    di.initialize();
  }

  static void _initWidget() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static void _initHttp() {
    HttpOverrides.global = MyHttpOverrides();
  }

  static Future<void> _initIntl() {
    return initializeDateFormatting('id_ID', null);
  }

  static void _initLocalization() {
    LocalJsonLocalization.delegate.directories = [FILE.localizationPath];
  }

  static Future<void> _initHive() async {
    return Hive.initFlutter();
  }
}
