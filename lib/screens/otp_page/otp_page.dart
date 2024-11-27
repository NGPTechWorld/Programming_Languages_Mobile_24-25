import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/login_page/widgets/terms_and_pivacy.dart';
import 'package:ngpiteapp/screens/otp_page/widgets/input_otp.dart';
import 'package:ngpiteapp/screens/otp_page/widgets/submit_otp.dart';
import 'package:ngpiteapp/screens/otp_page/widgets/title_otp.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/login_page/login_page_logic.dart';

class OtpPage extends GetView<LoginPageController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizeScreen.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleOtp(),
                InputOtp(),
                SubmitOtp(),
                TermsAndPrivacy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
