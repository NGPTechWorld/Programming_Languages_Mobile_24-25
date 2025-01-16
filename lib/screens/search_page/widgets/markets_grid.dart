import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/widgets/categorys_products.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';
import 'package:ngpiteapp/screens/home_page/widgets/products_shimmer_grid.dart';
import 'package:ngpiteapp/screens/home_page/widgets/shimmer_product_card_home.dart';
import 'package:ngpiteapp/screens/search_page/search_page_logic.dart';
import 'package:ngpiteapp/screens/search_page/widgets/marke_card_item.dart';

class MarketsGrid extends GetView<SearchPageController> {
  const MarketsGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + AppPadding.p80,
        top: AppPadding.p10,
        left: AppPadding.p10,
        right: AppPadding.p10,
      ),
      child: PagedGridView(
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2,
          mainAxisSpacing: AppPadding.p10,
          crossAxisSpacing: AppPadding.p10,
        ),
        pagingController: controller.marketsPagingController,
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
          itemBuilder: (context, market, index) => MarkeCardItemModle(
            market: market,
          ),
          firstPageProgressIndicatorBuilder: (context) =>
              ProductsShimmerGrid(count: 6),
          newPageProgressIndicatorBuilder: (context) =>
              ShimmerProductCardHome(),
          newPageErrorIndicatorBuilder: (context) => TryAgainButton(
            onPressed: () {
              controller.productsPagingController.retryLastFailedRequest();
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
      // );
      // }
    );
  }
}
