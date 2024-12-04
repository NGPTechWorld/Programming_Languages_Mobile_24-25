import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class ButtonProduct extends StatelessWidget {
  const ButtonProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {},
          height: AppSizeScreen.screenHeight / 14,
          minWidth: AppSizeScreen.screenWidth / 2.8,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorManager.firstColor),
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: Text(
            "Add To Cart",
            style: StyleManager.button1(color: ColorManager.firstColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p10),
          child: MaterialButton(
            color: ColorManager.firstColor,
            onPressed: () {},
            height: AppSizeScreen.screenHeight / 14,
            minWidth: AppSizeScreen.screenWidth / 2.4,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s20),
            ),
            child: Text(
              "Buy Now",
              style: StyleManager.button1(color: ColorManager.primary1Color),
            ),
          ),
        ),
      ],
    );
  }
}
