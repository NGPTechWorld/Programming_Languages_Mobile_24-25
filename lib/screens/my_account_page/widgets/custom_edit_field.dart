import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/side_edit_button.dart';

class CustomEditField extends GetView<MyAccountController> {
  const CustomEditField({
    required this.title,
    super.key,
    required this.fieldController,
  });
  final FieldController fieldController;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(
                () => TextFormField(
                  controller: fieldController.controller,
                  focusNode: fieldController.focusNode,
                  enabled: fieldController.isEditing.value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    controller.isChanged();
                  },
                ),
              ),
            ),
            SideEditButton(fieldController: fieldController)
          ],
        ),
        Divider(
          height: AppSize.s6,
        ),
      ],
    );
  }
}
