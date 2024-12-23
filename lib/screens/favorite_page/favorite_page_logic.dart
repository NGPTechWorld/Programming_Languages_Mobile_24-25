import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page.dart';

class FavoritePageController extends GetxController {
  final indexCategorySelected = 0.obs;
  final productRepo = Get.find<ImpProductsRepositories>();

  final int perPage = 3;
  var isLoadingFirst = true.obs;
  final productsPagingController = PagingController<int, dynamic>(
    firstPageKey: 1,
    invisibleItemsThreshold: 1,
  );

  var h200 = 200.0.obs;

  var isLoadingProducts = false;

  inital(BuildContext context) async {
    productsPagingController.itemList = null;
    productsPagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    isLoadingFirst.value = false;
  }

  Future<void> fetchPage(int pageKey) async {
    isLoadingProducts = true;
    try {
      final newPage = await productRepo.getFavoriteProducts(
        page: pageKey,
        perPage: perPage,
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
    isLoadingProducts = false;
  }

  void refresh() {
    productsPagingController.itemList = null;
    productsPagingController.refresh();
  }

  goToProductDetails(int id) {
    Get.to(ProductDetailsPage(id));
  }
}
