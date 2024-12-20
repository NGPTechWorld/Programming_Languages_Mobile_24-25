import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/select_address_cart_page_logic.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/widgets/add_new_address.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/widgets/body_select_addrees.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/widgets/bottom_sa_page.dart';
import 'package:ngpiteapp/screens/show_addresses_page/widgets/address_card.dart';

class SelectAddressCartPage extends StatelessWidget {
  SelectAddressCartPage({super.key});
  int indexCurrent = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: Container(
          color: ColorManager.whiteColor,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodySelectAddrees(),
                    AddNewAddressText(),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: BottomSaPage());
  }
}
