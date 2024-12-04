import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/app/services/connection/network_info.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/users_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:ngpiteapp/screens/login_page/login_page.dart';
import 'package:ngpiteapp/screens/login_page/login_page_logic.dart';
import 'package:ngpiteapp/screens/otp_page/otp_page.dart';
import 'package:ngpiteapp/screens/otp_page/otp_page_logic.dart';

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final AuthRepositories = Get.find<ImpUsersRepositories>();
  final cache = Get.find<CacheServicesSharedPreferences>();
  final netCheck = Get.find<NetworkInfoImpl>();
  final isVisablePass = true.obs;
  final isVisablePassConf = true.obs;
  var loadingState = LoadingState.idle.obs;

  singUp(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    if (await netCheck.isConnected) {
      final response = await AuthRepositories.register(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: numberPhoneController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirm: confirmPasswordController.text);
      if (response.success) {
        SnackBarCustom.show(context, response.data[ApiKey.message]);
        loadingState.value = LoadingState.doneWithData;
        int idVerf = response.data[ApiKey.id];
        Get.off(() => OtpPage(), binding: OtpPageBinding(idVerf: idVerf));
      } else {
        SnackBarCustom.show(context, response.networkFailure!.message);
        loadingState.value = LoadingState.hasError;
      }
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
      loadingState.value = LoadingState.hasError;
    }
  }

  goToLogin() {
    Get.off(() => LoginPage(), binding: LoginPageBinding());
  }
}
