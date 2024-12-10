import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/orders_history_page/orders_history_page_logic.dart';
import 'package:ngpiteapp/screens/orders_history_page/widgets/order_card.dart';
import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';

class OrdersList extends GetView<OrdersHistoryPageController> {
  const OrdersList({
    super.key,
  });
  // TODO : Handle Loading States widgets
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.loadingState.value) {
        case LoadingState.loading:
         return PageCircularIndicator();
        case LoadingState.doneWithData:
          return Column(
              children: List.generate(
            controller.orders.length,
            (index) => OrderCard(index: index),
          ));
        case LoadingState.idle:
        return Text("No Internet");
        case LoadingState.doneWithNoData:
        return Text("There is no Orders"); 
        case LoadingState.hasError:
        return Text("Error");
      }
     });
  }
}
