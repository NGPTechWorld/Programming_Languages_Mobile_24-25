import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/select_address_cart_page_logic.dart';

class AddNewAddressText extends GetView<SelectAddressCartPageController> {
  const AddNewAddressText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p24),
      child: InkWell(
        onTap: () => controller.goToAddAddressPage(),
        child: Container(
          height: AppSizeScreen.screenHeight / 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManager.secoundDarkColor,
                    width: 1,
                  ),
                ),
                child: CircleAvatar(
                  radius: AppSize.s12,
                  backgroundColor: ColorManager.whiteColor,
                  child: Icon(
                    Icons.add,
                    color: ColorManager.secoundDarkColor,
                    size: AppSize.s16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                child: Text(
                  "addNewAddressText",
                  style: StyleManager.body02_Regular(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
