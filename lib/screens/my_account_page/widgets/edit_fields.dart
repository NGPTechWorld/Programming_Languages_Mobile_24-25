import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/custom_edit_field.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/password_fields.dart';

class EditFields extends GetView<MyAccountController> {
  const EditFields({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomEditField(
          title: StringManager.myAccountFirstName.tr,
          fieldController: controller.firstNameFieldControllor,
          keyboardType: TextInputType.name,
        ),
        CustomEditField(
          title: StringManager.myAccountLastName.tr,
          fieldController: controller.lastNameFieldControllor,
          keyboardType: TextInputType.name,
        ),
        CustomEditField(
          title: StringManager.myAccountEmail.tr,
          fieldController: controller.emailFieldControllor,
          keyboardType: TextInputType.emailAddress,
        ),
        CustomEditField(
            title: StringManager.myAccountPhone.tr,
            fieldController: controller.phoneFieldControllor,
            keyboardType: TextInputType.phone,
            editable: false),
        PasswordFields(passwordController: controller.passwordController),
        TextButton(
            onPressed: controller.forgotPassword,
            child: Text(
              StringManager.myAccountForgotPassword.tr,
              style:
                  StyleManager.body01_Regular(color: ColorManager.firstColor),
              textAlign: TextAlign.start,
            )),
      ],
    );
  }
}
