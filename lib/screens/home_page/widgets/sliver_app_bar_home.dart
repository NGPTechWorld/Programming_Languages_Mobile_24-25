import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';
import 'package:ngpiteapp/screens/home_page/widgets/search_bar.dart';
import 'package:get/get.dart';

class SliverAppBarHome extends GetView<HomePageController> {
  const SliverAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: AppSizeScreen.screenHeight / 4.5,
      backgroundColor: ColorManager.firstColor,
      stretch: true,
      title: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringManager.homeTitle.tr,
              style:
                  StyleManager.h2_Semibold(color: ColorManager.primary1Color),
            ),
            InkWell(
              onTap: () {
                controller.goToCart();
              },
              child: SvgPicture.asset(
                AssetsManager.shoppingCardSvg,
                // ignore: deprecated_member_use
                color: ColorManager.whiteColor,
              ),
            )
          ],
        ),
      ),
      flexibleSpace: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: AppSizeScreen.screenHeight * 0.1,
              left: AppPadding.p20,
              right: AppPadding.p20),
          child: Column(
            children: [SearchTextBar()],
          ),
        ),
      ),
    );
  }
}
