import 'package:amanmemilih_mobile_app/app.dart';
import 'package:amanmemilih_mobile_app/initial_app.dart';
import 'package:flutter/material.dart';

void main() async {
  
  await InitialApp.execute();
  runApp(const MainApp());
}
