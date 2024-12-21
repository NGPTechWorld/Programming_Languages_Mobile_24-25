import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
  final categoriesRepo = Get.find<ImpCategoryRepositories>();
  final productRepo = Get.find<ImpProductsRepositories>();
  final netCheck = Get.find<NetworkInfoImpl>();

  final int perPage = 3;
  var isLoadingCategories = false.obs;
  final productsPagingController = PagingController<int, dynamic>(
    firstPageKey: 1,
  );

  inital(BuildContext context) async {
    productsPagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    getCategories(context);
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newPage = await productRepo.getProductsByCategory(
        page: pageKey,
        perPage: perPage,
        categoryID: categories[indexCategorySelected.value].id,
      );
      print('Fetching page: $pageKey');
      final isLastPage = newPage.data.isEmpty || newPage.data.length < perPage;
      if (isLastPage) {
        productsPagingController.appendLastPage(newPage.data);
      } else {
        final nextPageKey = pageKey + 1;
        productsPagingController.appendPage(newPage.data, nextPageKey);
      }
    } catch (error) {
      productsPagingController.error = error;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCategories(BuildContext context) async {
    if (await netCheck.isConnected) {
      isLoadingCategories.value = true;
      final response = await categoriesRepo.getAllCategories();
      if (response.success) {
        categories.clear();
        categories.addAll(response.data);
        await fetchPage(0);
      } else {
        SnackBarCustom.show(context, response.networkFailure!.message);
      }
      isLoadingCategories.value = false;
    } else {
      SnackBarCustom.show(context, StringManager.nointernet.tr);
    }
  }
}
