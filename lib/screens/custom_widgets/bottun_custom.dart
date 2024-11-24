import '../../app/config/color_manager.dart';
import '../../app/config/style_manager.dart';
import '../../app/config/values_manager.dart';
import 'package:flutter/material.dart';

class BottouCustom extends StatelessWidget {
  final Function function;
  final Color background;
  final Color textColor;
  final String text;
  const BottouCustom(
      {super.key,
      required this.function,
      required this.text,
      this.background = ColorManager.secoundColor,
      this.textColor = ColorManager.blackColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => function(),
        child: Container(
          height: AppSizeScreen.screenHeight * 0.07,
          width: AppSizeScreen.screenWidth / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
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
