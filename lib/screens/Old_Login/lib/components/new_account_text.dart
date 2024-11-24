import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class NewAccountText extends StatelessWidget {
  const NewAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t Have An Account? ',
          style: TextStyle(fontSize: width[14]),
        ),
        GestureDetector(
            child: Text(
          'Sign Up!',
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: width[14],
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}
