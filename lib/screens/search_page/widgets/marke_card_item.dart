import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/entities/market_entitie.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';

class MarkeCardItemModle extends StatelessWidget {
  final MarketEntitie market;
  const MarkeCardItemModle({
    super.key,
    required this.market,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p4),
        child: Container(
          height: AppSizeWidget.cardSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16),
            color: ColorManager.primary2Color,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppPadding.p8),
                height: 120,
                width: 120,
                child: market.image == null
                    ? Image.asset(AssetsManager.nullImage)
                    : Image.network(
                        market.image!,
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
