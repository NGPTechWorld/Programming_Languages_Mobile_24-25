import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/order_status_enum.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel({
    super.key,
    required this.statusId,
  });

  final int statusId;

  @override
  Widget build(BuildContext context) {
    final Color color = getColor();
    return Container(
      width: AppSize.s100,
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
        getStatusText(),
        textAlign: TextAlign.center,
        style: StyleManager.body02_Regular(color: color),
      ),
    );
  }

  Color getColor() {
    if (statusID[OrderStatusEnum.completed] == statusId)
      return ColorManager.secoundColor;
    else
      return ColorManager.redColor;
  }

  String getStatusText() {
    if (statusID[OrderStatusEnum.completed] == statusId)
      return StringManager.ordersHistoryStatusCompleted.tr;
    else if (statusID[OrderStatusEnum.cancelled] == statusId)
      return StringManager.ordersHistoryStatusCancelled.tr;
    else if (statusID[OrderStatusEnum.rejected] == statusId)
      return StringManager.ordersHistoryStatusRejected.tr;

    return "Unkown status";
  }
}
