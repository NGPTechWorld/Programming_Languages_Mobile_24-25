import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page_logic.dart';
import 'package:ngpiteapp/screens/cart_page/widgets/counter.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page_logic.dart';

class ItemCart extends GetView<CartPageController> {
  const ItemCart({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final product = controller.products[index];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.primary2Color.withAlpha(100),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),
        child: Center(
          child: ListTile(
            leading: Image.network(
              product.image ?? "",
              errorBuilder: (context, error, stackTrace) => Image.asset(
                AssetsManager.nullImage,
                fit: BoxFit.contain,
              ),
              fit: BoxFit.cover,
            ),
            onTap: () {
              // TODO: add Bindings in all pages , and complete link of the page.
              Get.to(() =>ProductDetailsPage(
                product.id,
              ) , binding: ProductDetailsPageBindings());
            },
            title: Text(
              product.name,
              style: StyleManager.h4_Regular(),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.marketName,
                  style: StyleManager.body02_Regular(),
                ),
                Text(
                  product.total_cost.toString() +
                      ' ${StringManager.orderDetailsSyrianPounds.tr}',
                  style: StyleManager.body02_Semibold(),
                ),
              ],
            ),
            minVerticalPadding: AppPadding.p8,
            trailing: Container(
              width: AppSizeScreen.screenWidth * 0.25,
              child: Counter(
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
