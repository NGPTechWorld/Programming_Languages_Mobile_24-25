import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/search_page/search_page_logic.dart';

class ChooseButton extends GetView<SearchPageController> {
  const ChooseButton(
      {super.key, required this.onSelectValue, required this.text});
  final bool onSelectValue;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: ElevatedButton(
            onPressed: () => controller.isProductsSelected.value = onSelectValue,
            style: choosStyle(),
            child: Text(text),
          ),
        ));
  }

  ButtonStyle choosStyle() {
    ButtonStyle unselectedStyle = ElevatedButton.styleFrom(
      backgroundColor: ColorManager.whiteColor,
      foregroundColor: ColorManager.firstColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20),
        side: BorderSide(color: ColorManager.firstColor, width: AppSize.s2),
      ),
    );
    ButtonStyle selectedStyle = ElevatedButton.styleFrom(
      backgroundColor: ColorManager.firstColor,
      foregroundColor: ColorManager.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20),
        side:
            const BorderSide(color: ColorManager.firstColor, width: AppSize.s2),
      ),
    );

    return (onSelectValue)
        ? (controller.isProductsSelected.value ? selectedStyle : unselectedStyle)
        : (!controller.isProductsSelected.value
            ? selectedStyle
            : unselectedStyle);
  }
}
