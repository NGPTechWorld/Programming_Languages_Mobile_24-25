import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/custom_edit_field.dart';

class PasswordFields extends GetView<MyAccountController> {
  const PasswordFields({
    super.key,
    required this.passwordController,
  });

  final PasswordController passwordController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: passwordController.toggleVisible,
            child: Text(
              passwordController.visible.value
                  ? StringManager.myAccountChangePasswordCancel.tr
                  : StringManager.myAccountChangePassword.tr,
              style:
                  StyleManager.body01_Regular(color: ColorManager.firstColor),
              textAlign: TextAlign.center,
            ),
          ),
          Obx(() {
            if (passwordController.isVisible())
              return Column(
                children: [
                  CustomEditField(
                      title: StringManager.myAccountOldPassword.tr,
                      keyboardType: TextInputType.visiblePassword,
                      obsecureText: true,
                      fieldController:
                          passwordController.oldPasswordController),
                  CustomEditField(
                      title: StringManager.myAccountNewPassword.tr,
                      keyboardType: TextInputType.visiblePassword,
                      obsecureText: true,
                      fieldController:
                          passwordController.newPasswordController),
                  CustomEditField(
                      title: StringManager.myAccountConfirmPassword.tr,
                      keyboardType: TextInputType.visiblePassword,
                      obsecureText: true,
                      fieldController:
                          passwordController.confirmPasswordController)
                ],
              );

            return SizedBox();
          })
        ],
      ),
    );
  }
}
