import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(StringManager.byClicking.tr,
              style: StyleManager.body01_Regular(fontsize: AppSize.s12)),
          InkWell(
              child: Text(
            StringManager.termsAndConditions.tr,
            style: StyleManager.body01_Semibold(fontsize: AppSize.s12),
          )),
          Text(StringManager.andSign.tr,
              style: StyleManager.body01_Regular(fontsize: AppSize.s12)),
          InkWell(
              child: Text(
            StringManager.privacyPolicy.tr,
            style: StyleManager.body01_Semibold(fontsize: AppSize.s12),
          )),
        ],
      ),
    );
  }
}
