import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/entities/market_entitie.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';

class MarketHeaderPage extends StatelessWidget {
  const MarketHeaderPage({
    super.key,
    required this.market,
  });

  final MarketEntitie market;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 200,
        decoration: BoxDecoration(
            color: ColorManager.secoundLightColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              child: Center(
                child: market.image == null? Image.asset(AssetsManager.nullImage)  :  Image.network(
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
            ),
            Expanded(
              child: Container(
                constraints:
                    BoxConstraints(maxWidth: AppSizeScreen.screenWidth * 0.5),
                padding: const EdgeInsets.all(AppPadding.p24),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(market.name,
                      style: StyleManager.h3_Medium(
                          color: ColorManager.primary6Color)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
