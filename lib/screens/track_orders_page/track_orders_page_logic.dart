import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/services/connection/network_info.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/orders_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';

class TrackOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrackOrdersPageController());
  }
}

class TrackOrdersPageController extends GetxController {
  final orders = [].obs;
  final OrdersRepositories = Get.find<ImpOrdersRepositories>();
  final netCheck = Get.find<NetworkInfoImpl>();
  var loadingState = LoadingState.idle.obs;

  getOrders(BuildContext context) async {
    if (await netCheck.isConnected) {
      loadingState.value = LoadingState.loading;
      final response = await OrdersRepositories.getOrders();
      print(response.data);
      if (response.success) {
        loadingState.value = LoadingState.doneWithData;
        orders.addAll(response.data.reversed);
      } else {
      }
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
      loadingState.value = LoadingState.hasError;
    }
  }

  void onTap(int id) {
    Get.to(() => OrderDetailsPage(id:id),
        binding: OrderDetailsBinding());
  }

  handleMenuSelection(String value, int index) {
    switch (value) {
      case StringManager.trackOrdersMenuEditValue:
        editOrder(index);
        break;
      case StringManager.trackOrdersMenuCancelValue:
        cancelOrder(index);
        break;
    }
  }

  void cancelOrder(int index) {}

  void editOrder(int index) {}
}
