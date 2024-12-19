import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';

class CategoryCard extends GetView<CategoryPageController> {
  const CategoryCard({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    final categoryName = controller.categories[index].name;
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: InkWell(
          onTap: () {
            controller.indexCategorySelected.value = index;
            controller.getProductsForCategory(index, context);
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
                categoryName,
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
