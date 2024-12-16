import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/home_page/widgets/some_item.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page.dart';

class RecommendedList extends StatelessWidget {
  RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.recommendedText,
              style: StyleManager.body01_Regular(fontsize: AppSize.s30),
            ),
            SizedBox(
                height: AppSizeScreen.screenHeight / 3.7,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return ItemRecommended();
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class ItemRecommended extends StatelessWidget {
  const ItemRecommended({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      child: InkWell(
        onTap: () {
          Get.to(ProductDetailsPage(5));
        },
        child: Container(
          width: AppSizeScreen.screenWidth / 2.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s18),
            color: ColorManager.primary1Color,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Center(
                  child: Image.asset(
                    AssetsManager.nullImage,
                    width: AppSize.s100,
                    height: AppSize.s100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Divider(
                color: ColorManager.primary3Color,
                thickness: 1,
                indent: AppSize.s20,
                endIndent: AppSize.s20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Name Product",
                          style: StyleManager.body01_Semibold(
                            color: ColorManager.primary6Color,
                          ),
                        ),
                        TextSpan(
                          text: "\nName Store",
                          style: StyleManager.body02_Medium(
                            color: ColorManager.primary5Color,
                          ),
                        ),
                        TextSpan(
                          text: "\nCategory",
                          style: StyleManager.body02_Medium(
                            color: ColorManager.primary5Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Stack(
                  children: [
                    Container(
                      height: AppSize.s24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        color: ColorManager.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.blackColor.withOpacity(0.03),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Price",
                                style: StyleManager.body02_Semibold(
                                    color: ColorManager.primary6Color),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    PositionedDirectional(
                        top: 0, end: -15, child: CircleAddItem())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
