import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/fields/email_field.dart';
import 'package:shop_app/components/fields/password_field.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/sign_in_form_controller.dart';
import 'package:shop_app/screens/sign_in/components/body.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});
  final SignInFormController formController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formController.formKey,
        child: Column(
          children: [
            EmailField(controller: formController.emailFieldController),
            PasswordField(controller: formController.passwordController),
            Row(children: [
              buildRememberMe(),
              const Spacer(),
              const ForgotPasswordLabel()
            ]),
          ],
        ));
  }

  Row buildRememberMe() {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: formController.rememberMe.value,
            activeColor: kPrimaryColor,
            onChanged: formController.changeRememberMe,
          ),
        ),
        const Text('Remember me')
      ],
    );
  }
}
