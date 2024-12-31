import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/select_address_cart_page_logic.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/widgets/address_card.dart';

class BodySelectAddrees extends GetView<SelectAddressCartPageController> {
  const BodySelectAddrees({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: AppSizeScreen.screenHeight / 18,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p24),
            child: Text(
              StringManager.SelectYourLocation.tr,
              style:
                  StyleManager.body01_Regular(color: ColorManager.blackColor),
            ),
          ),
          Column(
            children: List.generate(
              controller.addresses.length,
              (index) => address_card(index: index),
            ),
          ),
        ],
      ),
    );
  }
}
