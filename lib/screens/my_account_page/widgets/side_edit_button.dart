import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';

class SideEditButton extends StatelessWidget {
  const SideEditButton({
    super.key,
    required this.fieldController,
  });

  final FieldController fieldController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: fieldController.toggleEdit,
        child: Obx(
          () => TextButton(
            onPressed: () {
              fieldController.toggleEdit();
            },
            child: Text(
              fieldController.isEditing.value
                  ? StringManager.myAccountFinish.tr
                  : StringManager.myAccountEdit.tr,
              style:
                  StyleManager.body01_Regular(color: ColorManager.firstColor),
            ),
          ),
        ));
  }
}
