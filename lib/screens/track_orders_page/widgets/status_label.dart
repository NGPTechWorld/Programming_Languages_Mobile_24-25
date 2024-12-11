import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/status_helper.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel({
    super.key,
    required this.statusId,
  });

  final int statusId;

  @override
  Widget build(BuildContext context) {
    final Color color = StatusHelper.getStatusColor(statusId);
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
        StatusHelper.getStatusText(statusId),
        textAlign: TextAlign.center,
        style: StyleManager.body02_Regular(color: color),
      ),
    );
  }
}
