import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';

class PicutreAndName extends GetView<ProfilePageController> {
  const PicutreAndName({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            // TODO: Check this
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  AppSizeScreen.screenWidth * 0.15),
            ),
            height: AppSizeScreen.screenWidth * 0.3,
            width: AppSizeScreen.screenWidth * 0.3,
            child: Image.asset(
              AssetsManager.profileDefaultImage,
              fit: BoxFit.cover,
            )),
        Container(
          margin: EdgeInsets.only(top: AppSize.s8),
          child: Text(controller.getName()),
        ),
        SizedBox(height: AppSizeScreen.screenHeight*0.05,),
      ],
    );
  }
}
