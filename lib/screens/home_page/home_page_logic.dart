import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/data/entities/markets_card.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/carts_repositoris.dart';
import 'package:ngpiteapp/data/repositories/markets_repositories.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}

class HomePageController extends GetxController {
  final productRepo = Get.find<ImpProductsRepositories>();
  final marketRepo = Get.find<ImpMarketsRepositories>();
  final cartRepo = Get.find<ImpCartsRepositories>();

  final productsPagingController = PagingController<int, ProductsCardEntite>(
    firstPageKey: 1,
    invisibleItemsThreshold: 2,
  );
  final marketsPagingController = PagingController<int, MarketsCard>(
    firstPageKey: 1,
    invisibleItemsThreshold: 1,
  );
  var loadingStateProducts = LoadingState.idle.obs;
  var loadingStateMarkets = LoadingState.idle.obs;
  int currentPage = 1;

  var productsPerPage = 4;
  var marketsPerPage = 4;

  // var isLoadingFirstProducts = true.obs;
  var isLoadingFirstMarkets = true.obs;
  onInit() async {
    productsPagingController.itemList = null;
    productsPagingController.addPageRequestListener((pageKey) {
      getProducts(pageKey);
    });

    marketsPagingController.itemList = null;
    marketsPagingController.addPageRequestListener((pageKey) {
      getMarkets(pageKey);
    });
    isLoadingFirstMarkets.value = false;
    productsPagingController.refresh();
    super.onInit();
  }

  getProducts(int pageKey) async {
    loadingStateProducts.value = LoadingState.loading;
    if (pageKey < productsPagingController.nextPageKey!) {
      productsPagingController.refresh();
      return;
    }
    try {
      final newPage = await productRepo.getProducts(
          page: pageKey, perPage: productsPerPage);
      print('Fetching page: $pageKey');
      final isLastPage =
          newPage.data.isEmpty || newPage.data.length < productsPerPage;
      if (isLastPage) {
        productsPagingController.appendLastPage(newPage.data);
      } else {
        final nextPageKey = pageKey + 1;
        productsPagingController.appendPage(newPage.data, nextPageKey);
      }
    } catch (error) {
      productsPagingController.error = error;
    }
    loadingStateProducts.value = LoadingState.doneWithData;
  }

  getMarkets(int pageKey) async {
    loadingStateMarkets.value = LoadingState.loading;

    try {
      print('Fetching page: $pageKey');
      final newPage =
          await marketRepo.getMarkets(page: pageKey, perPage: marketsPerPage);
      final isLastPage =
          newPage.data.isEmpty || newPage.data.length < productsPerPage;
      if (isLastPage) {
        marketsPagingController.appendLastPage(newPage.data);
      } else {
        final nextPageKey = pageKey + 1;
        marketsPagingController.appendPage(newPage.data, nextPageKey);
      }
    } catch (error) {
      marketsPagingController.error = error;
    }
    loadingStateMarkets.value = LoadingState.doneWithData;
  }

  goToCart() {
    Get.to(() => CartPage(), binding: CartPageBindings());
  }

  addToCart(BuildContext context, int index) async {
    final response = await cartRepo.addProduct(
        id: productsPagingController.itemList![index].id, count: 1);
    if (response.success) {
      SnackBarCustom.show(context, response.data);
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
    }
  }
}
