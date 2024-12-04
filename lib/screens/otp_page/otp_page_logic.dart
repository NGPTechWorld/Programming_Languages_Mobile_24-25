import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/users_repositories.dart';
import 'package:ngpiteapp/screens/address_page/address_page.dart';
import 'package:ngpiteapp/screens/address_page/address_page_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:ngpiteapp/screens/login_page/login_page_logic.dart';

class OtpPageBinding extends Bindings {
  int idVerf;
  OtpPageBinding({
    required this.idVerf,
  });
  @override
  void dependencies() {
    Get.put(OtpPageController(idVerf: idVerf));
  }
}

class OtpPageController extends GetxController {
  final textEditingController = TextEditingController();
  int idVerf;
  final AuthRepositories = Get.find<ImpUsersRepositories>();
  final loginController = Get.find<LoginPageController>();
  var loadingState = LoadingState.idle.obs;
  OtpPageController({
    required this.idVerf,
  });

  verifyNumber(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    print(textEditingController.text + idVerf.toString());
    final response = await AuthRepositories.verifyNumber(
        verify_code: textEditingController.text, id: idVerf);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.loginSuccess.tr);
      loadingState.value = LoadingState.doneWithData;
      await loginController.loginWithSignUp(context);
      Get.off(() => AddressPage(), binding: AddressPageBinding());
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }
}
