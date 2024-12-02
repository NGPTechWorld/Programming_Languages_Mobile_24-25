import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/custom_tile.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';

class LocationTile extends GetView<ProfilePageController> {
  const LocationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      leading: SvgPicture.asset(AssetsManager.mapIconSvg),
      title: Text(StringManager.profileLocation.tr),
      onTap: controller.loactionOnTap,
    );
  }
}
