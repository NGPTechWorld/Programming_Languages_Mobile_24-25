import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';
import 'package:ngpiteapp/screens/track_orders_page/widgets/order_card.dart';

class OrdersList extends GetView<TrackOrdersPageController> {
  const OrdersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => ListView.builder(
        itemCount: controller.orders.length,
        itemBuilder: (context, index) {
          return OrderCard(index: index);
        },
      )),
    );
  }
}
