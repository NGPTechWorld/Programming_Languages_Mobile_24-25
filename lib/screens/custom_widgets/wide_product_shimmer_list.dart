import 'package:flutter/material.dart';
import 'package:ngpiteapp/screens/custom_widgets/wide_product_shimmer_card.dart';

class WideProductShimmerList extends StatelessWidget {
  const WideProductShimmerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.none,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
          6,
          (index) => WideProductShimmerCard(
                size: index == 5 ? 30 : 0,
              )),
    );
  }
}
