import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page_logic.dart';

class Counter extends GetView<CartPageController> {
  const Counter({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => controller.subOne(index),
          child: CircleAvatar(
            radius: AppSize.s16,
            backgroundColor: ColorManager.primary3Color.withAlpha(100),
            child: Icon(
              Icons.remove,
              color: ColorManager.blackColor,
              size: AppSize.s16,
            ),
          ),
        ),
        SizedBox(
          width: AppSizeScreen.screenWidth * 0.08,
          child: Center(
            child: Text(
              controller.products[index].count.toString(),
              style: StyleManager.body01_Regular(),
            ),
          ),
        ),
        InkWell(
          onTap: () => controller.addOne(index),
          child: CircleAvatar(
            radius: AppSize.s16,
            backgroundColor: ColorManager.primary3Color.withAlpha(100),
            child: Icon(
              Icons.add,
              color: ColorManager.blackColor,
              size: AppSize.s16,
            ),
          ),
        ),
      ],
    );
  }
}
