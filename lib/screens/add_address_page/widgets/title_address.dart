import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/add_address_page/add_address_page_logic.dart';

class TitleAddress extends GetView<AddAddressPageController> {
  const TitleAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s20),
          child: Image.asset(
            AssetsManager.mapImage,
            height: AppSizeScreen.screenHeight * 0.2,
            width: AppSizeScreen.screenWidth * 0.9,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
