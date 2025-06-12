import 'package:amanmemilih_mobile_app/app.dart';
import 'package:amanmemilih_mobile_app/initial_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await InitialApp.execute();
  runApp(const MainApp());
}
