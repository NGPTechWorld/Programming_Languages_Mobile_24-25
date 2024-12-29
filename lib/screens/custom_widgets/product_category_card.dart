import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/favorite_page/favorite_page_logic.dart';

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
