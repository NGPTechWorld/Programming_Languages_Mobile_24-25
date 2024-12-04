import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';
import 'package:ngpiteapp/screens/show_addresses_page/show_addresses_page_logic.dart';

class AddAddressFloatingButton extends GetView<ShowAddressesController> {
  const AddAddressFloatingButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: DefaultButton(
          text: StringManager.showAddressesAddLocationButton.tr,
          press: controller.addAddress,
          style: StyleManager.body01_Medium(
              color: ColorManager.whiteColor, fontsize: AppSize.s18)),
    );
  }
}
