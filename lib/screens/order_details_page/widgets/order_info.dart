import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/status_helper.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/info_row.dart';

class OrderInfo extends GetView<OrderDetailsPageController> {
  const OrderInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final order = controller.order.value;
    return Column(
      children: [
        InfoRow(
            leading: StringManager.orderDetailsId.tr, content: ' ${controller.orderId}'),
        InfoRow(
            leading: StringManager.orderDetailsStatus.tr,
            content: StatusHelper.getStatusText(controller.statusId)),
        InfoRow(
            leading: StringManager.orderDetailsDate.tr, content: order?.date ?? 'N/A'),
        InfoRow(
            leading: StringManager.orderDetailsAddress.tr,
            content: order?.address  ?? 'N/A'),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
