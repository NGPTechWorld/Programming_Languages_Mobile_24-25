import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    final Color color = getColor();
    return Container(
      padding: EdgeInsets.only(
          left: AppPadding.p10,
          right: AppPadding.p10,
          top: AppPadding.p4,
          bottom: AppPadding.p2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Text(
        status.tr,
        textAlign: TextAlign.center,
        style: StyleManager.body02_Regular(color: color),
      ),
    );
  }

  // TODO : Handle status in String Manager.
  Color getColor() {
    switch (status) {
      case StringManager.ordersHistoryStatusRejected:
        return ColorManager.redColor;
      case StringManager.ordersHistoryStatusCompleted:
        return ColorManager.secoundColor;
    }
    return ColorManager.firstColor;
  }
}
