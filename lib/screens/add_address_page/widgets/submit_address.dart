import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/add_address_page/add_address_page_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';

class SubmitAddress extends GetView<AddAddressPageController> {
  const SubmitAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.1,
        ),
        Obx(
          () => DefaultButton(
            text: StringManager.addressPageSave.tr,
            press: () => controller.addLocation(context),
            style: StyleManager.h3_Bold(color: Colors.white),
            loading: controller.loadingState.value == LoadingState.loading,
          ),
        ),
        SizedBox(height: AppSizeScreen.screenHeight * 0.01),
      ],
    );
  }
}
