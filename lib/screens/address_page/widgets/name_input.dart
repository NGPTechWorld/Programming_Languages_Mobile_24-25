import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/address_page/address_page_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/text_field_custom.dart';

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
    required this.controller,
  });

  final AddressPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    
    SizedBox(height: AppSizeScreen.screenHeight * 0.01),
    TextFieldCustom(
      title: StringManager.addressPageName.tr,
      controller: controller.nameController,
    ),
    ],);
  }
}
