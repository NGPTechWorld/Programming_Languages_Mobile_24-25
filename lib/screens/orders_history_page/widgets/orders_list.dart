import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/orders_history_page/orders_history_page_logic.dart';
import 'package:ngpiteapp/screens/orders_history_page/widgets/order_card.dart';

class OrdersList extends GetView<OrdersHistoryPageController> {
  const OrdersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => GestureDetector(
            child: ListView.builder(
              itemCount: controller.orders.length,
              itemBuilder: (context, index) {
                return OrderCard(index: index);
              },
            ),
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity != null) {
                if (details.primaryVelocity! < 0) {
                  controller.isCurrentSelected.value = false;
                } else if (details.primaryVelocity! > 0) {
                  controller.isCurrentSelected.value = true;
                }
              }
            },
          )),
    );
  }
}
