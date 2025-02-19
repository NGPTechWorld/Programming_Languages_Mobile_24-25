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
          child: MaterialButton(
            onPressed: () {
              if (controller.isLoadingProducts) return;
              controller.indexCategorySelected.value = index;
              controller.productsPagingController.refresh();
            },
            color: index == controller.indexCategorySelected.value
                ? ColorManager.secoundDarkColor
                : ColorManager.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s20),
                side: BorderSide(
                  color: index == controller.indexCategorySelected.value
                      ? ColorManager.whiteColor
                      : ColorManager.primary4Color,
                  width: AppSize.s2,
                )),
            elevation: 0,
            child: Text(
              categoryName,
              style: StyleManager.body02_Semibold(
                  color: index == controller.indexCategorySelected.value
                      ? ColorManager.whiteColor
                      : ColorManager.primary5Color),
            ),
          )),
    );
  }
}
