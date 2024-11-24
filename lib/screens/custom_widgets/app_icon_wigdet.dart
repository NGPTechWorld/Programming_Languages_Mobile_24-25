import 'package:flutter/material.dart';
import '../../app/config/assets_manager.dart';
import '../../app/config/color_manager.dart';
import '../../app/config/values_manager.dart';

class AppIconWigdet extends StatelessWidget {
  const AppIconWigdet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.primary2Color,
            radius: AppSize.s100,
            child: Image.asset(
              AssetsManager.appIcon,
              width: AppSizeScreen.screenWidth * 0.4,
              height: AppSizeScreen.screenHeight * 0.2,
            ),
          )
        ],
      ),
    );
  }
}
