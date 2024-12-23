import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/widgets/category_product_card.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/error_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/pagination_progress_indicator.dart';
import 'package:ngpiteapp/screens/favorite_page/favorite_page_logic.dart';

class FavoriteProducts extends GetView<FavoritePageController> {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    controller.inital(context);
    return SliverToBoxAdapter(
        child: Obx(() => controller.isLoadingFirst.value
            ? PageCircularIndicator(
                hasHeader: true,
              )
            : SizedBox(
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
                        height: 200,
                        child: CategoryProductCard(
                          index: index,
                        ),
                      ),
                      newPageErrorIndicatorBuilder: (context) =>
                          Text("TRY AGAIN"),
                      firstPageProgressIndicatorBuilder: (context) =>
                          PageCircularIndicator(
                        hasHeader: true,
                      ),
                      newPageProgressIndicatorBuilder: (context) =>
                          PaginationProgressIndicator(),
                      firstPageErrorIndicatorBuilder: (context) =>
                          ErrorIndicator(
                        error: controller.productsPagingController.error,
                        onTryAgain: () =>
                            controller.productsPagingController.refresh(),
                      ),
                      noItemsFoundIndicatorBuilder: (context) =>
                          EmptyListIndicator(),
                    ),
                  ),
                ),
              )));
  }
}
