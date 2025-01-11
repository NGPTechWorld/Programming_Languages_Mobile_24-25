import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/entities/market_entitie.dart';
import 'package:ngpiteapp/data/entities/markets_card_entitie.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';

class MarkeCardItem extends GetView<HomePageController> {
  final int index;
  const MarkeCardItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // TODO : edit this to MarketEntitie when kareem gives an image back.
    MarketEntitie market = controller.marketsPagingController.itemList![index];
    return GestureDetector(
      onTap: () {
        controller.goToMarkect(index);
      },
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
               Container(
                height: 120,
                width: 120,
                child: market.image == null?
                  Image.asset(AssetsManager.nullImage):
                 Image.network(
                  market.image! ,
                  height: 150,
                  width: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return ShimmerPlaceholder(height: 150, width: 150);
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return ShimmerPlaceholder(height: 150, width: 150);
                  },
                ),
              ),
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
