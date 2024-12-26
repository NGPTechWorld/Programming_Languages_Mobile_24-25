import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';

class MarketShimmerList extends StatelessWidget {
  final int count;

  const MarketShimmerList({super.key, required this.count});
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      count,
      (index) => ShimmerPlaceholder(
        height: AppSizeWidget.cardSize,
        width: AppSizeScreen.screenWidth * 0.5,
      ),
    ));
  }
}
