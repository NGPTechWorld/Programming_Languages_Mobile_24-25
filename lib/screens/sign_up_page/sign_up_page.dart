import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/sign_up_page/sign_up_page_logic.dart';
import 'package:ngpiteapp/screens/sign_up_page/widgets/already_have_account_sign_up.dart';
import 'package:ngpiteapp/screens/sign_up_page/widgets/input_sign_up.dart';
import 'package:ngpiteapp/screens/sign_up_page/widgets/submit_sign_up.dart';
import 'package:ngpiteapp/screens/sign_up_page/widgets/title_sign_up.dart';

class SignUpPage extends GetView<SignUpPageController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizeScreen.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: controller.languageOnTap,
                  child: Icon(Icons.language),
                ),
                TitleSignUp(),
                InputSignUp(),
                SubmitSignUp(),
                AlreadyHaveAccontSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
