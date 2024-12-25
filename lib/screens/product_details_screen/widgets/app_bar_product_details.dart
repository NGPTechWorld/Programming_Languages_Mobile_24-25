import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page_logic.dart';

class AppBarProductDetails extends GetView<ProductDetailsPageController> {
  const AppBarProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      expandedHeight: AppSizeScreen.screenHeight / 5,
      backgroundColor: ColorManager.whiteColor,
      stretch: true,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          child: Center(
            child: CircleAvatar(
              radius: AppSize.s30,
              backgroundColor: ColorManager.whiteColor,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: ColorManager.blackColor,
                size: AppSize.s16,
              ),
            ),
          ),
        ),
      ),
      flexibleSpace: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  controller.product!.name,
                  style: StyleManager.h1_Bold(color: ColorManager.blackColor),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  controller.product!.category,
                  style:
                      StyleManager.h3_Regular(color: ColorManager.blackColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
