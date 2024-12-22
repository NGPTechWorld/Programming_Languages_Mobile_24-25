// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';

import 'package:ngpiteapp/app/services/connection/network_info.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/users_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';

class ForgotPasswordPageBinding extends Bindings {
  final String email;
  final String number;

  ForgotPasswordPageBinding({required this.email, required this.number});

  @override
  void dependencies() {
    Get.put(ForgotPasswordController(email: email, number: number));
  }
}

class ForgotPasswordController extends GetxController {
  final userRepo = Get.find<ImpUsersRepositories>();
  final netCheck = Get.find<NetworkInfoImpl>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final codeController = TextEditingController();
  String email;
  String number;
  int id = 0;
  final isVisablePass = true.obs;
  final isVisablePassConf = true.obs;
  var loadingState = LoadingState.idle.obs;
  var sendingState = LoadingState.idle.obs;

  ForgotPasswordController({
    required this.email,
    required this.number,
  });
  sendCode(BuildContext context) async {
    sendingState.value = LoadingState.loading;
    if (await netCheck.isConnected) {
      final response = await userRepo.forgatePassword(number: number);
      if (response.success) {
        SnackBarCustom.show(context, response.data.message);
        sendingState.value = LoadingState.doneWithData;
        id = response.data.id;
      } else {
        SnackBarCustom.show(context, response.networkFailure!.message);
        sendingState.value = LoadingState.hasError;
      }
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
      loadingState.value = LoadingState.hasError;
    }
  }

  verify(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await userRepo.verifyNewPassword(
        id: id, verify_code: codeController.text);
    if (response.success) {
      final passResponse = await userRepo.setPassword(
          id: id,
          password: passwordController.text,
          password_confirmation: confirmPasswordController.text);
      if (passResponse.success) {
        SnackBarCustom.show(context, passResponse.data);
        loadingState.value = LoadingState.doneWithData;
      } else {
        SnackBarCustom.show(context, passResponse.networkFailure!.message);
        loadingState.value = LoadingState.hasError;
      }
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }
}
