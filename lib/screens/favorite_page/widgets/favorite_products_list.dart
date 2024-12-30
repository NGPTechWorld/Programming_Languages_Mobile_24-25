import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
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
        child: PagedListView(
          clipBehavior: Clip.none,
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
    );
  }
}
