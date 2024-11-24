import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/email_field_controller.dart';
import 'package:shop_app/controller/password_field_controller.dart';
import 'package:shop_app/screens/login_success/login_success.dart';

class SignInFormController extends GetxController {
  late PasswordController passwordController;
  late EmailFieldController emailFieldController;
  late GlobalKey<FormState> formKey;
  RxBool rememberMe = false.obs;
  Rx<Status> status = Status.idle.obs;
  SignInFormController() {
    passwordController = Get.put(PasswordController());
    emailFieldController = Get.put(EmailFieldController());
    formKey = GlobalKey<FormState>();
  }
  void changeRememberMe(bool? value) {
    rememberMe.value = value!;
  }

  validate() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      status.value = Status.loading;
      await signIn();
      switch (status.value) {
        case Status.accepted:
          Get.toNamed(LoginSuccessScreen.route);
        case Status.wrongUserNameOrPassword:
          Get.snackbar("Oops!", "Wrong username or password");
        case Status.loading:
        case Status.idle:
      }
    }
  }

  signIn() async {
    try {
      final response = await Dio().post("http://10.0.2.2:3000/user/login",
          data: {
            "email": emailFieldController.email,
            "password": passwordController.password
          });
      status.value = Status.accepted;
      return response;
    } catch (e) {
      status.value = Status.wrongUserNameOrPassword;
      print(e.toString());
    }
  }
}

enum Status { idle, accepted, loading, wrongUserNameOrPassword }
