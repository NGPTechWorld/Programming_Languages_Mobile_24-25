import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/add_address_page/add_address_page_logic.dart';
import 'package:ngpiteapp/screens/add_address_page/widgets/input_address.dart';
import 'package:ngpiteapp/screens/add_address_page/widgets/submit_address.dart';
import 'package:ngpiteapp/screens/add_address_page/widgets/title_address.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/app_bar_default.dart';

class AddAddressPage extends GetView<AddAddressPageController> {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarDefault(
          title: StringManager.addressPageTitle.tr,
        ),
        backgroundColor: ColorManager.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizeScreen.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleAddress(),
                InputAddress(),
                SubmitAddress(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
