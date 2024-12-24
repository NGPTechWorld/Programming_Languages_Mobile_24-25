import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page_logic.dart';

class ButtonProduct extends GetView<ProductDetailsPageController> {
  const ButtonProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton(
            text: "Add To Cart",
            minWidth: 100,
            height: 50,
            color: ColorManager.whiteColor,
            press: () => controller.addToCart(context),
            style: StyleManager.button1(color: ColorManager.secoundColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
            child: DefaultButton(
              text: "Buy now",
              minWidth: 100,
              height: 50,
              color: ColorManager.firstColor,
              press: () {},
              style: StyleManager.button1(color: ColorManager.secoundColor),
            ),
          ),
        ],
      ),
    );
  }
}
