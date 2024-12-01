import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';

class ProfilePicture extends GetView<MyAccountController> {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s20),
        Center(
          child: Stack(
            children: [
              Container(
                  // TODO: Check this too
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppSizeScreen.screenWidth * 0.15),
                  ),
                  height: AppSizeScreen.screenWidth * 0.3,
                  width: AppSizeScreen.screenWidth * 0.3,
                  child: Image.asset(
                    AssetsManager.profileDefaultImage,
                    fit: BoxFit.cover,
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: controller.pictureUpdate,
                  child: CircleAvatar(
                    radius: AppSize.s18,
                    backgroundColor: ColorManager.firstColor,
                    child: Icon(Icons.camera_alt, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        // SizedBox(height: AppSize.s20),
        // Divider(height: AppSize.s6,),
        SizedBox(height: AppSize.s8),

      ],
    );
  }
}
