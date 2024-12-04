import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/button_product.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/price_product.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/text_panel_details.dart';

class ProductDetailsStyle3 extends StatefulWidget {
  const ProductDetailsStyle3({super.key});

  @override
  State<ProductDetailsStyle3> createState() => _ProductDetailsStyle3State();
}

class _ProductDetailsStyle3State extends State<ProductDetailsStyle3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: Container(
        color: ColorManager.whiteColor,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            color: ColorManager.whiteColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: AppPadding.p10,
                      left: AppPadding.p10,
                      right: AppPadding.p10),
                  child: Container(
                    width: double.infinity,
                    color: ColorManager.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p20, vertical: AppPadding.p30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: AppSizeScreen.screenHeight / 3.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(AppPadding.p8),
                                  child: Image.asset(
                                    AssetsManager.nullImage,
                                    width: AppSizeScreen.screenWidth / 2,
                                    height: AppSizeScreen.screenHeight / 5,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPadding.p20,
                                    horizontal: AppPadding.p8),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                    color: ColorManager.primary1Color),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.favorite),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: AppPadding.p20),
                                      child: Icon(Icons.more_horiz),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          PriceProduct(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p30),
                            child: Container(
                                color: ColorManager.primary1Color,
                                child: ButtonProduct()),
                          ),
                          TextPanelDetails(),
                          const SizedBox(height: AppSize.s20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
