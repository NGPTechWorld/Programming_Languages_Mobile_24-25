import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/bottun_custom.dart';

class BottomCartPage extends GetView<CartPageController> {
  const BottomCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.transparentColor,
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.primary2Color,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s30))),
        height: AppSizeScreen.screenHeight * 0.14,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
              child: ListTile(
                title: Text(
                  StringManager.orderDetailsTotalPrice.tr,
                  style: StyleManager.h4_Regular(),
                ),
                trailing: Obx(
                  () => Text(
                    controller.totalCost.value.toString() +
                        ' ${StringManager.orderDetailsSyrianPounds.tr}',
                    style: StyleManager.h4_Medium(),
                  ),
                ),
              ),
            ),
            Obx(
              () => BottouCustom(
                  enabled: controller.products.length > 0,
                  function: () {
                    controller.goToChooseAddress();
                  },
                  text: StringManager.cartPageNext.tr,
                  width: AppSizeScreen.screenWidth * 0.8,
                  borderRadius: AppSize.s20,
                  background: ColorManager.secoundDarkColor,
                  textColor: ColorManager.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
