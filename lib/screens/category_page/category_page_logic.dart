import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/services/connection/network_info.dart';
import 'package:ngpiteapp/data/repositories/category_repositoris.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';

class CategoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryPageController());
  }
}

class CategoryPageController extends GetxController {
  final indexCategorySelected = 0.obs;
  final categories = [].obs;
  final currentProducts = [].obs;
  final categoriesRepo = Get.find<ImpCategoryRepositories>();
  final productRepo = Get.find<ImpProductsRepositories>();
  final netCheck = Get.find<NetworkInfoImpl>();
  int page = 1;
  getCategories(BuildContext context) async {
    if (await netCheck.isConnected) {
      final response = await categoriesRepo.getAllCategories();
      if (response.success) {
        categories.clear();
        categories.addAll(response.data);
      } else {
        SnackBarCustom.show(context, response.networkFailure!.message);
      }
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
    }
  }

  getProductsForCategory(int index, BuildContext context) async {

    if (await netCheck.isConnected) {
      final response = await productRepo.getProductsByCategory(
        page: page,
        perPage: 10,
        categoryID: categories[index].id,
      );
      if (response.success) {
        currentProducts.clear();
        currentProducts.addAll(response.data);
        page++;
      } else {
        SnackBarCustom.show(context, response.networkFailure!.message);
      }
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
    }
  }
}
