import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/home_page/widgets/shimmer_product_card_home.dart';

class ProductsShimmerGrid extends StatelessWidget {
  final int count;

  const ProductsShimmerGrid({super.key, required this.count});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeScreen.screenHeight * 0.72,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: AppPadding.p10,
            crossAxisSpacing: AppPadding.p10,
          ),
          itemCount: count,
          itemBuilder: (context, index) => ShimmerProductCardHome()),
    );
  }
}
