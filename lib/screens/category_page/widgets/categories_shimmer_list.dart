import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';

class CategoriesShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            8,
            (index) => ShimmerPlaceholder(
                  height: AppSize.s26,
                  width: AppSize.s80,
                  padding: AppPadding.p5,
                )),
      ),
    );
  }
}
