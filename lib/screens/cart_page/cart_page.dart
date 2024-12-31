import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page_logic.dart';
import 'package:ngpiteapp/screens/cart_page/widgets/bottom_cart_page.dart';
import 'package:ngpiteapp/screens/cart_page/widgets/items_cart.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';

class CartPage extends GetView<CartPageController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCart();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringManager.cartPageMyCart.tr,
            style: StyleManager.h2_Bold(),
          ),
          backgroundColor: ColorManager.primary1Color,
        ),
        backgroundColor: ColorManager.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
            child:
                Obx(() => controller.loadingState.value == LoadingState.loading
                    ? PageCircularIndicator()
                    : (controller.products.length == 0
                        ? EmptyListIndicator()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              controller.products.length,
                              (index) => ItemCart(
                                index: index,
                              ),
                            ),
                          )
                    // TODO : Change this to Shimmer list.
                    )),
          ),
        ),
        bottomNavigationBar: BottomCartPage(),
      ),
    );
  }
}
