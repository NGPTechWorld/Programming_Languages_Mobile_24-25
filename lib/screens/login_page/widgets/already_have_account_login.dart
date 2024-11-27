import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/login_page/login_page_logic.dart';

class AlreadyHaveAccontLogin extends GetView<LoginPageController> {
  const AlreadyHaveAccontLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.contain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                StringManager.dontHaveAccount.tr,
                style: StyleManager.body01_Medium(
                    color: ColorManager.primary6Color),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                child: InkWell(
                  onTap: () => controller.goToSignUp(),
                  child: Text(
                    StringManager.signup.tr,
                    style: StyleManager.body01_Semibold(
                        color: ColorManager.firstColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.01,
        ),
      ],
    );
  }
}
