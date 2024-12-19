import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page_logic.dart';

class TextPanelDetails extends GetView<ProductDetailsPageController> {
  const TextPanelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Descreption:",
          style: StyleManager.h3_Bold(color: ColorManager.primary5Color),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: Text(
            controller.product!.description,
            style: StyleManager.h4_Regular(color: ColorManager.primary5Color),
          ),
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Market",
            style: StyleManager.h3_Bold(color: ColorManager.primary5Color),
          ),
          children: [
            Text(
              "Store",
              style: StyleManager.h4_Regular(color: ColorManager.primary5Color),
            ),
          ],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Quantity",
            style: StyleManager.h3_Bold(color: ColorManager.primary5Color),
          ),
          children: [
            Text(
              controller.product!.quantity.toString(),
              style: StyleManager.h4_Regular(color: ColorManager.primary5Color),
            ),
          ],
        ),
      ],
    );
  }
}
