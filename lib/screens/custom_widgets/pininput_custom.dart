// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class PininputCustom extends StatefulWidget {
  final TextEditingController controller;
  const PininputCustom(
      {super.key, required this.controller});
  @override
  State<PininputCustom> createState() => _PininputCustomState();
}

class _PininputCustomState extends State<PininputCustom> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          controller: widget.controller,
          length: 6,
          defaultPinTheme: PinTheme(
            textStyle: StyleManager.body01_Medium(),
            height: AppSizeScreen.screenHeight * 0.06,
            width: AppSizeScreen.screenWidth * 0.1,
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.blackColor),
            ),
          ),
          focusedPinTheme: PinTheme(
            height: AppSizeScreen.screenHeight * 0.06,
            width: AppSizeScreen.screenWidth * 0.1,
            decoration: BoxDecoration(
              color: ColorManager.firstLightColor.withAlpha(30),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.firstColor),
            ),
          ),
        ),
      ),
    );
  }
}
