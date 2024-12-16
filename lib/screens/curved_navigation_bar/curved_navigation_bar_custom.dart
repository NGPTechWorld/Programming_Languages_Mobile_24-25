import 'package:flutter/material.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/bottom_navication_bar_model.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';
import '/app/config/color_manager.dart';
import 'package:get/get.dart';

class CurvedNavigationBarCustom extends GetView<CurvedNavigationBarController> {
  const CurvedNavigationBarCustom({super.key, this.startIndex = 0});
  final startIndex;
  @override
  Widget build(BuildContext context) {
    Get.put(ProfilePageController());
    Get.put(HomePageController());
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
                      items: const [
                        Icon(
                          Icons.home,
                          color: ColorManager.whiteColor,
                        ),
                        Icon(
                          Icons.category,
                          color: ColorManager.whiteColor,
                        ),
                        Icon(
                          Icons.favorite,
                          color: ColorManager.whiteColor,
                        ),
                        Icon(
                          Icons.person,
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
