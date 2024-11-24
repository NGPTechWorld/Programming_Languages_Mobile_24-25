import 'package:flutter/material.dart';
import 'package:shop_app/components/social_card.dart';
import 'package:shop_app/size_config.dart';

class SocailLoginCards extends StatelessWidget {
  const SocailLoginCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(icon: 'assets/icons/google-icon.svg', press: () {}),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        SocialCard(icon: 'assets/icons/facebook-2.svg', press: () {}),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        SocialCard(icon: 'assets/icons/twitter.svg', press: () {}),
      ],
    );
  }
}
