import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/text_field_custom.dart';
import 'package:ngpiteapp/screens/login_page/login_page_logic.dart';
import 'package:get/get.dart';

class InputLogin extends GetView<LoginPageController> {
  const InputLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(StringManager.enterPhoneNumber.tr,
            style: StyleManager.body01_Semibold()),
        TextFieldCustom(
          controller: controller.numberPhoneController,
          title: "09xxxxxxxx",
          isNumberPhone: true,
          keyboardType: TextInputType.number,
          prefixIcon: Icon(Icons.phone),
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.1,
        ),
      ],
    );
  }
}
