import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';
import 'package:ngpiteapp/screens/category_page/widgets/category_product_card.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page.dart';

class CategorysProducts extends GetView<CategoryPageController> {
  const CategorysProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p10),
        child: Obx(
          () => Column(
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
                itemCount: controller.currentProducts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(ProductDetailsPage(1));
                    },
                    child: CategoryProductCard(index: index),
                  );
                },
              ),
              SizedBox(
                height: AppSizeScreen.screenHeight * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
