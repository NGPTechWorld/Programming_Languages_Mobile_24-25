import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/markets_list.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/order_info.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/total_price.dart';

class OrderDetailsPage extends GetView<OrderDetailsPageController> {
  const OrderDetailsPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    controller.requestOrderData(id);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.only(left : AppPadding.p16 , right: AppPadding.p16 , top: AppPadding.p10 ,bottom:  AppPadding.p6),
          child: SingleChildScrollView(
            child: Column(
              
              children: [
                OrderInfo(),
                MarketsList(),
                TotalPrice(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringManager.orderDetailsHeader.tr,
        style: StyleManager.h1_Medium(color: ColorManager.whiteColor),
      ),
      backgroundColor: ColorManager.firstColor,
      leading: BackButton(
        color: ColorManager.whiteColor,
      ),
      centerTitle: true,
    );
  }
}
