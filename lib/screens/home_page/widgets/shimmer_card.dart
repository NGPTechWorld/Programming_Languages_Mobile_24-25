import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';

class ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s18),
          color: ColorManager.primary1Color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: AppSize.s120,
                    width: AppSize.s120,
                    child: ShimmerPlaceholder(
                        height: AppSize.s150, width: AppSize.s150),
                  ),
                ),
                ShimmerPlaceholder(height: AppSize.s20, width: AppSize.s150),
                ShimmerPlaceholder(height: AppSize.s20, width: AppSize.s100),
                // ShimmerPlaceholder(height: AppSize.s20, width: AppSize.s100),
              ]),
        ));
  }
}
