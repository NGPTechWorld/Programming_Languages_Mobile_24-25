import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';

class TitleSignUp extends StatelessWidget {
  const TitleSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.03,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: AppSizeScreen.screenHeight / 4.5,
              width: AppSizeScreen.screenWidth / 1.3,
              decoration: BoxDecoration(
                  color: ColorManager.firstLightColor.withAlpha(30),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Center(
              child: Image.asset(
                AssetsManager.deliveryManImage,
                fit: BoxFit.contain,
                width: AppSizeScreen.screenWidth / 1.8,
                height: AppSizeScreen.screenHeight / 5,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.03,
        ),
        Text(StringManager.signuptitle.tr, style: StyleManager.h2_Bold()),
        Text(StringManager.signupSubtitle.tr, style: StyleManager.h4_Medium()),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.02,
        ),
      ],
    );
  }
}
