import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/sign_in.dart';
import 'package:shop_app/size_config.dart';

import 'splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int curPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let't shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    curPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                      text: splashData[index]['text']!,
                      image: splashData[index]['image']!,
                    ))),
        Expanded(
          flex: 2,
          child: Column(children: [
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                splashData.length,
                (index) => buildDot(index: index),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:  getProportionateScreenWidth(20)),
              child: DefaultButton(text: "Continue", press: (){
                Get.toNamed(SignInScreen.route);
              }),
            ),
            const Spacer(
              flex: 2,
            ),
          ]),
        )
      ],
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 6),
      width: curPage == index
          ? getProportionateScreenWidth(20)
          : getProportionateScreenWidth(6),
      height: getProportionateScreenHeight(6),
      decoration: BoxDecoration(
          color: curPage == index ? kPrimaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(3)),
      duration: kAnimationDuration,
    );
  }
}
