import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/upload_picture_page/upload_picture_page_logic.dart';

class InputPicture extends GetView<UploadPicturePageController> {
  const InputPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<UploadPicturePageController>(
          builder: (controller) => Center(
            child: controller.imageProfile == null
                ? Icon(Icons.supervised_user_circle_outlined,
                    size: AppSize.s100, color: ColorManager.primary4Color)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                      controller.imageProfile!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.05,
        ),
        ElevatedButton(
          onPressed: () {
            controller.choosePicture();
          },
          child: Text(
            StringManager.chooseUploadPicture.tr,
            style: StyleManager.body01_Semibold(color: ColorManager.whiteColor),
          ),
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(ColorManager.firstLightColor),
            foregroundColor: WidgetStatePropertyAll(ColorManager.whiteColor),
          ),
        ),
      ],
    );
  }
}
