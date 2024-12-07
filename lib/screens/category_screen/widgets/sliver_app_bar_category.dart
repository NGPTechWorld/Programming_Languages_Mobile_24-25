import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class SliverAppBarCategory extends StatelessWidget {
  const SliverAppBarCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      expandedHeight: AppSizeScreen.screenHeight / 4,
      backgroundColor: ColorManager.firstColor,
      stretch: true,
      title: ProductCategoryCard(),
      flexibleSpace: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSizeScreen.screenHeight * 0.05,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shop",
                style: StyleManager.h1_Regular(
                    color: ColorManager.primary1Color, fontsize: AppSize.s50),
              ),
              Text(
                "By Category",
                style: StyleManager.h1_Bold(
                    color: ColorManager.primary1Color, fontsize: AppSize.s50),
              ),
            ],
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
