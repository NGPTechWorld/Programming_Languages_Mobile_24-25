import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/sign_up_page/sign_up_page_logic.dart';

class AlreadyHaveAccontSignUp extends GetView<SignUpPageController> {
  const AlreadyHaveAccontSignUp({super.key});

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
                StringManager.alreadyHaveAccount.tr,
                style: StyleManager.body01_Medium(
                    color: ColorManager.primary6Color),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                child: InkWell(
                  onTap: () => controller.goToLogin(),
                  child: Text(
                    StringManager.login.tr,
                    style: StyleManager.body01_Semibold(
                        color: ColorManager.firstColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.05,
        ),
      ],
    );
  }
}
