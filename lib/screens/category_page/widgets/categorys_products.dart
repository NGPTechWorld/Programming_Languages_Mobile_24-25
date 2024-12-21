import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';
import 'package:ngpiteapp/screens/category_page/widgets/category_product_card.dart';
import 'package:ngpiteapp/screens/category_page/widgets/sliver_app_bar_category.dart';

class CategorysProducts extends GetView<CategoryPageController> {
  const CategorysProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Ensures PagedListView has proper constraints.
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => controller.productsPagingController.refresh(),
        ),
        child: PagedListView(
          pagingController: controller.productsPagingController,
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            itemBuilder: (context, product, index) => Container(
              height: 200,
              child: CategoryProductCard(
                index: index,
              ),
            ),
            firstPageErrorIndicatorBuilder: (context) => Container(
              height: 100,
              alignment: Alignment.center,
              child: const Text("ERROR"),
            ),
            noItemsFoundIndicatorBuilder: (context) => Container(
              height: 100,
              alignment: Alignment.center,
              child: const Text("NO ITEMS"),
            ),
          ),
        ),
      ),
    );
  }
}
