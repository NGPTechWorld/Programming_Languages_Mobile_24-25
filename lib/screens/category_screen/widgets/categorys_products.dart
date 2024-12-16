import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page.dart';

class CategorysProducts extends StatelessWidget {
  const CategorysProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p10),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: AppSize.s4,
                crossAxisSpacing: AppSize.s4,
                childAspectRatio: 2,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(ProductDetailsPage(1));
                  },
                  child: CategoryProductCard(),
                );
              },
            ),
            SizedBox(
              height: AppSizeScreen.screenHeight * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.primary1Color,
      elevation: 0,
      child: Row(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
              color: ColorManager.firstLightColor.withAlpha(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p30, horizontal: AppPadding.p20),
              child: Image.asset(
                AssetsManager.nullImage,
                width: AppSizeScreen.screenHeight / 8,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Product name",
                      style: StyleManager.h4_Bold(),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "store name",
                      style: StyleManager.body02_Medium(
                          color: ColorManager.primary5Color),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "details",
                        style: StyleManager.body02_Medium(
                            color: ColorManager.primary5Color),
                      ),
                    ),
                  ),
                  const Spacer(),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "quantity",
                        style: StyleManager.body01_Medium(
                            color: ColorManager.firstDarkColor)),
                    TextSpan(
                        text: "\nprice",
                        style: StyleManager.body01_Semibold(
                            color: ColorManager.firstDarkColor)),
                  ])),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
