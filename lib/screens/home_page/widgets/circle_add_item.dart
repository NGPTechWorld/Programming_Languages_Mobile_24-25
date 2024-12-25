import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';

class CircleAddItem extends GetView<HomePageController> {
  final int index;
  const CircleAddItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s24,
      child: Center(
        child: InkWell(
          onTap: () => controller.addToCart(context, index),
          child: CircleAvatar(
            radius: AppSize.s30,
            backgroundColor: ColorManager.secoundColor,
            child: Icon(
              Icons.add,
              color: ColorManager.whiteColor,
              size: AppSize.s16,
            ),
          ),
        ),
      ),
    );
  }
}
