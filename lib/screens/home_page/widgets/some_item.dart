import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page.dart';
import 'package:shimmer/shimmer.dart';

class SomeItem extends GetView<HomePageController> {
  SomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getProducts(context);
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringManager.allProducts.tr,
            style: StyleManager.body01_Regular(fontsize: AppSize.s30),
          ),
          Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: AppPadding.p10,
                crossAxisSpacing: AppPadding.p10,
              ),
              itemCount:
                  controller.loadingStateProducts == LoadingState.doneWithData
                      ? controller.products.length
                      : 10,
              itemBuilder: (context, index) {
                return controller.loadingStateProducts ==
                        LoadingState.doneWithData
                    ? ProductItem(
                        product: controller.products[index],
                      )
                    : ShimmerPlaceholder(
                        height: 100,
                        width: double.infinity,
                      );
              },
            ),
          ),
          SizedBox(
            height: AppSizeScreen.screenHeight / 7,
          ),
        ],
      ),
    ));
  }
}

class ProductItem extends GetView<HomePageController> {
  ProductsCardEntite product;
  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: InkWell(
        onTap: () {
          Get.to(ProductDetailsPage(product.id));
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
                            text: "\n" +
                                controller
                                    .getCategoryforProducts(product.categoryId),
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
                child: CircleAddItem(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleAddItem extends StatelessWidget {
  const CircleAddItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s24,
      child: Center(
        child: InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: AppSize.s30,
            backgroundColor: ColorManager.secoundColor,
            child: Icon(
              Icons.add,
              color: ColorManager.whiteColor,
              size: AppSize.s16,
            ),
          ),
        ),
      ),
    );
  }
}
