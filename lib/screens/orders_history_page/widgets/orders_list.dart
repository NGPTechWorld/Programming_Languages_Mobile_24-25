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
    return Obx(() => Column(
        children: List.generate(
      controller.orders.length,
      (index) => OrderCard(index: index),
    )));
  }
}
