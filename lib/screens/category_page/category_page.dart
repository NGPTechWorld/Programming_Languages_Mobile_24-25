import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';
import 'package:ngpiteapp/screens/category_page/widgets/categorys_products.dart';
import 'package:ngpiteapp/screens/category_page/widgets/categorys_tab_bar.dart';
import 'package:ngpiteapp/screens/category_page/widgets/sliver_app_bar_category.dart';
import '/app/config/color_manager.dart';

class CategoryPage extends GetView<CategoryPageController> {
  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBarCategory(),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: _SliverTabBarDelegate(
              child: CategorysTabBar(),
            ),
          ),
        ],
        body: CategorysProducts(),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverTabBarDelegate({required this.child});

  @override
  double get minExtent => AppSize.s60; // Minimum height of the tab bar.
  @override
  double get maxExtent => AppSize.s60; // Maximum height of the tab bar.

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: ColorManager.whiteColor, // Background color for the tab bar.
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // Only rebuild if the child changes.
  }
}
