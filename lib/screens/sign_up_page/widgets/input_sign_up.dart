import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/text_field_custom.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/sign_up_page/sign_up_page_logic.dart';

class InputSignUp extends GetView<SignUpPageController> {
  const InputSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFieldCustom(
                title: StringManager.firstName.tr,
                controller: controller.firstNameController,
              ),
            ),
            SizedBox(
              width: AppPadding.p16,
            ),
            Expanded(
              child: TextFieldCustom(
                title: StringManager.lastName.tr,
                controller: controller.lastNameController,
              ),
            ),
          ],
        ),
        TextFieldCustom(
          controller: controller.numberPhoneController,
          hintText: "09xxxxxxxx",
          title: StringManager.numberPhone.tr,
          isNumberPhone: true,
          keyboardType: TextInputType.number,
          suffixIcon: Icon(Icons.phone),
        ),
        TextFieldCustom(
          controller: controller.emailController,
          hintText: "test@example.com",
          title: StringManager.email.tr,
          isNumberPhone: true,
          suffixIcon: Icon(Icons.email),
        ),
        TextFieldCustom(
          controller: controller.passwordController,
          isPassword: true,
          title: StringManager.password.tr,
          obscureText: true,
          suffixIcon: Icon(Icons.lock_outline_rounded),
        ),
        TextFieldCustom(
          controller: controller.confirmPasswordController,
          isPassword: true,
          title: StringManager.confirmPassword.tr,
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
