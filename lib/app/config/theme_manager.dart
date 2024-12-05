import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';

class ThemeManager {
  static final ThemeData appTheme = ThemeData(
    primaryColor: ColorManager.firstColor,
    fontFamily: "Tajawal" ,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.whiteColor,
      foregroundColor: ColorManager.blackColor,
      centerTitle: true,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.firstColor,
        selectionColor: ColorManager.firstColor.withOpacity(0.5),
        selectionHandleColor: ColorManager.firstColor, 
      ),
      scaffoldBackgroundColor: ColorManager.whiteColor,
  );
}
