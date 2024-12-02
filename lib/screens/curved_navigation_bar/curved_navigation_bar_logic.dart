import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/favorite_main_screen/favorite_main_screen.dart';
import 'package:ngpiteapp/screens/home_main_screen/home_main_screen.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page.dart';

class CurvedNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CurvedNavigationBarController());
  }
}

class CurvedNavigationBarController extends GetxController {
  final indexPage = 0.obs;
  List<Widget> pages = [
    HomeMainScreen(),
    HomeMainScreen(),
    const FavoriteMainScreen(),
    ProfilePage(),
  ];
}
