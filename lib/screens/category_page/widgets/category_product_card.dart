import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';

class CategoryProductCard extends GetView<CategoryPageController> {
  const CategoryProductCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final product = controller.productsPagingController.itemList![index];
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
                      product.name,
                      style: StyleManager.h4_Bold(),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      product.marketName,
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
                        text: product.price.toString() +' ${StringManager.orderDetailsSyrianPounds.tr}' ,
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
