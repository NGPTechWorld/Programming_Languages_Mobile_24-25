import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: width[28],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
