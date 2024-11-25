import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ngpiteapp/screens/otp_page/otp_page.dart';
import 'package:ngpiteapp/screens/otp_page/otp_page_logic.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}

class LoginPageController extends GetxController {
  final numberPhoneController = TextEditingController();

  login() {
    Get.to(() => OtpPage(), binding: OtpPageBinding());
  }
}
