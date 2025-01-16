import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/search_page/widgets/choose_button.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChooseButton(
              onSelectValue: true, text: StringManager.searchProducts.tr),
          const SizedBox(width: AppSize.s10),
          ChooseButton(
              onSelectValue: false, text: StringManager.searchMarkets.tr)
        ],
      ),
    );
  }
}
