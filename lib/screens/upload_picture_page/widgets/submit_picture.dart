import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/bottun_custom.dart';
import 'package:ngpiteapp/screens/custom_widgets/default_button.dart';
import 'package:ngpiteapp/screens/upload_picture_page/upload_picture_page_logic.dart';

class SubmitPicture extends GetView<UploadPicturePageController> {
  const SubmitPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizeScreen.screenHeight * 0.1),
        DefaultButton(
            text: StringManager.submitPicture.tr,
            press: () {
              controller.uploadPicture(context);
            },
            style: StyleManager.button1(color: ColorManager.whiteColor)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: BottouCustom(
            text: StringManager.skip.tr,
            background: ColorManager.whiteColor,
            textColor: ColorManager.primary6Color,
            function: () {
              controller.skipImage();
            },
          ),
        ),
      ],
    );
  }
}
