import '../../app/config/color_manager.dart';
import '../../app/config/style_manager.dart';
import '../../app/config/values_manager.dart';
import 'package:flutter/material.dart';

class BottouCustom extends StatelessWidget {
  final Function function;
  final Color background;
  final Color textColor;
  final String text;
  final width;
  final borderRadius;
  const BottouCustom(
      {super.key,
      required this.function,
      required this.text,
      this.background = ColorManager.secoundColor,
      this.textColor = ColorManager.blackColor,
      this.width,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => function(),
        child: Container(
          height: AppSizeScreen.screenHeight * 0.07,
          width: width == null ? AppSizeScreen.screenWidth / 2 : width,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(borderRadius == null ? 40 : borderRadius),
            color: background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                text,
                style: StyleManager.button1(color: textColor),
              ),
            )),
          ),
        ));
  }
}
