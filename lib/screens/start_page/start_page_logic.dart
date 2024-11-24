
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:ngpiteapp/data/cache/const.dart';
import 'package:ngpiteapp/data/enums/app_state_enum.dart';
import 'package:ngpiteapp/data/repositories/auth_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/module/settings_model.dart';

class StartPageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(StartPageController());
  }
}

class StartPageController extends GetxController {
  final isConnectedPage = true.obs;
  final AuthRepositories = Get.find<ImpAuthRepositories>();
  CacheServicesSharedPreferences cache =
      Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  var appState = AppState.run.obs;


  Future<void> checkInternetAndFetchData(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await AuthRepositories.getSettings();
    if (response.success) {
      settingApp = response.data;
      await _handleSettings(settingApp!, context);
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
      if (response.networkFailure!.code == -6) await transPages(context, false);
    }
  }

  Future<void> _handleSettings(
      SettingsModel appSettings, BuildContext context) async {
    if (appSettings.update || appSettings.version != versionApp) {
      appState.value = AppState.update;
    } else if (appSettings.repair) {
      appState.value = AppState.repair;
    } else {
      appState.value = AppState.run;
      await transPages(context, true);
    }
  }

  launchURL(BuildContext context) async {
    final Uri url = Uri.parse(settingApp!.urlupdate);
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  restApp(BuildContext context) {
    appState.value = AppState.run;
    loadingState.value = LoadingState.idle;
    checkInternetAndFetchData(context);
  }

  transPages(BuildContext context, bool isConnected) async {
    if (await cache.containsKey(kUserLoginModelKey)) {

      // Get.off(() => ProfilePage(), binding: ProfilePageBinding());
    } else if (isConnected) {
      // Get.off(() => LoginPage(), binding: LoginPageBinding());
    } else {
      isConnectedPage.value = false;
      loadingState.value = LoadingState.loading;
    }
  }


}
