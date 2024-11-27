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
    return Container(
      margin: EdgeInsets.symmetric(vertical:AppSizeScreen.screenHeight * 0.005 ),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: AppSize.s12, // Spread of the shadow
            offset: Offset(0, 0), // Position of the shadow
          ),
        ],
      ),
      child: ListTile(
        title: title,
        titleAlignment: ListTileTitleAlignment.center,

        leading: leading,
        onTap: onTap,
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: AppSize.s16,
        ),
        minTileHeight: AppSizeScreen.screenHeight * 0.08,
        tileColor: ColorManager.whiteColor,
      ),
    );
  }
}
