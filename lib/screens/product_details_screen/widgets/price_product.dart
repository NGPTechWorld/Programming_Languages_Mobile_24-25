import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class PriceProduct extends StatelessWidget {
  const PriceProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p16),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Price",
                    style: StyleManager.h1_Bold(
                      fontsize: AppSize.s16,
                      color: ColorManager.firstColor,
                    )),
                TextSpan(
                    text: "/ quantity",
                    style: StyleManager.body01_Regular(
                      color: ColorManager.firstColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
