import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

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
              StringManager.storeText,
              style: StyleManager.body01_Regular(fontsize: AppSize.s30),
            ),
            SizedBox(
                height: AppSizeScreen.screenHeight / 6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p4),
                        child: Container(
                          height: AppSizeWidget.cardSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s16),
                            color: ColorManager.secoundColor,
                          ),
                          child: Row(
                            children: [
                              Image.asset(AssetsManager.nullImage),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: AppSizeScreen.screenWidth * 0.5),
                                padding: const EdgeInsets.all(AppPadding.p10),
                                child: RichText(
                                    text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Store Name",
                                        style: StyleManager.h2_Medium(
                                            color: ColorManager.primary1Color)),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
