import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/screens/category_page/widgets/categorys_products.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/wide_product_shimmer_card.dart';
import 'package:ngpiteapp/screens/custom_widgets/wide_product_shimmer_list.dart';
import 'package:ngpiteapp/screens/favorite_page/favorite_page_logic.dart';
import 'package:ngpiteapp/screens/favorite_page/widgets/favorite_product_card.dart';

class FavoriteProductsList extends GetView<FavoritePageController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + AppPadding.p80,
      ),
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => controller.productsPagingController.refresh(),
        ),
        color: ColorManager.firstColor,
        child: PagedGridView<int, ProductsCardEntite>(
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2,
            mainAxisSpacing: AppPadding.p10,
            crossAxisSpacing: AppPadding.p10,
          ),
          pagingController: controller.productsPagingController,
          builderDelegate: PagedChildBuilderDelegate<ProductsCardEntite>(
            itemBuilder: (context, product, index) => FavoriteProductCard(
              index: index,
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
    );
  }
}
