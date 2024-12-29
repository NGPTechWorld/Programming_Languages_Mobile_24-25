import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/product_category_card.dart';

class SliverAppBarCategory extends StatelessWidget {
  const SliverAppBarCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: AppSizeScreen.screenHeight / 4,
      backgroundColor: ColorManager.firstColor,
      stretch: true,
      title: ProductCategoryCard(),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Padding(
          padding: EdgeInsets.only(
            top: AppSizeScreen.screenHeight * 0.05,
            left: AppPadding.p20,
            right: AppPadding.p20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                    StringManager.categoryPageShop.tr,
                style: StyleManager.h1_Regular(
                    color: ColorManager.primary1Color, fontsize: AppSize.s50),
              ),
              Text(
                    StringManager.categoryPageByCategory.tr,
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


