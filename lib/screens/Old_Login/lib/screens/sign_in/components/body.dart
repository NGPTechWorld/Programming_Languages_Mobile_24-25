import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/main_title.dart';
import 'package:shop_app/components/new_account_text.dart';
import 'package:shop_app/components/subtitile.dart';

import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/sign_in_form_controller.dart';

import 'package:shop_app/screens/forgot_password/forgot_password.dart';
import 'package:shop_app/screens/sign_in/components/sign_in_form.dart';
import 'package:shop_app/screens/sign_in/components/socail_login_cards.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final SignInFormController formController = Get.put(SignInFormController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width[20]),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            const MainTitle(title: "Welcome Back"),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            const Subtitile(
                subtitle:
                    'Sign in with your email and password \nor continue with social media'),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            SignInForm(),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: width[20]),
                child: Obx(
                  () => DefaultButton(
                      text: 'Continue',
                      press: () async {
                        await formController.validate();
                      },
                      loading: formController.status.value == Status.loading),
                )),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            const SocailLoginCards(),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            const NewAccountText()
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordLabel extends StatelessWidget {
  const ForgotPasswordLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: const Text(
          'Forgot Password?',
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        onTap: () {
          Get.toNamed(ForgotPasswordScreen.route);
        },
      );
}
