import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/custom_tile.dart';

class LogoutTile extends GetView<ProfilePageController> {
  const LogoutTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      leading: const Icon(Icons.logout_outlined),
      title: Text(StringManager.logout.tr),
      onTap: () => controller.logout(context),
    );
  }
}
