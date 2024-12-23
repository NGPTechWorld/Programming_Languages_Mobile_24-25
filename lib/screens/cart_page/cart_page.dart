import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/cart_page/widgets/bottom_cart_page.dart';
import 'package:ngpiteapp/screens/cart_page/widgets/items_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Cart",
            style: StyleManager.h2_Bold(),
          ),
          backgroundColor: ColorManager.primary1Color,
        ),
        backgroundColor: ColorManager.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizeScreen.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                8,
                (index) => ItemCart(),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomCartPage(),
      ),
    );
  }
}
