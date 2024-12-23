import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/data/entities/order_details_entite.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/orders_repositories.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailsPageController());
  }
}

class OrderDetailsPageController extends GetxController {
  final order = Rxn<OrderDetailsEntite>();
  final OrdersRepositories = Get.find<ImpOrdersRepositories>();
  var loadingState = LoadingState.idle.obs;
  int orderId = 1;
  int statusId = 1;
  void requestOrderData(int id, int stautsId, BuildContext context) async {
    this.orderId = id;
    this.statusId = stautsId;
    loadingState.value = LoadingState.loading;
    final response = await OrdersRepositories.getOrder(id: id);

    if (response.success) {
      loadingState.value = LoadingState.doneWithData;
      order.value = response.data;
    } else {
      order.value = null;
    }
  }
}
