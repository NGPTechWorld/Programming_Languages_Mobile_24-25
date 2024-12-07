import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/flex_label.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class MarketCard extends GetView<OrderDetailsPageController> {
  const MarketCard({super.key, required this.marketIndex});
  final marketIndex;
  @override
  Widget build(BuildContext context) {
    final market = controller.order.markets[marketIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(market.name, style: StyleManager.body01_Semibold()),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlexLabel(
              text: StringManager.orderDetailsProductName.tr,
              flex: 2,
              isTitle: true,
              isFirst: true,
            ),
            FlexLabel(
              text: StringManager.orderDetailsUnitCount.tr,
              isTitle: true,
            ),
            FlexLabel(
                text: StringManager.orderDetailsUnitPrice.tr, isTitle: true),
            FlexLabel(
              text: StringManager.orderDetailsTotalPrice.tr,
              isTitle: true,
            ),
          ],
        ),
        ...market.products.map((product) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlexLabel(
                  text: product.name,
                  flex: 2,
                  isFirst: true,
                ),
                FlexLabel(text: "${product.count}"),
                FlexLabel(text: " ${product.unitPrice}"),
                FlexLabel(text: "${product.totalPrice}"),
              ],
            ),
          );
        }).toList(),
        if(marketIndex!=controller.order.markets.length-1)
        const Divider(),
      ],
    );
  }
}
