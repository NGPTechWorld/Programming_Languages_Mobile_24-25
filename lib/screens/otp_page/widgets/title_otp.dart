import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/otp_page/otp_page_logic.dart';

class TitleOtp extends GetView<OtpPageController> {
  const TitleOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.05,
        ),
        Text(StringManager.titlePhoneVerification.tr,
            style: StyleManager.h1_Bold()),
        Text(StringManager.subTitlePhoneVerification.tr,
            style: StyleManager.body01_Regular()),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.05,
        ),
      ],
    );
  }
}
