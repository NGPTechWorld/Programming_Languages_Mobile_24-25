import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page_logic.dart';

class ImagAndFavorite extends GetView<ProductDetailsPageController> {
  const ImagAndFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: AppSizeScreen.screenHeight / 3.5,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Image.network(
              controller.product!.image,
              width: AppSizeScreen.screenWidth / 2,
              height: AppSizeScreen.screenHeight / 5,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p20, horizontal: AppPadding.p8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s20),
              color: ColorManager.primary1Color),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.toggleFavorite(context);
                },
                child: Obx(
                  () => Icon(
                    Icons.favorite,
                    color: controller.isFavorite.value
                        ? ColorManager.firstColor
                        : ColorManager.primary3Color,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
