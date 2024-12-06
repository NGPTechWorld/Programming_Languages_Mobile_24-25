import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/info_row.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class OrderInfo extends GetView<OrderDetailsPageController> {
  const OrderInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Order order = controller.order;
    return Column(
      children: [
        InfoRow(
            leading: StringManager.orderDetailsId.tr, content: '${order.id}'),
        InfoRow(
            leading: StringManager.orderDetailsStatus.tr,
            content: order.status),
        InfoRow(
            leading: StringManager.orderDetailsDate.tr, content: order.date),
        InfoRow(
            leading: StringManager.orderDetailsAddress.tr,
            content: order.address),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
