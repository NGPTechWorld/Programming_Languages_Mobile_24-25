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
          hintText: "09xxxxxxxx",
          isNumberPhone: true,
          keyboardType: TextInputType.number,
          suffixIcon: Icon(Icons.phone),
        ),
        Text(StringManager.password.tr, style: StyleManager.body01_Semibold()),
        TextFieldCustom(
          controller: controller.passwordController,
          isPassword: true,
          obscureText: true,
          suffixIcon: Icon(Icons.lock_outline_rounded),
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.01,
        ),
      ],
    );
  }
}
