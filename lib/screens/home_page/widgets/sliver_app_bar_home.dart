import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/home_page/widgets/search_bar.dart';
import 'package:get/get.dart';

class SliverAppBarHome extends StatelessWidget {
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
            Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.whiteColor,
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
