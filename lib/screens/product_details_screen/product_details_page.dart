import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page_logic.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/app_bar_product_details.dart';
import 'package:ngpiteapp/screens/product_details_screen/widgets/product_details_body.dart';

class ProductDetailsPage extends GetView<ProductDetailsPageController> {
  final id;
  const ProductDetailsPage(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsPageController());
    controller.getProduct(context, id);
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorManager.whiteColor,
          child: CustomScrollView(
            slivers: [
              AppBarProductDetails(),
              SliverFillRemaining(
                child: controller.loadingState == LoadingState.doneWithData
                    ? ProductDetailsBody()
                    : CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
