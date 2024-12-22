import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/services/connection/network_info.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/enums/order_status_enum.dart';
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
    loadingState.value = LoadingState.loading;
    final responsePending = await OrdersRepositories.getOrdersByStatus(
        status: statusID[OrderStatusEnum.pending]!);
    final responseDelivering = await OrdersRepositories.getOrdersByStatus(
        status: statusID[OrderStatusEnum.delivering]!);

    if (responsePending.success && responseDelivering.success) {
      loadingState.value = LoadingState.doneWithData;
      orders.addAll(responsePending.data.reversed);
      orders.addAll(responseDelivering.data.reversed);
    } else {
      String msg = "Error! \n";
      if (responsePending.networkFailure != null)
        msg += "\nPending Orders : " + responsePending.networkFailure!.message;
      if (responseDelivering.networkFailure != null)
        msg += "\nDelivering Orders : " +
            responseDelivering.networkFailure!.message;

      SnackBarCustom.show(context, msg);
      loadingState.value = LoadingState.hasError;
    }
  }

  void onTap(int id, int statusid) {
    Get.to(
        () => OrderDetailsPage(
              orderId: id,
              statusId: statusid,
            ),
        binding: OrderDetailsBinding());
  }

  handleMenuSelection(String value, int index, BuildContext context) async {
    switch (value) {
      case StringManager.trackOrdersMenuEditValue:
        await editOrder(index);
        break;
      case StringManager.trackOrdersMenuCancelValue:
        await cancelOrder(index, context);
        break;
    }
  }

  cancelOrder(int index, BuildContext context) async {
    // loadingState.value = LoadingState.loading;
    final response = await OrdersRepositories.cancelOrder(id: orders[index].id);
    if (response.success) {
      loadingState.value = LoadingState.doneWithData;
      orders.removeAt(index);
      SnackBarCustom.show(context, response.data);
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  editOrder(int index) async {
    // go to edit order page with orders[index].id;
    print(orders[index].id);
  }
}
