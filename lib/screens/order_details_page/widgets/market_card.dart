import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/flex_label.dart';

class MarketCard extends GetView<OrderDetailsPageController> {
  const MarketCard({super.key, required this.marketIndex});
  final marketIndex;
  @override
  Widget build(BuildContext context) {
    final market = controller.order.value?.markets[marketIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(market?.name ?? 'N/A', style: StyleManager.body01_Semibold()),
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
        if (market != null)
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
                  FlexLabel(text: "${product.price}"),
                  FlexLabel(text: "${product.total}"),
                ],
              ),
            );
          }).toList(),
        if (market != null)
          if (marketIndex != controller.order.value!.markets.length - 1)
            const Divider(),
      ],
    );
  }
}
