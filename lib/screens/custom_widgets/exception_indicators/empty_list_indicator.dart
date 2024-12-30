import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/exception_indicator.dart';

class EmptyListIndicator extends StatelessWidget {
  final String text;

  const EmptyListIndicator(
      {super.key, this.text = StringManager.paginationNoProducts});

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: StringManager.paginationOops.tr,
        message: text.tr,
        assetName: AssetsManager.emptyBox,
      );
}
