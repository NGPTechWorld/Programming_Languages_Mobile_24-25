import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';

class HelperWidget {
  static void languageDialgo(){
    Get.defaultDialog(
      title: StringManager.languageDialogTitle.tr,
      content: Column(
        children: [
          ListTile(
            title: Text(StringManager.languageDialogEnglish.tr),
            onTap: () {
              Get.updateLocale(Locale('en'));
              Get.back();
            },
          ),
          ListTile(
            title: Text(StringManager.languageDialogArabic.tr),
            onTap: () {
              Get.updateLocale(Locale('ar'));
              Get.back();
            },
          ),
        ],
      ),
    );
  
  }
}