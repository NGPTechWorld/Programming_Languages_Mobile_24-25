import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ngpiteapp/app/config/theme_manager.dart';
import 'package:ngpiteapp/app/config/translation_app.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/start_page/start_page.dart';
import 'package:ngpiteapp/screens/start_page/start_page_logic.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    AppSizeScreen.screenSize = MediaQuery.of(context).size;
    AppSizeScreen.screenHeight = MediaQuery.sizeOf(context).height;
    AppSizeScreen.screenWidth = MediaQuery.sizeOf(context).width;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      theme: ThemeManager.appTheme,
      initialBinding: StartPageBinging(),
      locale: Locale("en"),
      translations: TranslationApp(),
    );
  }
}
