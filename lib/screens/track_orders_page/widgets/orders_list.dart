import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';
import 'package:ngpiteapp/screens/track_orders_page/widgets/order_card.dart';

class OrdersList extends GetView<TrackOrdersPageController> {
  const OrdersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.loadingState.value) {
        case LoadingState.loading:
          return PageCircularIndicator();
        case LoadingState.doneWithData:
          return controller.orders.length == 0
              ? EmptyListIndicator(text: StringManager.noOrdersFound)
              : Column(
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
