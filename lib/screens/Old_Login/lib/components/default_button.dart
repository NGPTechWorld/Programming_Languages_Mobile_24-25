import 'package:flutter/material.dart';
import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key, required this.text, required this.press, this.loading});
  final String text;
  final VoidCallback press;
  final bool? loading;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: loading == true ? () {} : press,
      minWidth: double.infinity,
      height: getProportionateScreenHeight(56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: kPrimaryColor,
      child: loading == true
          ? const CircularProgressIndicator(
              color: kPrimaryLightColor,
            )
          : Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(18)),
            ),
    );
  }
}
