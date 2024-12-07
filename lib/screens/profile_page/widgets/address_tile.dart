import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/custom_tile.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';

class AddressesTile extends GetView<ProfilePageController> {
  const AddressesTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      leading: SvgPicture.asset(AssetsManager.mapImage),
      title: Text(StringManager.profileLocation.tr),
      onTap: controller.loactionOnTap,
    );
  }
}
