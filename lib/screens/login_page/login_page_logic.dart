import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/auth_repositories.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_custom.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
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
  final AuthRepositories = Get.find<ImpAuthRepositories>();
  final cache = Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;

  login(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await AuthRepositories.login(
        number: numberPhoneController.text, password: passwordController.text);
    if (response.success) {
      final saveState =
          await cache.saveData(kUserTokenKey, response.data.bearerToken);
      if (saveState) {
        SnackBarCustom.show(context, StringManager.loginSuccess.tr);
        loadingState.value = LoadingState.doneWithData;
        Get.offAll(() => CurvedNavigationBarCustom(),
            binding: CurvedNavigationBarBinding());
      }
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      if (response.networkFailure!.message == "user has not been verified")
        //Get.off(() => OtpPage(), binding: OtpPageBinding());
        loadingState.value = LoadingState.hasError;
    }
  }

  goToSignUp() {
    Get.off(() => SignUpPage(), binding: SignUpPageBinging());
  }
}
