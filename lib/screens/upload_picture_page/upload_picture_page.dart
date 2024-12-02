import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/app_bar_default.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/upload_picture_page/widgets/input_picture.dart';
import 'package:ngpiteapp/screens/upload_picture_page/widgets/submit_picture.dart';
import 'package:ngpiteapp/screens/upload_picture_page/widgets/title_picture.dart';

class ProfilePictureUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarDefault(
          title: StringManager.uploadPicture.tr,
        ),
        backgroundColor: ColorManager.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizeScreen.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitlePicture(),
                InputPicture(),
                SubmitPicture(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
