import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_screen.dart';

class SomeItem extends StatelessWidget {
  SomeItem({super.key});
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
            "All Products",
            style: StyleManager.body01_Regular(fontsize: AppSize.s30),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              mainAxisSpacing: AppPadding.p10,
              crossAxisSpacing: AppPadding.p10,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(AppPadding.p10),
                child: InkWell(
                  onTap: () {
                    Get.to(ProductDetailsScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s18),
                      color: ColorManager.primary1Color,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  AssetsManager.nullImage,
                                  width: AppSize.s100,
                                  height: AppSize.s100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: SizedBox(
                                  height: AppSize.s24,
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        radius: AppSize.s30,
                                        backgroundColor:
                                            ColorManager.firstColor,
                                        child: Icon(
                                          Icons.add,
                                          color: ColorManager.whiteColor,
                                          size: AppSize.s16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p10,
                              right: AppPadding.p10,
                              top: AppPadding.p10),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Price \n",
                                    style: StyleManager.body01_Semibold(
                                      color: ColorManager.blackColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Product Name",
                                    style: StyleManager.label_Regular(
                                      color: ColorManager.primary6Color,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n category",
                                    style: StyleManager.label_Regular(
                                      color: ColorManager.primary5Color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: AppSizeScreen.screenHeight / 7,
          ),
        ],
      ),
    ));
  }
}
