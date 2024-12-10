import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/connection/network_info.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/enums/order_status_enum.dart';
import 'package:ngpiteapp/data/repositories/orders_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';

class OrdersHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersHistoryPageController());
  }
}

class OrdersHistoryPageController extends GetxController {
  final OrdersRepositories = Get.find<ImpOrdersRepositories>();
  final netCheck = Get.find<NetworkInfoImpl>();

  var isCompletedSelected = true.obs;
  var loadingState = LoadingState.idle.obs;

  final completedOrders = [].obs;
  final incompletedOrders = [].obs;
  getOrders(BuildContext context) async {
    if (await netCheck.isConnected) {
      loadingState.value = LoadingState.loading;
      final responseCompleted = await OrdersRepositories.getOrdersByStatus(
          status: statusID[OrderStatusEnum.completed]!);

      final responseRejected = await OrdersRepositories.getOrdersByStatus(
          status: statusID[OrderStatusEnum.rejected]!);

      final responseCanceled = await OrdersRepositories.getOrdersByStatus(
          status: statusID[OrderStatusEnum.cancelled]!);
      if (responseCompleted.success &&
          responseCanceled.success &&
          responseRejected.success) {

            // TODO : Check whether to reverse them or not 
        completedOrders.addAll(responseCompleted.data);
        incompletedOrders.addAll(responseRejected.data);
        incompletedOrders.addAll(responseCanceled.data);
        loadingState.value = LoadingState.doneWithData;
      } else {
        _handleErrorMessage(responseCanceled, responseRejected, responseCompleted, context);
      }
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
      loadingState.value = LoadingState.hasError;
    }
  }

  void _handleErrorMessage(AppResponse<dynamic> responseCanceled, AppResponse<dynamic> responseRejected, AppResponse<dynamic> responseCompleted, BuildContext context) {
    String msg = "Error! \n";
    if (responseCanceled.networkFailure != null)
      msg +="\nCanceled Orders : " + responseCanceled.networkFailure!.message;
    if (responseRejected.networkFailure != null)
      msg +="\nRejected Orders : " + responseRejected.networkFailure!.message;
    if (responseCompleted.networkFailure != null)
      msg += "\nCompleted Orders : " +responseCompleted.networkFailure!.message;
    SnackBarCustom.show(context, msg);
    loadingState.value = LoadingState.hasError;
  }

  List get orders =>
      isCompletedSelected.value ? completedOrders : incompletedOrders;

  void onTap(int id) {
    Get.to(() => OrderDetailsPage(id: id), binding: OrderDetailsBinding());
  }
}
