import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';

import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/profile_page/profile_page_logic.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/logout_tile.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/language_tile.dart';
import 'package:ngpiteapp/screens/profile_page/widgets/address_tile.dart';
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
        appBar: appBar(context),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
            () {
              controller.getName(context);
              controller.getPicture(context);
            },
          ),
          color: ColorManager.firstColor,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(AppSizeScreen.screenWidth * 0.05),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    PicutreAndName(),
                    MyAccountTile(),
                    TrackOrderTile(),
                    OrderHistoryTile(),
                    AddressesTile(),
                    LanguageTile(),
                    LogoutTile(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(StringManager.profileHeader.tr),
      centerTitle: true,
      leading: Text(""),
      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       controller.logout(context);
      //     },
      //     icon: const Icon(Icons.logout_outlined),
      //     color: ColorManager.blackColor,
      //     iconSize: 32,
      //   )
      // ],
    );
  }
}
