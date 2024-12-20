import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.primary2Color.withAlpha(100),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),
        child: Center(
          child: ListTile(
            leading: Image.asset(AssetsManager.nullImage),
            title: Text(
              "name product",
              style: StyleManager.h4_Regular(),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "market name",
                  style: StyleManager.body02_Regular(),
                ),
                Text(
                  "total_cost",
                  style: StyleManager.body02_Semibold(),
                ),
              ],
            ),
            minVerticalPadding: AppPadding.p8,
            trailing: Container(
              width: AppSizeScreen.screenWidth * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: AppSize.s16,
                    backgroundColor: ColorManager.primary3Color.withAlpha(100),
                    child: Icon(
                      Icons.remove,
                      color: ColorManager.blackColor,
                      size: AppSize.s16,
                    ),
                  ),
                  SizedBox(
                    width: AppSizeScreen.screenWidth * 0.08,
                    child: Center(
                      child: Text(
                        "1",
                        style: StyleManager.body01_Regular(),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: AppSize.s16,
                    backgroundColor: ColorManager.primary3Color.withAlpha(100),
                    child: Icon(
                      Icons.add,
                      color: ColorManager.blackColor,
                      size: AppSize.s16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
