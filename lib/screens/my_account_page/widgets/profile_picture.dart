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
    return Obx(
      () => Column(
        children: [
          SizedBox(height: AppSize.s20),
          Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: controller.showPicture,
                  child: Container(
                      // TODO: Check AntiAlias
                      // TODO: add inkwell to show the image when pressed on it. Dialog maybe ?
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppSizeScreen.screenWidth * 0.15),
                      ),
                      height: AppSizeScreen.screenWidth * 0.3,
                      width: AppSizeScreen.screenWidth * 0.3,
                      child: controller.imagePath.value == ""
                          ? Image.asset(
                              AssetsManager.profileDefaultImage,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              controller.imagePath!.value,
                              fit: BoxFit.cover,
                            )),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: MaterialButton(
                    onPressed: controller.pictureUpdate,
                    minWidth: AppSize.s32,
                    height: AppSize.s32,
                    padding: EdgeInsets.all(0),
                    color: ColorManager.firstColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s16)),
                    // TODO : check camera Icon
                    child: Icon(Icons.camera_alt, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: AppSize.s8),
        ],
      ),
    );
  }
}
