import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/bottom_navication_bar_model.dart';
import '/app/config/color_manager.dart';
import 'package:get/get.dart';

class CurvedNavigationBarCustom extends GetView<CurvedNavigationBarController> {
  const CurvedNavigationBarCustom({super.key, this.startIndex = 0});
  final startIndex;
  @override
  Widget build(BuildContext context) {
    controller.indexPage.value = startIndex;
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              IndexedStack(
                index: controller.indexPage.value,
                children: controller.pages,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CurvedNavigationBarCustomModel(
                      color: ColorManager.firstDarkColor,
                      backgroundColor: ColorManager.transparentColor,
                      buttonBackgroundColor: ColorManager.secoundDarkColor,
                      onTap: (value) {
                        controller.indexPage.value = value;
                      },
                      index: controller.indexPage.value,
                      items: [
                        SvgPicture.asset(
                          AssetsManager.homeSvg,
                          // ignore: deprecated_member_use
                          color: ColorManager.whiteColor,
                        ),
                        SvgPicture.asset(
                          AssetsManager.categorySvg,
                          // ignore: deprecated_member_use
                          color: ColorManager.whiteColor,
                        ),
                        SvgPicture.asset(
                          AssetsManager.heartSvg,
                          // ignore: deprecated_member_use
                          color: ColorManager.whiteColor,
                        ),
                        SvgPicture.asset(
                          AssetsManager.profileSvg,
                          // ignore: deprecated_member_use
                          color: ColorManager.whiteColor,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
