import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/favorite_page/favorite_page_logic.dart';
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
              errorBuilder: (context, error, stackTrace) {
                return ShimmerPlaceholder(
                    height: AppSizeScreen.screenHeight / 5,
                    width: AppSizeScreen.screenWidth / 2);
              },
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return ShimmerPlaceholder(
                    height: AppSizeScreen.screenHeight / 5,
                    width: AppSizeScreen.screenWidth / 2);
              },
              fit: BoxFit.contain,
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await controller.toggleFavorite(context);
            final favController = Get.find<FavoritePageController>();
            favController.productsPagingController.refresh();
          },
          borderRadius: BorderRadius.circular(AppSize.s20),
          child: Container(
            width: AppSize.s50,
            height: AppSize.s50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: ColorManager.primary1Color),
            child: Obx(
              () => Icon(
                Icons.favorite,
                color: controller.isFavorite.value
                    ? ColorManager.redColor
                    : ColorManager.primary3Color,
              ),
            ),
          ),
        )
      ],
    );
  }
}
