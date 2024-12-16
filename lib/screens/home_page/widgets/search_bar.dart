import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';

class SearchTextBar extends StatelessWidget {
  const SearchTextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      style: StyleManager.body02_Medium(color: ColorManager.primary1Color),
      cursorColor: ColorManager.primary1Color,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: AppSize.s10),
          child: Icon(
            Icons.search,
            color: ColorManager.whiteColor,
          ),
        ),
        hintText: StringManager.searchProductsText.tr,
        hintStyle:
            StyleManager.body02_Medium(color: ColorManager.primary1Color),
        filled: true,
        fillColor: ColorManager.firstDarkColor,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.transparentColor,
            ),
            borderRadius: BorderRadius.circular(AppSize.s26)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.transparentColor,
            ),
            borderRadius: BorderRadius.circular(AppSize.s26)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.transparentColor,
            ),
            borderRadius: BorderRadius.circular(AppSize.s26)),
      ),
    );
  }
}
