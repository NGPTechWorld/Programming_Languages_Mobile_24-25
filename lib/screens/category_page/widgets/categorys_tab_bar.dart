import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';
import 'package:ngpiteapp/screens/category_page/widgets/categories_shimmer_list.dart';
import 'package:ngpiteapp/screens/category_page/widgets/category_card.dart';

class CategorysTabBar extends GetView<CategoryPageController> {
  const CategorysTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s60, // Match the minExtent and maxExtent
      color: Colors.white, // Optional: Set a background color
      child: Padding(
        padding: EdgeInsets.only(top: AppPadding.p10 , bottom: AppPadding.p10),
        child: Obx(
          () => controller.isLoadingCategories.value
              ? CategoriesShimmerList()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(index: index);
                  },
                ),
        ),
      ),
    );
  }
}
