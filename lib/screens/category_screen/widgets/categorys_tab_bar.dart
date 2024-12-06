import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_screen/category_screen_logic.dart';

// ignore: must_be_immutable
class CategorysTabBar extends GetView<CategoryScreenController> {
  CategorysTabBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: AppPadding.p10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSizeWidget.tabSize,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CategoryCard(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends GetView<CategoryScreenController> {
  const CategoryCard({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: InkWell(
          onTap: () {
            controller.indexCategorySelected.value = index;
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            decoration: BoxDecoration(
              border: Border.all(
                color: index == controller.indexCategorySelected.value
                    ? ColorManager.whiteColor
                    : ColorManager.primary4Color,
              ),
              borderRadius: BorderRadius.circular(AppSize.s20),
              color: index == controller.indexCategorySelected.value
                  ? ColorManager.secoundDarkColor
                  : ColorManager.whiteColor,
            ),
            child: Center(
              child: Text(
                "name",
                style: StyleManager.body02_Semibold(
                    color: index == controller.indexCategorySelected.value
                        ? ColorManager.whiteColor
                        : ColorManager.primary5Color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
