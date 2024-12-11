import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';

class UpdateButtons extends GetView<MyAccountController> {
  const UpdateButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isChanged())
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    controller.resetValues(); // Reset all fields
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  elevation: 0,
                  child: Text(
                    StringManager.myAccountCancel.tr,
                    style: TextStyle(color: ColorManager.firstColor),
                  ),
                ),
                SizedBox(width: AppSize.s10),
                MaterialButton(
                  onPressed: () {
                    controller.updateValues(); // Send data to backend
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s20)),
                  color: ColorManager.firstColor,
                  elevation: 0.0,
                  child: Text(
                    StringManager.myAccountUpdate.tr,
                    style: TextStyle(color: ColorManager.whiteColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.s60)
          ],
        );
      else
        return SizedBox(height: AppSize.s60);
    });
  }
}
