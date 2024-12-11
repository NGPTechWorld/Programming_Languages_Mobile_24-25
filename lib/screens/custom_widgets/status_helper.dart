import 'dart:ui';

import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/data/enums/order_status_enum.dart';

class StatusHelper {
 static Color getStatusColor(int id) {
    if (statusID[OrderStatusEnum.completed] == id)
      return ColorManager.secoundColor;
    else if (statusID[OrderStatusEnum.rejected] == id ||
        statusID[OrderStatusEnum.cancelled] == id)
      return ColorManager.redColor;
    else
      return ColorManager.middileColor;
  }

  static String getStatusText(int id) {
    if (statusID[OrderStatusEnum.completed] == id)
      return StringManager.ordersHistoryStatusCompleted.tr;
    else if (statusID[OrderStatusEnum.cancelled] == id)
      return StringManager.ordersHistoryStatusCancelled.tr;
    else if (statusID[OrderStatusEnum.rejected] == id)
      return StringManager.ordersHistoryStatusRejected.tr;
    else if (statusID[OrderStatusEnum.pending] == id)
      return StringManager.ordersHistoryStatusPending.tr;
    else if (statusID[OrderStatusEnum.delivering] == id)
      return StringManager.ordersHistoryStatusDelivering.tr;

    return "Unkown status";
  }
}