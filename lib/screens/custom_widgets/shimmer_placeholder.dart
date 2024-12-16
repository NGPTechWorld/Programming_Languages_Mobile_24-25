import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double height, width;
  const ShimmerPlaceholder(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.all(AppPadding.p10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s18),
          color: Colors.grey[300],
        ),
        height: height,
        width: width,
      ),
    );
  }
}
