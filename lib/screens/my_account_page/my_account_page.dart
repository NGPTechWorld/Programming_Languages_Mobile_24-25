import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/dialog_buttons.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/edit_buttons.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/edit_fields.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/profile_picture.dart';

class MyAccountPage extends GetView<MyAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePicture(),
              EditFields(),
              EditButtons(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringManager.myAccountHeader.tr,
        style: StyleManager.h1_Medium(color: ColorManager.whiteColor),
      ),
      backgroundColor: ColorManager.firstColor,
      leading: BackButton(
        color: ColorManager.whiteColor,
        onPressed: () {
          _handleBackNavigation();
        },
      ),
      centerTitle: true,
    );
  }

  _handleBackNavigation() async {
    if (controller.changed.value) {
      final result = await Get.dialog<bool>(
        AlertDialog(
          title: Text(StringManager.myAccountDialogTitle.tr),
          content: Text(StringManager.myAccountDialogContent.tr),
          actions: [
            DialogButtons(),
          ],
        ),
      );
      if (result == true) {
        Get.back();
      }
      return;
    }
    Get.back();
  }
}
