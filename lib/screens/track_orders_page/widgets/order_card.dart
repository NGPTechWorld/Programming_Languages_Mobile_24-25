import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';
import 'package:ngpiteapp/screens/track_orders_page/widgets/status_label.dart';


// TODO String Manager values for order and other things
class OrderCard extends GetView<TrackOrdersPageController> {
   OrderCard({
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
        contentPadding: EdgeInsets.only(left: AppPadding.p10),

        // TODO Change this icon
        leading: const Icon(Icons.image, size: 50, color: Colors.grey),
        title: Text(StringManager.tarckOrdersOrder.tr + " ${index + 1}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${order.totalPrice} ' + StringManager.orderDetailsSyrianPounds.tr, style: StyleManager.body02_Semibold()),
            Text(order.date),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            StatusLabel(status: order.status),
            PopupMenuButton<String>(
              onSelected: (value) =>
                  controller.handleMenuSelection(value, index),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                 PopupMenuItem<String>(
                  value: StringManager.trackOrdersMenuEditValue,
                  child: Text(StringManager.trackOrdersMenuEditText.tr),
                ),
                 PopupMenuItem<String>(
                  value: StringManager.trackOrdersMenuCancelValue,
                  child: Text(StringManager.trackOrdersMenuCancelText.tr),
                ),
              ],
              //TODO : Check this icon
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        onTap: () => controller.onTap(index),
      ),
    );
  }
}
