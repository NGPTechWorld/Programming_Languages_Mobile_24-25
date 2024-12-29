import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';
import 'package:ngpiteapp/screens/category_page/widgets/category_product_card.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/wide_product_shimmer_card.dart';
import 'package:ngpiteapp/screens/custom_widgets/wide_product_shimmer_list.dart';

class CategorysProducts extends GetView<CategoryPageController> {
  const CategorysProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoadingCategories.value
        ? WideProductShimmerList()
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
                    height: AppSize.s200,
                    child: CategoryProductCard(
                      index: index,
                    ),
                  ),
                  firstPageProgressIndicatorBuilder: (context) =>
                      WideProductShimmerList(),
                  newPageProgressIndicatorBuilder: (context) =>
                      WideProductShimmerCard(),
                  newPageErrorIndicatorBuilder: (context) => TryAgainButton(
                    onPressed: () {
                      controller.productsPagingController
                          .retryLastFailedRequest();
                    },
                  ),
                  firstPageErrorIndicatorBuilder: (context) =>
                      TryAgainButton(
                    onPressed: () {
                      controller.productsPagingController.refresh();
                    },
                  ),
                  noItemsFoundIndicatorBuilder: (context) =>
                      EmptyListIndicator(),
                ),
              ),
            ),
          ));
  }
}

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({
    super.key,
    required this.onPressed,
  });

  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          elevation: 0,
          child: Text(
            StringManager.paginationtryAgain.tr,
            style: TextStyle(color: ColorManager.firstColor),
          ),
        ),
        SizedBox(height: AppSize.s40)
      ],
    );
  }
}
