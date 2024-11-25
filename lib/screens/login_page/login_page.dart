import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/login_page/widgets/input_login.dart';
import 'package:ngpiteapp/screens/login_page/widgets/submit_login.dart';
import 'package:ngpiteapp/screens/login_page/widgets/title_login.dart';
import 'package:ngpiteapp/screens/otp_page/otp_page.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/login_page/login_page_logic.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

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
                TitleLogin(),
                InputLogin(),
                SubmitLogin(),
                TermsAndPrivacy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
