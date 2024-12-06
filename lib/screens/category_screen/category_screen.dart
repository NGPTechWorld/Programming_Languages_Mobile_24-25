import 'package:flutter/material.dart';
import 'package:ngpiteapp/screens/category_screen/widgets/categorys_products.dart';
import 'package:ngpiteapp/screens/category_screen/widgets/categorys_tab_bar.dart';
import 'package:ngpiteapp/screens/category_screen/widgets/sliver_app_bar_category.dart';
import '/app/config/color_manager.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBarCategory(),
          CategorysTabBar(),
          CategorysProducts(),
        ],
      ),
    );
  }
}
