import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/screens/show_addresses_page/show_addresses_page_logic.dart';
import 'package:ngpiteapp/screens/show_addresses_page/widgets/add_address_floating_button.dart';
import 'package:ngpiteapp/screens/show_addresses_page/widgets/addresses_list.dart';

class ShowAddressesPage extends GetView<ShowAddressesController> {
  @override
  Widget build(BuildContext context) {
    controller.getAddresses(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: AddressesList(),
        floatingActionButton: AddAddressFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringManager.showAddressesHeader.tr,
        style: StyleManager.h1_Medium(color: ColorManager.whiteColor),
      ),
      backgroundColor: ColorManager.firstColor,
      leading: BackButton(
        color: ColorManager.whiteColor,
      ),
      centerTitle: true,
    );
  }
}
