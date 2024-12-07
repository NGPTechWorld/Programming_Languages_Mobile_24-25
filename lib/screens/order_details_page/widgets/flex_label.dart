import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class FlexLabel extends StatelessWidget {
  final int flex;
  final bool isTitle, isFirst;
  final String text;
  const FlexLabel(
      {super.key,
      required this.text,
      this.flex = 1,
      this.isTitle = false,
      this.isFirst = false});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex, // Defines the proportional space taken by the product name
      child: Container(
        // margin: EdgeInsets.only(left: isFirst ? 0 : AppMargin.m30),
        width: isFirst
            ? AppSizeScreen.screenWidth / 3
            : AppSizeScreen.screenWidth *
                0.2, // Restrict width to one-third of the screen
        child: Text(
          text,
          textAlign: isFirst ? TextAlign.start : TextAlign.center,
          softWrap: true, // Enable text wrapping
          style: isTitle
              ? StyleManager.body01_Medium()
              : StyleManager.body01_Regular(
                  fontsize: AppSize.s14), // Adjust font size as needed
        ),
      ),
    );
  }
}
