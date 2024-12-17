import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page_logic.dart';

class PriceProduct extends GetView<ProductDetailsPageController> {
  const PriceProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: controller.product!.price.toString(),
                    style: StyleManager.h1_Bold(
                      color: ColorManager.firstDarkColor,
                    )),
                TextSpan(
                    text: " " + StringManager.orderDetailsSyrianPounds.tr,
                    style: StyleManager.body01_Regular(
                      color: ColorManager.firstDarkColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
