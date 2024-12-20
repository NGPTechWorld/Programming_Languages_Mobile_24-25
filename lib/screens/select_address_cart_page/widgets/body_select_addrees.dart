import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/select_address_cart_page_logic.dart';

class BodySelectAddrees extends StatelessWidget {
  const BodySelectAddrees({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizeScreen.screenHeight / 18,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p24),
          child: Text(
            "Select Your Location",
            style: StyleManager.body01_Regular(color: ColorManager.blackColor),
          ),
        ),
        Column(
          children: List.generate(
            3,
            (index) => address_card(index: index),
          ),
        ),
      ],
    );
  }
}

class address_card extends GetView<SelectAddressCartPageControlle> {
  const address_card({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24, vertical: AppPadding.p10),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12),
            border: Border.all(
                width: 2,
                color: controller.indexCurrent == index
                    ? ColorManager.firstDarkColor
                    : ColorManager.primary2Color),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "name",
                      style: StyleManager.body02_Regular(),
                    ),
                    Text(
                      "location",
                      style: StyleManager.body02_Semibold(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.indexCurrent == index
                        ? CircleAvatar(
                            radius: AppSize.s12,
                            backgroundColor: ColorManager.firstDarkColor,
                            child: Icon(
                              Icons.check,
                              color: ColorManager.whiteColor,
                              size: AppSize.s16,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
