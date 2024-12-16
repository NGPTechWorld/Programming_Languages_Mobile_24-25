import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/page_circular_indicator.dart';
import 'package:ngpiteapp/screens/forgot_password_page/forgot_password_page_logic.dart';
import 'package:ngpiteapp/screens/forgot_password_page/widgets/input_otp.dart';
import 'package:ngpiteapp/screens/forgot_password_page/widgets/submit_otp.dart';
import 'package:ngpiteapp/screens/forgot_password_page/widgets/title_otp.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    controller.sendCode(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizeScreen.screenWidth * 0.05),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: controller.sendingState.value == LoadingState.loading
                    ? [PageCircularIndicator()]
                    : [
                        TitleOtp(),
                        InputOtp(),
                        SubmitOtp(),
                      ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.firstColor,
      leading: BackButton(
        color: ColorManager.whiteColor,
      ),
      centerTitle: true,
    );
  }
}
