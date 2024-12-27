import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/custom_widgets/wide_product_shimmer_card.dart';

class WideProductShimmerList extends StatelessWidget {
  const WideProductShimmerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          6,
          (index) => WideProductShimmerCard(
                size: index == 5 ? 30 : 0,
              )),
    );
  }
}
