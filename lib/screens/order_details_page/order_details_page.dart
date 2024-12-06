import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/markets_list.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/order_info.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/total_price.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class OrderDetailsPage extends GetView<OrderDetailsPageController> {
  const OrderDetailsPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    controller.requestOrderData(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(StringManager.orderDetailsHeader.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            OrderInfo(),
            MarketsList(),
            TotalPrice(),
          ],
        ),
      ),
    );
  }
}

class MarketCard extends StatelessWidget {
  const MarketCard({
    super.key,
    required this.market,
  });

  final Market market;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          market.name,
          style: StyleManager.body01_Semibold()
        ),
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
                FlexLabel(
                    text: " ${product.unitPrice} " +
                        StringManager.orderDetailsSyrianPounds.tr),
                FlexLabel(
                    text: "${product.totalPrice} " +
                        StringManager.orderDetailsSyrianPounds.tr),
              ],
            ),
          );
        }).toList(),
        const Divider(),
      ],
    );
  }
}

class FlexLabel extends StatelessWidget {
  final int flex;
  final bool isTitle, isFirst;
  final String text;
  const FlexLabel(
      {super.key,
      required this.text,
      this.flex = 1,
      this.isTitle = false,
      this.isFirst = false});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex, // Defines the proportional space taken by the product name
      child: Container(
        margin: EdgeInsets.only(left: isFirst ? 0 : AppMargin.m30),
        width: isFirst
            ? AppSizeScreen.screenWidth / 3
            : AppSizeScreen.screenWidth *
                0.23, // Restrict width to one-third of the screen
        child: Text(
          text,
          textAlign: isFirst ? TextAlign.start : TextAlign.center,
          softWrap: true, // Enable text wrapping
          style: isTitle
              ? StyleManager.body01_Medium()
              : StyleManager.body01_Regular(
                  fontsize: AppSize.s14), // Adjust font size as needed
        ),
      ),
    );
  }
}
