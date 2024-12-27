import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/widgets/categorys_products.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';

import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/wide_product_shimmer_card.dart';
import 'package:ngpiteapp/screens/custom_widgets/wide_product_shimmer_list.dart';
import 'package:ngpiteapp/screens/favorite_page/favorite_page_logic.dart';
import 'package:ngpiteapp/screens/favorite_page/widgets/favorite_product_card.dart';

class FavoriteProducts extends GetView<FavoritePageController> {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: AppSizeScreen.screenHeight * 0.72,
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => controller.productsPagingController.refresh(),
        ),
        color: ColorManager.firstColor,
        child: PagedListView(
          pagingController: controller.productsPagingController,
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            itemBuilder: (context, product, index) => Container(
              height: AppSize.s200,
              child: FavoriteProductCard(
                index: index,
              ),
            ),
            firstPageProgressIndicatorBuilder: (context) =>
                WideProductShimmerList(),
            newPageProgressIndicatorBuilder: (context) =>
                WideProductShimmerCard(),
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
      ),
    ));
  }
}
