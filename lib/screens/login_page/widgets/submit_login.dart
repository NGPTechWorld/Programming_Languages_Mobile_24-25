import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';
import 'package:ngpiteapp/screens/login_page/login_page_logic.dart';

class SubmitLogin extends GetView<LoginPageController> {
  const SubmitLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          press: () => controller.login,
          text: StringManager.login.tr,
          style: StyleManager.h3_Bold(color: Colors.white),
          loading: false,
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.05,
        ),
      ],
    );
  }
}
