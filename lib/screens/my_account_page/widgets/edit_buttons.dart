import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button_reverse.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';

class EditButtons extends GetView<MyAccountController> {
  const EditButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.changed.value)
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButton(
              minWidth: AppSize.s100,
              height: AppSize.s38,
              borderRadius: AppSize.s10,
              text: StringManager.myAccountUpdate.tr,
              press: () {
                controller.sendUpdatedValues(); // Send data to backend
              },
              style: StyleManager.body01_Medium(color: ColorManager.whiteColor),
            ),
            SizedBox(width: AppSize.s10),
            DefaultButtonInv(
              minWidth: AppSize.s100,
              height: AppSize.s38,
              borderRadius: AppSize.s10,
              press: () {
                controller.resetValues(); // Reset all fields
              },
              text: StringManager.myAccountCancel.tr,
              style: StyleManager.body01_Medium(color: ColorManager.firstColor),
            ),
          ],
        );
      else
        return SizedBox();
    });
  }
}
