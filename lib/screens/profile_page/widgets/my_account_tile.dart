import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/custom_tile.dart';

class MyAccountTile extends GetView<ProfilePageController> {
  const MyAccountTile({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return CustomTile(
      leading: Icon(Icons.person),
      title: Text(StringManager.profileMyAccount.tr),
      onTap: controller.myAccountOnTap,
    );
  }
}
