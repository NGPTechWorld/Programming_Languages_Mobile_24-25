import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/data/entities/markets_card.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/empty_list_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/error_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/pagination_progress_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';
import 'package:ngpiteapp/screens/home_page/widgets/marke_card_item.dart';
import 'package:ngpiteapp/screens/home_page/widgets/market_shimmer_list.dart';

class MarketsList extends GetView<HomePageController> {
  const MarketsList({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initalMarkets();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.storeText.tr,
              style: StyleManager.body01_Regular(fontsize: AppSize.s30),
            ),
            Obx(() => controller.isLoadingFirstMarkets.value
                ? PageCircularIndicator(
                    hasHeader: true,
                  )
                : SizedBox(
                    height: AppSizeScreen.screenHeight * 0.2,
                    child: PagedListView(
                      scrollDirection: Axis.horizontal,
                      pagingController: controller.marketsPagingController,
                      builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        itemBuilder: (context, market, index) => Container(
                            height: AppSizeWidget.cardSize,
                            child: MarkeCardItem(
                              index: index,
                            )),
                        newPageErrorIndicatorBuilder: (context) =>
                            Text("TRY AGAIN"),
                        firstPageProgressIndicatorBuilder: (context) =>
                            MarketShimmerList(count: 4),
                        newPageProgressIndicatorBuilder: (context) =>
                            MarketShimmerList(count: 4),
                        firstPageErrorIndicatorBuilder: (context) =>
                            ErrorIndicator(
                          error: controller.marketsPagingController.error,
                          onTryAgain: () =>
                              controller.marketsPagingController.refresh(),
                        ),
                        noItemsFoundIndicatorBuilder: (context) =>
                            EmptyListIndicator(),
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
