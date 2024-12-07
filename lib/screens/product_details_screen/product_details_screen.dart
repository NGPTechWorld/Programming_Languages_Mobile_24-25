import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/product_details_style_3.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/silver_app_bar_product_details_style_3.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorManager.whiteColor,
          child: CustomScrollView(
            slivers: [
              SilverAppBarProductDetailsStyle3(),
              SliverFillRemaining(
                child: ProductDetailsStyle3(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
