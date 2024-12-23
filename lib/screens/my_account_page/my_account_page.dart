import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_custom.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/dialog_buttons.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/update_buttons.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/edit_fields.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/profile_picture.dart';

class MyAccountPage extends GetView<MyAccountController> {
  @override
  Widget build(BuildContext context) {
    controller.getUser(context);
    controller.getPicture(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            _handleBackNavigation(context);
          },
          child: SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              children: [
                ProfilePicture(),
                Obx(() => controller.loadingState.value == LoadingState.loading
                    ? PageCircularIndicator()
                    : Column(
                        children: [
                          EditFields(),
                          UpdateButtons(),
                        ],
                      )),
              ],
            ),
          )),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(
        StringManager.myAccountHeader.tr,
        style: StyleManager.h1_Medium(color: ColorManager.whiteColor),
      ),
      backgroundColor: ColorManager.firstColor,
      leading: BackButton(
        color: ColorManager.whiteColor,
        onPressed: () {
          _handleBackNavigation(context);
        },
      ),
      centerTitle: true,
    );
  }

  _handleBackNavigation(context) async {
    if (controller.changed.value) {
      final result = await Get.dialog<bool>(
        AlertDialog(
          title: Text(StringManager.myAccountDialogTitle.tr),
          content: Text(StringManager.myAccountDialogContent.tr),
          actions: [
            DialogButtons(
              cancelText: StringManager.myAccountDiscard.tr,
              okText: StringManager.myAccountUpdate.tr,
              onCancel: () {
                controller.resetValues();
                Get.back();
              },
              onOk: () async {
                await controller.updateValues(context);
                Get.back(result: true);
              },
            ),
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
