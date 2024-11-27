import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/pininput_custom.dart';
import 'package:ngpiteapp/screens/otp_page/otp_page_logic.dart';

class InputOtp extends GetView<OtpPageController> {
  const InputOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.1,
        ),
        PininputCustom(controller: controller.textEditingController),
        SizedBox(
          height: AppSizeScreen.screenHeight * 0.1,
        ),
      ],
    );
  }
}
