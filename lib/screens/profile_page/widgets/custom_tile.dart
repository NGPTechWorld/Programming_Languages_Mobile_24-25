import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
  });
  final Widget? leading;
  final Text? title;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: AppPadding.p4),
      child: Material(
        elevation: AppSize.s6, // Set the elevation
        shadowColor: ColorManager.blackColor, // Optional: Set shadow color
        borderRadius: BorderRadius.circular(AppSize.s14), // Optional: Add rounded corners
        child: ListTile(
          onTap: onTap,
          title: title,
          titleAlignment: ListTileTitleAlignment.center,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s14)),
          leading: leading,
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: AppSize.s16,
          ),
          minTileHeight: AppSizeScreen.screenHeight * 0.08,
          tileColor: ColorManager.whiteColor,
        ),
      ),
    );
  }
}
