import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/custom_edit_field.dart';

class EditFields extends GetView<MyAccountController> {
  const EditFields({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomEditField(
          title: StringManager.myAccountFirstName.tr,
          fieldController: controller.firstNameFieldControllor,
        ),
        SizedBox(height: AppSize.s8),
        CustomEditField(
          title: StringManager.myAccountLastName.tr,
          fieldController: controller.lastNameFieldControllor,
        ),
        SizedBox(height: AppSize.s8),
        CustomEditField(
          title: StringManager.myAccountEmail.tr,
          fieldController: controller.emailFieldControllor,
        ),
        SizedBox(height: AppSize.s8),
        CustomEditField(
          title: StringManager.myAccountPhone.tr,
          fieldController: controller.phoneFieldControllor,
        ),
        SizedBox(height: AppSize.s20),
      ],
    );
  }
}
