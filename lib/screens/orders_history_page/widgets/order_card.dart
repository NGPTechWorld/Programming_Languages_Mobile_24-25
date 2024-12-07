import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/orders_history_page/orders_history_page.dart';
import 'package:ngpiteapp/screens/orders_history_page/orders_history_page_logic.dart';
import 'package:ngpiteapp/screens/orders_history_page/widgets/status_label.dart';

class OrderCard extends GetView<OrdersHistoryPageController> {
  const OrderCard({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    final Order order = controller.orders[index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
        ),
        leading: const Icon(Icons.image, size: 50, color: Colors.grey),
        title: Text(StringManager.ordersHistoryOrder.tr + " ${order.id + 1}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${order.price}', style: StyleManager.body02_Semibold()),
            Text(order.date),
          ],
        ),
        trailing: StatusLabel(status: order.status),
        onTap: () => controller.onTap(order.id),
      ),
    );
  }
}
