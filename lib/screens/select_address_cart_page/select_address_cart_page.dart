import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/widgets/add_new_address.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/widgets/body_select_addrees.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/widgets/bottom_sa_page.dart';

class SelectAddressCartPage extends StatelessWidget {
  SelectAddressCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
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
                    SizedBox(height: AppSizeScreen.screenHeight * 0.2,)
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: BottomSaPage());
  }
}
