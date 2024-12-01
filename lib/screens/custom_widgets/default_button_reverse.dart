import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class DefaultButtonInv extends StatelessWidget {
  const DefaultButtonInv(
      {super.key,
      required this.text,
      required this.press,
      this.loading,
      required this.style,
      this.minWidth = double.infinity, this.height = AppSize.s56, this.borderRadius = AppSize.s20});
  final double minWidth;
  final double borderRadius;
  final double height;
  final String text;
  final TextStyle style;
  final VoidCallback press;
  final bool? loading;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: loading == true ? () {} : press,
      minWidth: minWidth,
      height: height,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      color:  ColorManager.whiteColor,
      child: loading == true
          ? const CircularProgressIndicator(
              color: ColorManager.firstColor,
            )
          : Text(
              text,
              style: style,
            ),
    );
  }
}
