import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.leading, required this.content});

  final String leading;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: AppSize.s80,
            child: Text(
              leading + ":",
              style: StyleManager.body01_Semibold(),
            )),
        Flexible(
            child: Text(
          content,
          textAlign: TextAlign.start,
          softWrap: true,
          style: StyleManager.body01_Medium(),
        )),
      ],
    );
  }
}
