import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';
import 'package:ngpiteapp/screens/forgot_password_page/forgot_password_page_logic.dart';

class SubmitOtp extends GetView<ForgotPasswordController> {
  const SubmitOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => DefaultButton(
            press: () => controller.verify(context),
            text: StringManager.forgotPassowrdVerify.tr,
            style: StyleManager.h3_Bold(color: Colors.white),
            loading: controller.loadingState.value == LoadingState.loading,
          ),
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.05,
        ),
      ],
    );
  }
}
