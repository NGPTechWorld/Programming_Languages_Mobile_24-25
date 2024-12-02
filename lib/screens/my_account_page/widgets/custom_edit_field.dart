import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/side_edit_button.dart';

class CustomEditField extends GetView<MyAccountController> {
  const CustomEditField({
    super.key,
    required this.title,
    required this.keyboardType,
    required this.fieldController,
    this.editable = true,
    this.obsecureText = false,
  });
  final FieldController fieldController;
  final String title;
  final TextInputType keyboardType;
  final bool obsecureText;
  final bool editable;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO : Maybe Add style to this
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(
                () => TextFormField(
                  controller: fieldController.controller,
                  focusNode: fieldController.focusNode,
                  enabled: editable
                      ? fieldController.isEditing.value
                      : false.obs.value,
                  obscureText: obsecureText,    
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorManager.firstColor)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorManager.firstColor)),
                  ),
                  onChanged: (value) {
                    controller.isChanged();
                  },
                ),
              ),
            ),
            SideEditButton(
              fieldController: fieldController,
              editable: editable,
            )
          ],
        ),
        SizedBox(height: AppSize.s8),
      ],
    );
  }
}
