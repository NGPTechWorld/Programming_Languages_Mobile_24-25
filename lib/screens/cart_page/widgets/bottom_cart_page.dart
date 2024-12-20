import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/bottun_custom.dart';

class BottomCartPage extends StatelessWidget {
  const BottomCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.transparentColor,
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.primary2Color,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s30))),
        height: AppSizeScreen.screenHeight * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
              child: ListTile(
                title: Text(
                  "total_cost",
                  style: StyleManager.h4_Regular(),
                ),
                trailing: Text(
                  "data",
                  style: StyleManager.h4_Medium(),
                ),
              ),
            ),
            BottouCustom(
                function: () {},
                text: "next",
                width: AppSizeScreen.screenWidth * 0.8,
                borderRadius: AppSize.s16,
                background: ColorManager.secoundDarkColor,
                textColor: ColorManager.whiteColor),
          ],
        ),
      ),
    );
  }
}
