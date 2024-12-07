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
    final Order order = controller.order;
    return Expanded(
      child: ListView.builder(
        itemCount: order.markets.length,
        itemBuilder: (context, marketIndex) {
          return MarketCard(marketIndex: marketIndex);
        },
      ),
    );
  }
}
