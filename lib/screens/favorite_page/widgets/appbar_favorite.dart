import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page_logic.dart';
import 'package:ngpiteapp/screens/favorite_page/favorite_page_logic.dart';

class AppbarFavorite extends StatelessWidget {
  const AppbarFavorite({super.key});

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
            left: AppPadding.p20,
            right: AppPadding.p20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // TODO : Fix this "My Favorites".
            children: [
              Text(
                "My",
                style: StyleManager.h1_Regular(
                    color: ColorManager.primary1Color, fontsize: AppSize.s50),
              ),
              Text(
                "Favorites",
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

class ProductCategoryCard extends GetView<FavoritePageController> {
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
          InkWell(
            onTap: () => controller.goToCart(),
            child: SvgPicture.asset(
              AssetsManager.shoppingCardSvg,
              // ignore: deprecated_member_use
              color: ColorManager.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
