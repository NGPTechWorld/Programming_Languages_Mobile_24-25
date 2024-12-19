import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';
import 'package:ngpiteapp/screens/category_page/widgets/categorys_products.dart';
import 'package:ngpiteapp/screens/category_page/widgets/categorys_tab_bar.dart';
import 'package:ngpiteapp/screens/category_page/widgets/sliver_app_bar_category.dart';
import '/app/config/color_manager.dart';

class CategoryPage extends GetView<CategoryPageController> {
  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
  
    controller.getCategories(context);
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
