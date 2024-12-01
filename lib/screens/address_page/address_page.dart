import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/address_page/address_page_logic.dart';
import 'package:ngpiteapp/screens/address_page/widgets/address_input.dart';
import 'package:ngpiteapp/screens/address_page/widgets/map.dart';
import 'package:ngpiteapp/screens/address_page/widgets/name_input.dart';
import 'package:ngpiteapp/screens/address_page/widgets/notes_input.dart';
import 'package:ngpiteapp/screens/address_page/widgets/save_button.dart';
import 'package:ngpiteapp/screens/address_page/widgets/street_input.dart';
import 'package:ngpiteapp/screens/custom_widgets/custom_appbar.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class AddressPage extends GetView<AddressPageController> {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizeScreen.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Map(),
                NameInput(controller: controller),
                AddressInput(controller: controller),
                StreetInput(controller: controller),
                NotesInput(controller: controller),
                SaveButton(controller: controller)
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomAppBar appBar() {
    return CustomAppBar(
        title: Text(StringManager.addressHeader.tr),
        centerTitle: true,
        leading: BackButton(),
      );
  }
}
