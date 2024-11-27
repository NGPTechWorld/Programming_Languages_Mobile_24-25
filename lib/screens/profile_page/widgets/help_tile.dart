import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/custom_tile.dart';

class HelpTile extends GetView<ProfilePageController> {
  const HelpTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      leading: Icon(Icons.help_outline),
      title: Text(StringManager.profileHelpAndSupport.tr),
      onTap: controller.helpOnTap,
    );
  }
}
