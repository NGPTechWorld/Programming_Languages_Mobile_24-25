import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/bottun_custom.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/select_address_cart_page.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/select_address_cart_page_logic.dart';
import 'package:ngpiteapp/screens/show_addresses_page/widgets/address_card.dart';

class BottomSaPage extends GetView<SelectAddressCartPageController> {
  const BottomSaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.whiteColor,
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.primary2Color,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s30))),
        height: AppSizeScreen.screenHeight * 0.24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: ListTile(
                title: Text(
                  StringManager.deliveryprice.tr,
                  style: StyleManager.h4_Regular(),
                ),
                trailing: Obx(
                  () =>
                      controller.loadingCostState.value == LoadingState.loading
                          ? ShimmerPlaceholder(
                              height: AppSize.s20, width: AppSize.s100)
                          : Text(
                              "${controller.deleviryPrice.value} ${StringManager.orderDetailsSyrianPounds.tr}",
                              style: StyleManager.h4_Medium(),
                            ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: ListTile(
                title: Text(
                  StringManager.orderDetailsTotalPrice.tr,
                  style: StyleManager.h4_Regular(),
                ),
                trailing: Obx(
                  () =>
                      controller.loadingCostState.value == LoadingState.loading
                          ? ShimmerPlaceholder(
                              height: AppSize.s20, width: AppSize.s100)
                          : Text(
                              "${controller.totalCost + controller.deleviryPrice.value} ${StringManager.orderDetailsSyrianPounds.tr}",
                              style: StyleManager.h4_Medium(),
                            ),
                ),
              ),
            ),
            BottouCustom(
                function: () {
                  // Get.to(()=>SelectAddressCartPage(),
                  //     binding: SelectAddressCartPageBinding(totalCost: contro));
                  controller.createOrder();
                },
                text: "next",
                width: AppSizeScreen.screenWidth * 0.8,
                borderRadius: AppSize.s20,
                background: ColorManager.secoundDarkColor,
                textColor: ColorManager.whiteColor),
          ],
        ),
      ),
    );
  }
}
