import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';
import 'package:ngpiteapp/screens/home_page/widgets/product_item.dart';
import 'package:ngpiteapp/screens/home_page/widgets/products_shimmer_grid.dart';
import 'package:ngpiteapp/screens/home_page/widgets/shimmer_card.dart';
import 'package:ngpiteapp/screens/home_page/widgets/sliver_app_bar_home.dart';
import 'package:ngpiteapp/screens/home_page/widgets/markets_list.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initalProducts();
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBarHome(),
          MarketsList(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: Text(
                StringManager.allProducts.tr,
                style: StyleManager.body01_Regular(fontsize: AppSize.s30),
              ),
            ),
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Obx(() {
            if (controller.isLoadingFirstProducts.value) {
              return ProductsShimmerGrid(); // Show shimmer during loading.
            }
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + AppPadding.p80,
              ),
              child: PagedGridView(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: AppPadding.p10,
                  crossAxisSpacing: AppPadding.p10,
                ),
                pagingController: controller.productsPagingController,
                builderDelegate: PagedChildBuilderDelegate<dynamic>(
                  itemBuilder: (context, product, index) => ProductItem(
                    index: index,
                  ),
                  newPageErrorIndicatorBuilder: (context) =>
                      const Text("TRY AGAIN"),
                  firstPageProgressIndicatorBuilder: (context) =>
                      ProductsShimmerGrid(),
                  newPageProgressIndicatorBuilder: (context) => ShimmerCard(),
                  firstPageErrorIndicatorBuilder: (context) =>
                      const Text("Error loading products"),
                  noItemsFoundIndicatorBuilder: (context) =>
                      const Text("No products found"),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
