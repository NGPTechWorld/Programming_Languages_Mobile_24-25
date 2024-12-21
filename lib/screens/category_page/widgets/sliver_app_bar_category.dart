import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class SliverAppBarCategory extends StatelessWidget {
  const SliverAppBarCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: ColorManager.firstColor,
        height: AppSizeScreen.screenHeight * 0.15,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p14, vertical: AppPadding.p10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManager.categoryPageShop.tr,
                    style: StyleManager.h1_Regular(
                        color: ColorManager.primary1Color,
                        fontsize: AppSize.s50),
                  ),
                  Text(
                    StringManager.categoryPageByCategory.tr,
                    style: StyleManager.h1_Bold(
                        color: ColorManager.primary1Color,
                        fontsize: AppSize.s50),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCategoryCard extends StatelessWidget {
  const ProductCategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Icon(
            Icons.shopping_cart_outlined,
            color: ColorManager.whiteColor,
          )
        ],
      ),
    );
  }
}
