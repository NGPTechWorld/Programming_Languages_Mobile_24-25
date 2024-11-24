import 'package:flutter/material.dart';

class AppMargin {
  static const double m4 = 4.0;
  static const double m8 = 8.0;
  static const double m10 = 10.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m18 = 18.0;
  static const double m20 = 20.0;
  static const double m24 = 24.0;
  static const double m26 = 26.0;
  static const double m28 = 28.0;
  static const double m30 = 30.0;
  static const double m32 = 32.0;
  static const double m34 = 34.0;
  static const double m36 = 36.0;
  static const double m38 = 38.0;
  static const double m40 = 40.0;
}

class AppPadding {
  static const double p3 = 3.0;
  static const double p2 = 2.0;
  static const double p4 = 4.0;
  static const double p5 = 5.0;
  static const double p6 = 6.0;
  static const double p8 = 8.0;
  static const double p10 = 10.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
  static const double p25 = 25.0;
  static const double p30 = 30.0;
  static const double p35 = 35.0;
  static const double p40 = 40.0;
  static const double p50 = 50.0;
  static const double p60 = 60.0;
  static const double p70 = 70.0;
  static const double p80 = 80.0;
  static const double p90 = 90.0;
  static const double p100 = 100.0;
}

//** App Corner **/
class AppSize {
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s26 = 26.0;
  static const double s30 = 30.0;
  static const double s38 = 38.0;
  static const double s40 = 40.0;
  static const double s50 = 50.0;
  static const double s56 = 56.0;
  static const double s60 = 60.0;
  static const double s70 = 70.0;
  static const double s80 = 80.0;
  static const double s100 = 100.0;
  static const double s110 = 110.0;
}

class AppSizeScreen {
  static Size screenSize = Size(0, 0);
  static double screenWidth = 0;
  static double screenHeight = 0;
}

class AppSizeWidget {
  static const double cardSize = 150;
  static const double tabSize = 40;
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = AppSizeScreen.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = AppSizeScreen.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
