import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/my_account_page/widgets/image_loading_place_holder.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';

class PicutreAndName extends GetView<ProfilePageController> {
  const PicutreAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    controller.getPicture(context);
    controller.getName(context);
    return Obx(
      () => Column(
        children: [
          GestureDetector(
            onTap: controller.showImage,
            child: Container(
                // TODO: Check this
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppSizeScreen.screenWidth * 0.15),
                ),
                height: AppSizeScreen.screenWidth * 0.3,
                width: AppSizeScreen.screenWidth * 0.3,
                child: controller.loadingImageState == LoadingState.loading
                    ? ImageLoadingPlaceHolder()
                    : Image.network(
                        controller.imagePath.value,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return ImageLoadingPlaceHolder();
                        },
                      )),
          ),
          Container(
            margin: EdgeInsets.only(top: AppSize.s8),
            child: Text(
              controller.name.value,
              style: StyleManager.h3_Bold(),
            ),
          ),
          SizedBox(
            height: AppSizeScreen.screenHeight * 0.05,
          ),
        ],
      ),
    );
  }
}
