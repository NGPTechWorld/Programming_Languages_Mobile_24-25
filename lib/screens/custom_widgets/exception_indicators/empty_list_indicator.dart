
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/exception_indicator.dart';
// TODO : Edit this
/// Indicates that no items were found.
class EmptyListIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: StringManager.paginationOops.tr,
        message: StringManager.paginationNoProducts.tr,
        assetName: AssetsManager.emptyBox,
        onTryAgain: () {},
      );
}
