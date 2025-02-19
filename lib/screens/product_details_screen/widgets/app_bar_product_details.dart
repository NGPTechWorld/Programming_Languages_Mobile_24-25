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
              radius: AppSize.s18,
              backgroundColor: ColorManager.primary1Color,
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
        child: Container(
          decoration: BoxDecoration(
              color: ColorManager.firstLightColor.withAlpha(100),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          padding: const EdgeInsets.only(
              top: AppPadding.p70,
              left: AppPadding.p20,
              right: AppPadding.p20,
              bottom: AppPadding.p10),
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
