import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';
import 'package:ngpiteapp/screens/category_page/widgets/category_product_card.dart';
import 'package:ngpiteapp/screens/category_page/widgets/sliver_app_bar_category.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/error_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';

class CategorysProducts extends GetView<CategoryPageController> {
  const CategorysProducts({super.key});

  @override
  Widget build(BuildContext context) {
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

class PaginationProgressIndicator extends StatelessWidget {
  const PaginationProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10),
        Center(
          child: CircularProgressIndicator(
            color: ColorManager.firstColor,
          ),
        ),
        SizedBox(height: AppSize.s30),
      ],
    );
  }
}
