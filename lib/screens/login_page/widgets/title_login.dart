import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.005,
        ),
        Center(
          child: Image.asset(
            AssetsManager.droneImage,
            fit: BoxFit.contain,
            width: AppSizeScreen.screenWidth / 1.8,
            height: AppSizeScreen.screenHeight / 4,
          ),
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.05,
        ),
        Text(StringManager.GetStarted.tr, style: StyleManager.h1_Bold()),
        Text(StringManager.subTiltleLogin.tr,
            style: StyleManager.body01_Regular()),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.05,
        ),
      ],
    );
  }
}
