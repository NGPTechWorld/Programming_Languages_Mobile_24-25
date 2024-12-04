import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';

class DialogButtons extends GetView<MyAccountController> {
  const DialogButtons( {
    super.key,
    required this.cancelText, required this.okText, required this.onOk, required this.onCancel,
  });
  final String cancelText , okText;
  final VoidCallback? onOk , onCancel; 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: onCancel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: Text(
            cancelText,
            style: TextStyle(color: ColorManager.firstColor),
          ),
        ),
        SizedBox(width: AppSize.s10),
        MaterialButton(
          onPressed:onOk,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s20)),
          color: ColorManager.firstColor,
          child: Text(
            okText,
            style: TextStyle(color: ColorManager.whiteColor),
          ),
        ),
      ],
    );
  }
}
