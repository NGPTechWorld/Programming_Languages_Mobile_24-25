import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/custom_tile.dart';

class LanguageTile extends GetView<ProfilePageController> {
  const LanguageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      leading: Icon(Icons.language),
      title: Text(StringManager.profileLanguage.tr),
      onTap: controller.languageOnTap,
    );
  }
}
