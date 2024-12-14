import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoadingPlaceHolder extends StatelessWidget {
  const ImageLoadingPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.greyColor300,
      highlightColor: ColorManager.greyColor100,
      child: Image.asset(
        AssetsManager.profileDefaultImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
