import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/services/connection/network_info.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/users_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/helper_widget.dart';
import 'package:ngpiteapp/screens/custom_widgets/show_loading_dialog.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/orders_history_page/orders_history_page.dart';
import 'package:ngpiteapp/screens/orders_history_page/orders_history_page_logic.dart';
import 'package:ngpiteapp/screens/show_addresses_page/show_addresses_page.dart';
import 'package:ngpiteapp/screens/show_addresses_page/show_addresses_page_logic.dart';
import 'package:ngpiteapp/screens/start_page/start_page.dart';
import 'package:ngpiteapp/screens/start_page/start_page_logic.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilePageController());
  }
}

class ProfilePageController extends GetxController {
  var loadingState = LoadingState.idle.obs;
  var loadingImageState = LoadingState.idle.obs;
  RxString imagePath = "".obs;
  RxString name = " ".obs;

  final netCheck = Get.find<NetworkInfoImpl>();
  final AuthRepositories = Get.find<ImpUsersRepositories>();
  final cache = Get.find<CacheServicesSharedPreferences>();

  myAccountOnTap() {
    Get.to(() => MyAccountPage(), binding: MyAccountBinding());
  }

  trackOrderOnTap() {
    Get.to(() => TrackOrdersPage(), binding: TrackOrdersBinding());
  }

  addressesOnTap() {
    Get.to(() => ShowAddressesPage(), binding: ShowAddressesBinding());
  }

  orderHistoryOnTap() {
    Get.to(() => OrdersHistoryPage(), binding: OrdersHistoryBinding());
  }

  languageOnTap() {
    HelperWidget.languageDialgo();
  }

  getName(BuildContext context) async {
    final response = await AuthRepositories.userName();
    if (response.success) {
      name.value = response.data;
    }
  }

  getPicture(BuildContext context) async {
    loadingImageState.value = LoadingState.loading;
    final response = await AuthRepositories.getImage();

    if (response.success) {
      loadingImageState.value = LoadingState.doneWithData;
      imagePath.value = response.data ?? "";
      print(response.data);
    } else {
      loadingImageState.value = LoadingState.hasError;
    }
  }

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

  void showImage() {}
}
