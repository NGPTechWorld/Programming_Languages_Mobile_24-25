import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/data/entities/markets_card.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';

class MarketsList extends GetView<HomePageController> {
  const MarketsList({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initalMarkets();
    controller.getMarkets(context);
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
            Obx(
              () => SizedBox(
                  height: AppSizeScreen.screenHeight / 6,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.loadingStateMarkets ==
                            LoadingState.doneWithData
                        ? controller.markets.length
                        : 2,
                    itemBuilder: (context, index) {
                      return controller.loadingStateMarkets ==
                              LoadingState.doneWithData
                          ? MarkeCardItem(
                              market: controller.markets[index],
                            )
                          : ShimmerPlaceholder(
                              height: AppSizeWidget.cardSize,
                              width: AppSizeScreen.screenWidth * 0.7,
                            );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class MarkeCardItem extends StatelessWidget {
  final MarketsCard market;
  const MarkeCardItem({
    super.key,
    required this.market,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p4),
        child: Container(
          height: AppSizeWidget.cardSize,
          //width: AppSizeScreen.screenWidth * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16),
            color: ColorManager.primary2Color,
          ),
          child: Row(
            children: [
              Image.asset(AssetsManager.nullImage),
              Container(
                constraints:
                    BoxConstraints(maxWidth: AppSizeScreen.screenWidth * 0.5),
                padding: const EdgeInsets.all(AppPadding.p10),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(market.name,
                      style: StyleManager.h3_Medium(
                          color: ColorManager.primary6Color)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
