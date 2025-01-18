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
            Expanded(
                flex: 4,
                child: Text(
                  StringManager.orderDetailsProductName.tr,
                  style: StyleManager.body02_Medium(),
                )),
            Expanded(
                flex: 1,
                child: Text(
                  StringManager.orderDetailsUnitCount.tr,
                  style: StyleManager.body02_Medium(),
                )),
            Expanded(
                flex: 1,
                child: Text(
                  StringManager.orderDetailsUnitPrice.tr,
                  style: StyleManager.body02_Medium(),
                )),
            Expanded(
                flex: 1,
                child: Text(
                  StringManager.orderDetailsTotalPrice.tr,
                  style: StyleManager.body02_Medium(),
                )),
          ],
        ),
        if (market != null)
          ...market.products.map((product) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    product.image,
                    fit: BoxFit.contain,
                    width: 50,
                    height: 50,
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        product.name,
                        style: StyleManager.h4_Medium(),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "${product.count}",
                        style: StyleManager.body02_Medium(),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "${product.price}",
                        style: StyleManager.body02_Medium(),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "${product.total}",
                        style: StyleManager.body02_Medium(),
                      )),
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
