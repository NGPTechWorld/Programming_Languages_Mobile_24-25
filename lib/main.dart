
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngpiteapp/app/app.dart';
import 'package:ngpiteapp/core/binding/app_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppBinding().initializes();
  await PushNotification.initialise();
  AppBinding().dependencies();
  runApp(const App());
}
