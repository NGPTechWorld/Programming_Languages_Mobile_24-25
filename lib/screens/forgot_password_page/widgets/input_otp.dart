import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/pininput_custom.dart';
import 'package:ngpiteapp/screens/custom_widgets/text_field_custom.dart';
import 'package:ngpiteapp/screens/forgot_password_page/forgot_password_page_logic.dart';

class InputOtp extends GetView<ForgotPasswordController> {
  const InputOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.01,
        ),
        Obx(
          () => TextFieldCustom(
            fillColor: ColorManager.whiteColor,
            controller: controller.passwordController,
            isPassword: true,
            title: StringManager.password.tr,
            suffixIcon: InkWell(
              child: Icon(Icons.lock_outline_rounded),
              onTap: () {
                controller.isVisablePass.value =
                    !controller.isVisablePass.value;
              },
            ),
            obscureText: controller.isVisablePass.value,
          ),
        ),
        Obx(
          () => TextFieldCustom(
            controller: controller.confirmPasswordController,
            isPassword: true,
            title: StringManager.confirmPassword.tr,
            fillColor: ColorManager.whiteColor,
            suffixIcon: InkWell(
              child: Icon(Icons.lock_outline_rounded),
              onTap: () {
                controller.isVisablePassConf.value =
                    !controller.isVisablePassConf.value;
              },
            ),
            obscureText: controller.isVisablePassConf.value,
          ),
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.05,
        ),
        PininputCustom(controller: controller.codeController
        ),
            
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.1,
        ),
      ],
    );
  }
}
