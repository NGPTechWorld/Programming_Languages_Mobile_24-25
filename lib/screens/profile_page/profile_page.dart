import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/help_tile.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/language_tile.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/location_tile.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/my_account_tile.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/order_history_tile.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/picutre_and_name.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/track_order_tile.dart';

class ProfilePage extends GetView<ProfilePageController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary1Color,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizeScreen.screenWidth * 0.05),
            child: Column(
              children: [
                PicutreAndName(),
                MyAccountTile(),
                TrackOrderTile(),
                OrderHistoryTile(),
                LocationTile(),
                LanguageTile(),
                HelpTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(StringManager.profileHeader.tr),
      centerTitle: true,
    );
  }
}
