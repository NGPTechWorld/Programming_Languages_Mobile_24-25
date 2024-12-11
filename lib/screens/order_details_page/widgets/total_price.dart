import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';

class TotalPrice extends GetView<OrderDetailsPageController> {
  const TotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final order = controller.order.value;
    return Column(
      children: [
        const Divider(
          thickness: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringManager.orderDetailsTotalPrice.tr,
              style: StyleManager.body01_Semibold(),
            ),
            Text(
              "${order?.price ?? 'N/A'} " +
                  StringManager.orderDetailsSyrianPounds.tr,
              style: StyleManager.body01_Semibold(),
            ),
          ],
        ),
      ],
    );
  }
}
