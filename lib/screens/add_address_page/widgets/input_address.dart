import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/add_address_page/add_address_page_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/text_field_custom.dart';

class InputAddress extends GetView<AddAddressPageController> {
  const InputAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizeScreen.screenHeight * 0.01),
        Divider(
          color: ColorManager.firstColor,
          thickness: 3,
        ),
        SizedBox(height: AppSizeScreen.screenHeight * 0.01),
        TextFieldCustom(
          title: StringManager.addressPageName.tr,
          controller: controller.nameController,
          suffixIcon: Icon(Icons.home_sharp),
        ),
        SizedBox(height: AppSizeScreen.screenHeight * 0.01),
        TextFieldCustom(
          title: StringManager.addressPageAddress.tr,
          controller: controller.addressController,
          suffixIcon: Icon(Icons.pin_drop_sharp),
        ),
        SizedBox(height: AppSizeScreen.screenHeight * 0.01),
        TextFieldCustom(
          title: StringManager.addressPageStreet.tr,
          controller: controller.streetController,
          suffixIcon: Icon(Icons.map_rounded),
        ),
        SizedBox(height: AppSizeScreen.screenHeight * 0.01),
        TextFieldCustom(
          title: StringManager.addressPageNotes.tr,
          controller: controller.notesController,
          suffixIcon: Icon(Icons.note_alt_outlined),
        ),
      ],
    );
  }
}
