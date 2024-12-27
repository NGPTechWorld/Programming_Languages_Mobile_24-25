import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';

class WideProductShimmerCard extends StatelessWidget {
  final double size;
  const WideProductShimmerCard({super.key, this.size = 30.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10),
        Card(
          color: ColorManager.primary1Color,
          elevation: 0,
          child: Row(
            children: [
              ShimmerPlaceholder(
                height: AppSize.s200,
                width: AppSizeScreen.screenWidth / 3,
                padding: 0,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerPlaceholder(
                          height: AppSize.s20,
                          width: AppSizeScreen.screenWidth * 0.6),
                      ShimmerPlaceholder(
                          height: AppSize.s20,
                          width: AppSizeScreen.screenWidth * 0.4),
                      ShimmerPlaceholder(
                          height: AppSize.s20,
                          width: AppSizeScreen.screenWidth * 0.3),
                      SizedBox(height: AppSize.s30),
                      ShimmerPlaceholder(
                          height: AppSize.s20,
                          width: AppSizeScreen.screenWidth * 0.4),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: size),
      ],
    );
  }
}
