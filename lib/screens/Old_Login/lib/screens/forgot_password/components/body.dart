import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/fields/email_field.dart';
import 'package:shop_app/components/main_title.dart';
import 'package:shop_app/components/new_account_text.dart';
import 'package:shop_app/components/subtitile.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/forgot_password_form_controller.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  Body({super.key});
  final controller = Get.put(ForgotPasswordFormController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width[30]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            
            const MainTitle(title: "Forgot Password"),
            
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            
            const Subtitile(
                subtitle:
                    "Please enter your email and we will send\nyou a link to return to your account"),
            
            SizedBox(height: SizeConfig.screenHeight * 0.15),
            
            Form(
                key: controller.formKey,
                child: EmailField(controller: controller.emailFieldController)),

            SizedBox(height: SizeConfig.screenHeight * 0.15),
            
            DefaultButton(
                text: 'Continue',
                press: () {
                  controller.validate("SomeRoute");
                  
                }),
            
            SizedBox(height: SizeConfig.screenHeight * 0.15),
            
            const NewAccountText(),
          ],
        ),
      ),
    );
  }
}
