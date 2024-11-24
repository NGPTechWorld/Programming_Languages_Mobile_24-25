import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(38),
      borderSide: const BorderSide(color: kTextColor),
      gapPadding: 10);
  return InputDecorationTheme(
    focusedBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    errorBorder: outlineInputBorder,
    focusedErrorBorder: outlineInputBorder,
    errorStyle: const TextStyle(fontSize: 0),
    
    border: outlineInputBorder,
    contentPadding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(42),
        vertical: getProportionateScreenHeight(20)),
    hintStyle: const TextStyle(color: kTextColor),
    labelStyle: const TextStyle(color: kTextColor),
  );
}

TextTheme textTheme() {
  return  TextTheme(
    bodySmall: TextStyle(color: kTextColor ,fontSize: getProportionateScreenWidth(12)),
    bodyMedium: TextStyle(color: kTextColor,fontSize: getProportionateScreenWidth(14)),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Color(0xff8B8B8B), fontSize: 18),
      scrolledUnderElevation: 0);
}
