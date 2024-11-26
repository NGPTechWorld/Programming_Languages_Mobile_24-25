import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/address_page/address_page_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.controller,
  });

  final AddressPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      
    SizedBox(
      height: AppSizeScreen.screenHeight * 0.1,
    ),
    DefaultButton(
      text: StringManager.addressPageSave.tr,
      press: controller.save,
      style: StyleManager.h3_Bold(color: Colors.white),
    ),
    SizedBox(height: AppSizeScreen.screenHeight * 0.01),
    ],);
  }
}
