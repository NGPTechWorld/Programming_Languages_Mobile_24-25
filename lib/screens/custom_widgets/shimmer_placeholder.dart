import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double height, width, padding;
  const ShimmerPlaceholder(
      {super.key, required this.height, required this.width, this.padding = 10.0});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.all(padding),
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
