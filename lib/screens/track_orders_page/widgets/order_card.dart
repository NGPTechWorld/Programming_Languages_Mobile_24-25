import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/track_orders_page/widgets/status_label.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class OrderCard extends GetView<TrackOrdersPageController> {
  const OrderCard({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    final order = controller.orders[index];
    return Card(
      color: ColorManager.primary1Color,
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
        ),
        contentPadding: EdgeInsets.only(
          left: AppPadding.p10,
          right: AppPadding.p10,
        ),
        // TODO : Check this image.
        leading: Image.asset(AssetsManager.droneImage),
        title: Text(StringManager.ordersHistoryOrder.tr + " ${order.id}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${order.totalPrice}' +
                    StringManager.orderDetailsSyrianPounds.tr,
                style: StyleManager.body02_Semibold()),
            Text(order.date),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            StatusLabel(statusId: order.statusId),
            PopupMenuButton<String>(
              onSelected: (value) =>
                  controller.handleMenuSelection(value, index, context),
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
        onTap: () => controller.onTap(order.id, order.statusId),
      ),
    );
  }
}
