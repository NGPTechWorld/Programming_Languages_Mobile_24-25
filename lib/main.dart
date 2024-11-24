import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngpiteapp/app/app.dart';
import 'package:ngpiteapp/app/core/binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await AppBinding().initializes();
  AppBinding().dependencies();
  runApp(const App());
}
