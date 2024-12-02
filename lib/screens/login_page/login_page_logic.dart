import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ngpiteapp/screens/otp_page/otp_page.dart';
import 'package:ngpiteapp/screens/otp_page/otp_page_logic.dart';
import 'package:ngpiteapp/screens/sign_up_page/sign_up_page.dart';
import 'package:ngpiteapp/screens/sign_up_page/sign_up_page_logic.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}

class LoginPageController extends GetxController {
  final numberPhoneController = TextEditingController();
  final passwordController = TextEditingController();

  login() {
    Get.to(() => OtpPage(), binding: OtpPageBinding());
  }

  goToSignUp() {
    Get.to(() => SignUpPage(), binding: SignUpPageBinging());
  }
}
