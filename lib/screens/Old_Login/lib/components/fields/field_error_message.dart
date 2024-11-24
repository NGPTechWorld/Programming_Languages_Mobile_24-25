import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';

class FieldErrorMessage extends StatelessWidget {
  const FieldErrorMessage({
    super.key,
    required this.error,
  });

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/Error.svg' , width: width[14], height: height[14],),
        SizedBox(width: width[10],),
        Text(error!),
        ],
    );
  }
}
