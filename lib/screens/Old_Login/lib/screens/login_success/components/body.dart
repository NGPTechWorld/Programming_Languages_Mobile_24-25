import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/main_title.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.05),
        Image.asset('assets/images/success.png'),
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        const MainTitle(title: "Login Success"),
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width[60]),
          child: DefaultButton(text: "Go To Home", press: () {}),
        )
      ],
    );
  }
}
