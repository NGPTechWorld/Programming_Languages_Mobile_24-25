import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/otp_page/otp_page_logic.dart';

class TitlePicture extends GetView<OtpPageController> {
  const TitlePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.01,
        ),
        Text(StringManager.titleUploadPicture.tr,
            style: StyleManager.h1_Bold()),
        Text(StringManager.subTitleUploadPicture.tr,
            style: StyleManager.body01_Regular()),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.1,
        ),
      ],
    );
  }
}
