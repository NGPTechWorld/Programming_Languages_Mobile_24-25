import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/users_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/show_loading_dialog.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/start_page/start_page.dart';
import 'package:ngpiteapp/screens/start_page/start_page_logic.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilePageController());
  }
}

class ProfilePageController extends GetxController {
  var loadingState = LoadingState.idle.obs;
  final AuthRepositories = Get.find<ImpUsersRepositories>();
  final cache = Get.find<CacheServicesSharedPreferences>();
  myAccountOnTap() {
    Get.to(() => MyAccountPage(), binding: MyAccountBinding());
  }

  trackOrderOnTap() {}
  loactionOnTap() {}
  orderHistoryOnTap() {}
  languageOnTap() {}
  helpOnTap() {}

  logout(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    showLoadingDialog(context);
    final response = await AuthRepositories.logout();
    if (response.success) {
      cache.clearData();
      SnackBarCustom.show(context, response.data.toString());
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
    Get.offAll(StartPage(), binding: StartPageBinging());
  }

  String getName() {
    return "TempName";
  }
}
