import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/home_page/widgets/circle_add_item.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page_logic.dart';
import 'package:ngpiteapp/screens/products_market_page/products_market_page_logic.dart';

class ProductItem extends GetView<ProductsMarketPageController> {
  final int index;
  ProductItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final ProductsCardEntite product = controller.productsPagingController.itemList == null ? ProductsCardEntite(id: 0 , categoryId: '0' , image: 'Image' , marketName: 'MarketName',name: "Name" , price: 100) : controller.productsPagingController.itemList![index];
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: InkWell(
        onTap: () {
          Get.to(
              () => ProductDetailsPage(
                    product.id,
                  ),
              binding: ProductDetailsPageBindings());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s18),
            color: ColorManager.primary1Color,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      child: Image.network(
                        product.image,
                        height: 150,
                        width: 150,
                        errorBuilder: (context, error, stackTrace) {
                          return ShimmerPlaceholder(height: 150, width: 150);
                        },
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return ShimmerPlaceholder(height: 150, width: 150);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10,
                        right: AppPadding.p10,
                        top: AppPadding.p10),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: product.name + "\n",
                            style: StyleManager.body01_Semibold(
                              color: ColorManager.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: product.marketName,
                            style: StyleManager.body02_Medium(
                              color: ColorManager.primary6Color,
                            ),
                          ),
                          TextSpan(
                            text: "\n" + product.categoryId,
                            style: StyleManager.body02_Medium(
                              color: ColorManager.primary6Color,
                            ),
                          ),
                          TextSpan(
                            text: "\n" + product.price.toString() + " ",
                            style: StyleManager.body01_Semibold(
                              color: ColorManager.primary5Color,
                            ),
                          ),
                          TextSpan(
                            text: StringManager.orderDetailsSyrianPounds.tr,
                            style: StyleManager.button2(
                              color: ColorManager.primary5Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              PositionedDirectional(
                bottom: 10,
                end: 0,
                child: CircleAddItem(index: index),
              )
            ],
          ),
        ),
      ),
    );
  }
}
