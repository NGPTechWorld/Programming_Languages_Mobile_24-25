import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/email_field_controller.dart';

class ForgotPasswordFormController extends GetxController {
  late EmailFieldController emailFieldController;
  late GlobalKey<FormState> formKey;
  RxBool rememberMe = false.obs;
  ForgotPasswordFormController() {
    emailFieldController = Get.put(EmailFieldController());
    formKey = GlobalKey<FormState>();
  }
  bool validate(String route) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // Get.toNamed();
      return true;
    }
    return false;
  }
}
