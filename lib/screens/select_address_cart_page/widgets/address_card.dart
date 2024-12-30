import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/select_address_cart_page_logic.dart';

class address_card extends GetView<SelectAddressCartPageController> {
  const address_card({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final address = controller.addresses[index];
    return Obx(
      ()=> Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24, vertical: AppPadding.p10),
        child: InkWell(
          onTap: () {
            controller.currentIndex.value = index;
            controller.getCost();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
              border: Border.all(
                  width: AppSize.s2,
                  color: controller.currentIndex.value == index
                      ? ColorManager.firstDarkColor
                      : ColorManager.primary2Color),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address.name,
                        style: StyleManager.body02_Regular(),
                      ),
                      Text(
                        address.address,
                        style: StyleManager.body02_Semibold(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.currentIndex == index
                          ? CircleAvatar(
                              radius: AppSize.s12,
                              backgroundColor: ColorManager.firstDarkColor,
                              child: Icon(
                                Icons.check,
                                color: ColorManager.whiteColor,
                                size: AppSize.s16,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
