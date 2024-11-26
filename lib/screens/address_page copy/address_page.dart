import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/screens/address_page/address_page_logic.dart';
import 'package:ngpiteapp/screens/address_page/widgets/suffix_icon.dart';
import 'package:ngpiteapp/screens/custom_widgets/custom_appbar.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';
import 'package:ngpiteapp/screens/custom_widgets/text_field_custom.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class AddressPage extends GetView<AddressPageController> {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: CustomAppBar(title :Text(StringManager.addressPageTitle.tr), centerTitle: true, leading: BackButton() ,),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizeScreen.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: AppSizeScreen.screenHeight * 0.01),
                Image.asset(
                  AssetsManager.mapImage,
                  height: AppSizeScreen.screenHeight * 0.2,
                ),
                SizedBox(height: AppSizeScreen.screenHeight * 0.01),
                TextFieldCustom(
                  title: StringManager.addressPageName.tr,
                  controller: controller.nameController,
                ),
                SizedBox(height: AppSizeScreen.screenHeight * 0.01),
                TextFieldCustom(
                  title: StringManager.addressPageAddress.tr,
                  controller: controller.addressController,
                  suffixIcon: CustomSuffixIcon(icon: AssetsManager.markerSvg),
                ),
                SizedBox(height: AppSizeScreen.screenHeight * 0.01),
                TextFieldCustom(
                  title: StringManager.addressPageStreet.tr,
                  controller: controller.streetController,
                  suffixIcon: CustomSuffixIcon(icon: AssetsManager.streetSvg),
                ),
                SizedBox(height: AppSizeScreen.screenHeight * 0.01),
                TextFieldCustom(
                  title: StringManager.addressPageNotes.tr,
                  controller: controller.notesController,
                  suffixIcon: CustomSuffixIcon(icon: AssetsManager.notesSvg),
                ),
                SizedBox(
                  height: AppSizeScreen.screenHeight * 0.1,
                ),
                DefaultButton(
                  text: StringManager.addressPageSave.tr,
                  press: controller.save,
                  style: StyleManager.h3_Bold(color: Colors.white),
                ),
                SizedBox(height: AppSizeScreen.screenHeight * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


