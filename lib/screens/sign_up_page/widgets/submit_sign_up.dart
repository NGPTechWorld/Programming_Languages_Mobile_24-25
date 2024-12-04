import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';
import 'package:ngpiteapp/screens/sign_up_page/sign_up_page_logic.dart';

class SubmitSignUp extends GetView<SignUpPageController> {
  const SubmitSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => DefaultButton(
            press: () {
              controller.singUp(context);
            },
            text: StringManager.signup.tr,
            style: StyleManager.h3_Bold(color: Colors.white),
            loading: controller.loadingState.value == LoadingState.loading,
          ),
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.03,
        ),
      ],
    );
  }
}
