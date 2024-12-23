import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/button_product.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/image_and_favoriet.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/price_product.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/text_panel_details.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: Container(
        color: ColorManager.whiteColor,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: double.infinity,
            color: ColorManager.whiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImagAndFavorite(),
                  PriceProduct(),
                  TextPanelDetails(),
                  const SizedBox(height: AppSize.s20),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ButtonProduct(),
    );
  }
}
