import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:get/get.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // يمنع إغلاق الحوار بالنقر على الخلفية
    builder: (BuildContext context) {
      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: ColorManager.firstColor,
              ),
              SizedBox(height: 15),
              Text(
                StringManager.loading.tr,
                style: StyleManager.h3_Bold(color: ColorManager.whiteColor),
              ),
            ],
          ),
        ),
      );
    },
  );
}
