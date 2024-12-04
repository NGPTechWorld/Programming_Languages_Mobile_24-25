import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class SilverAppBarProductDetailsStyle3 extends StatefulWidget {
  const SilverAppBarProductDetailsStyle3({Key? key}) : super(key: key);

  @override
  State<SilverAppBarProductDetailsStyle3> createState() =>
      _SilverAppBarProductDetailsStyle3State();
}

class _SilverAppBarProductDetailsStyle3State
    extends State<SilverAppBarProductDetailsStyle3> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: AppSizeScreen.screenHeight / 4,
      backgroundColor: ColorManager.whiteColor,
      stretch: true,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
          child: Center(
            child: CircleAvatar(
              radius: AppSize.s30,
              backgroundColor: ColorManager.primary1Color,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: ColorManager.blackColor,
                size: AppSize.s10,
              ),
            ),
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "",
              style:
                  StyleManager.h2_Semibold(color: ColorManager.primary1Color),
            ),
          ],
        ),
      ),
      flexibleSpace: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "category",
                  style: StyleManager.h1_Regular(
                      color: ColorManager.blackColor, fontsize: AppSize.s50),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Product Name",
                  style: StyleManager.h1_Bold(
                      color: ColorManager.blackColor, fontsize: AppSize.s50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
