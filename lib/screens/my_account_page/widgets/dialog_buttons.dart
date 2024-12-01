import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';

class DialogButtons extends GetView<MyAccountController> {
  const DialogButtons({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // DefaultButton(
        //   minWidth: AppSize.s100,
        //   height: AppSize.s38,
        //   borderRadius: AppSize.s10,
        //   text: StringManager.myAccountUpdate.tr,
        //   press: () {
        //     controller.sendUpdatedValues(); // Send data to backend
        //     Get.back(result: true);
        //   },
        //   style: StyleManager.body01_Medium(
        //       color: ColorManager.whiteColor),
        // ),
        MaterialButton(
          onPressed: () {
            controller.sendUpdatedValues();
            Get.back(result: true);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s20)),
          color: ColorManager.firstColor,
          child: Text(
            StringManager.myAccountUpdate.tr,
            style: TextStyle(color: ColorManager.whiteColor),
          ),
        ),
        SizedBox(width: AppSize.s10),
        MaterialButton(
          onPressed: () {
            controller.resetValues();
            Get.back(result: true);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            // side: BorderSide(color: ColorManager.firstColor, width: 2),
          ),
          child: Text(
            StringManager.myAccountDiscard.tr,
            style: TextStyle(color: ColorManager.firstColor),
          ),
        ),
        // DefaultButtonInv(
        //   minWidth: AppSize.s100,
        //   height: AppSize.s38,
        //   borderRadius: AppSize.s10,
        //   press: () {
        //     controller.resetValues(); // Reset all fields
        //     Get.back(result: true);
        //   },
        //   text: StringManager.myAccountDiscard.tr,
        //   style: StyleManager.body01_Medium(
        //       color: ColorManager.firstColor),
        // ),
      ],
    );
  }
}
