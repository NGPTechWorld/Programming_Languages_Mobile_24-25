import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
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
    final order = controller.orders[index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
        ),
        // TODO : Check this image.
        leading: Image.asset(AssetsManager.droneImage),
        title: Text(StringManager.ordersHistoryOrder.tr + " ${order.id}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${order.totalPrice}' + StringManager.orderDetailsSyrianPounds.tr, style: StyleManager.body02_Semibold()),
            Text(order.date),
          ],
        ),
        trailing: StatusLabel(statusId: order.statusId),
        onTap: () => controller.onTap(order.id),
      ),
    );
  }
}
