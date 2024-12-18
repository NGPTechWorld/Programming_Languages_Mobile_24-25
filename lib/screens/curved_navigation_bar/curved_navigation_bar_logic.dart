import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';
import 'package:ngpiteapp/screens/favorite_screen/favorite_screen.dart';
import 'package:ngpiteapp/screens/home_page/home_page.dart';
import 'package:ngpiteapp/screens/category_page/category_page.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';

class CurvedNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ProfilePageController(),
    );
    Get.put(HomePageController());
    Get.put(CategoryPageController());
    Get.put(CurvedNavigationBarController());
  }
}

class CurvedNavigationBarController extends GetxController {
  final indexPage = 0.obs;
  List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    const FavoriteScreen(),
    ProfilePage(),
  ];
}
