import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/markets_list.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/order_info.dart';
import 'package:ngpiteapp/screens/order_details_page/widgets/total_price.dart';

class OrderDetailsPage extends GetView<OrderDetailsPageController> {
  const OrderDetailsPage(
      {super.key, required this.orderId, required this.statusId});
  final int orderId;
  final int statusId;
  @override
  Widget build(BuildContext context) {
    controller.requestOrderData(orderId, statusId, context);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.p16,
              right: AppPadding.p16,
              top: AppPadding.p10,
              bottom: AppPadding.p6),
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children:
                    controller.loadingState.value != LoadingState.doneWithData
                        ? [PageCircularIndicator()]
                        : [
                            OrderInfo(),
                            MarketsList(),
                            TotalPrice(),
                          ],
              ),
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
