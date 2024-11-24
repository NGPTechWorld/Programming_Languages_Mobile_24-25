import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';

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
                color: ColorManager.secoundColor,
              ),
              SizedBox(height: 15),
              Text(
                'جاري التحميل...',
                style: StyleManager.h3_Bold(color: ColorManager.whiteColor),
              ),
            ],
          ),
        ),
      );
    },
  );
}
