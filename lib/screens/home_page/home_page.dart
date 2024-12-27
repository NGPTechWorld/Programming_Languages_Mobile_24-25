import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/widgets/categorys_products.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';
import 'package:ngpiteapp/screens/home_page/widgets/product_item.dart';
import 'package:ngpiteapp/screens/home_page/widgets/products_shimmer_grid.dart';
import 'package:ngpiteapp/screens/home_page/widgets/shimmer_product_card_home.dart';
import 'package:ngpiteapp/screens/home_page/widgets/sliver_app_bar_home.dart';
import 'package:ngpiteapp/screens/home_page/widgets/markets_list.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + AppPadding.p80,
            top: AppPadding.p10,
            left: AppPadding.p10,
            right: AppPadding.p10,
          ),
          child: RefreshIndicator(
            onRefresh: () => Future.sync(() {
              controller.productsPagingController.refresh();
            }),
            color: ColorManager.firstColor,
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
                firstPageProgressIndicatorBuilder: (context) =>
                    ProductsShimmerGrid(count: 6),
                newPageProgressIndicatorBuilder: (context) =>
                    ShimmerProductCardHome(),
                newPageErrorIndicatorBuilder: (context) => TryAgainButton(
                  onPressed: () {
                    controller.productsPagingController
                        .retryLastFailedRequest();
                  },
                ),
                firstPageErrorIndicatorBuilder: (context) => TryAgainButton(
                  onPressed: () {
                    controller.productsPagingController.refresh();
                  },
                ),
                noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
              ),
            ),
          ),
          // );
          // }
        ),
      ),
    );
  }
}
