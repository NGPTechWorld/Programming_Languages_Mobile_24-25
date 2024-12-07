import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class TextPanelDetails extends StatelessWidget {
  const TextPanelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Details",
          style: StyleManager.body01_Regular(color: ColorManager.primary7Color),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: Text(
            "Details",
            style:
                StyleManager.body01_Regular(color: ColorManager.primary6Color),
          ),
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Store",
            style:
                StyleManager.body01_Regular(color: ColorManager.primary7Color),
          ),
          children: [
            Text(
              "Store",
              style: StyleManager.body01_Regular(
                  color: ColorManager.primary5Color),
            ),
          ],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Caterory",
            style:
                StyleManager.body01_Regular(color: ColorManager.primary7Color),
          ),
          children: [
            Text(
              "Caterory",
              style: StyleManager.body01_Regular(
                  color: ColorManager.primary5Color),
            ),
          ],
        ),
      ],
    );
  }
}
