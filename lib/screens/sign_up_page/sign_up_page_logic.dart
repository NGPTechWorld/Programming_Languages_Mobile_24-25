import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/address_page/address_page.dart';
import 'package:ngpiteapp/screens/address_page/address_page_logic.dart';
import 'package:ngpiteapp/screens/login_page/login_page.dart';
import 'package:ngpiteapp/screens/login_page/login_page_logic.dart';

class SignUpPageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpPageController());
  }
}

class SignUpPageController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final numberPhoneController = TextEditingController();
  final passwordController = TextEditingController();

  singUp() {
    Get.to(() => AddressPage(), binding: AddressPageBinding());
  }

  goToLogin() {
    Get.off(() => LoginPage(), binding: LoginPageBinding());
  }
}
