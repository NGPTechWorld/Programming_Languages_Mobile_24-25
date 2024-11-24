import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/cache/const.dart';

class MaintenanceMode extends StatelessWidget {
  final controller;
  const MaintenanceMode({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p30),
      child: Column(
        children: [
          Center(
            child: Text(
              settingApp!.msgrepair,
              style: StyleManager.h3_Semibold(
                fontsize: 20,
                color: ColorManager.textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p24),
            child: Center(
              child: InkWell(
                onTap: () => controller.restApp(context),
                child: Image.asset(
                  AssetsManager.maintenanceIcon,
                  fit: BoxFit.contain,
                  width: AppSizeScreen.screenWidth / 3,
                  height: AppSizeScreen.screenHeight / 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateMode extends StatelessWidget {
  final controller;
  const UpdateMode({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p30),
      child: Column(
        children: [
          Center(
            child: Text(
              settingApp!.msgup,
              style: StyleManager.h3_Semibold(
                fontsize: 20,
                color: ColorManager.textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p24),
            child: Center(
              child: InkWell(
                onTap: () => controller.restApp(context),
                child: SvgPicture.asset(
                  AssetsManager.upgradeSvg,
                  fit: BoxFit.contain,
                  width: AppSizeScreen.screenWidth / 3,
                  height: AppSizeScreen.screenHeight / 7,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
            child: InkWell(
              onTap: () {
                controller.launchURL(context);
              },
              child: Container(
                height: AppSizeScreen.screenHeight / 15,
                width: AppSizeScreen.screenWidth / 2,
                decoration: BoxDecoration(
                    color: ColorManager.secoundColor,
                    borderRadius: BorderRadius.circular(AppSize.s16)),
                child: Center(
                  child: Text(
                    "update",
                    style: StyleManager.h2_Semibold(
                        color: ColorManager.blackColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
