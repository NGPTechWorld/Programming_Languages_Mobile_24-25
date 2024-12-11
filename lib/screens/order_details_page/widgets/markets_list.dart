import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/market_card.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class MarketsList extends GetView<OrderDetailsPageController> {
  const MarketsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final order = controller.order.value;
    if (order != null)
      return Column(
          children: List.generate(
        order.markets.length,
        (marketIndex) => MarketCard(marketIndex: marketIndex),
      ));
    return Container();
  }
}
