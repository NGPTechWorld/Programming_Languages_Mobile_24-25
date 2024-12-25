import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/data/entities/markets_card.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/carts_repositoris.dart';
import 'package:ngpiteapp/data/repositories/category_repositoris.dart';
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
  final categoryRepo = Get.find<ImpCategoryRepositories>();
  final productsPagingController = PagingController<int, ProductsCardEntite>(
    firstPageKey: 1,
    invisibleItemsThreshold: 2,
  );
  final marketsPagingController = PagingController<int, MarketsCard>(
    firstPageKey: 1,
    invisibleItemsThreshold: 1,
  );
  var h200 = 200.0.obs;

  final markets = [].obs;
  var loadingStateProducts = LoadingState.idle.obs;
  var loadingStateMarkets = LoadingState.idle.obs;
  int currentPage = 1;

  var perPage = 3;

  final cartRepo = Get.find<ImpCartsRepositories>();

  var isLoadingFirstProducts = true.obs;
  var isLoadingFirstMarkets = true.obs;

  initalProducts() async {
    productsPagingController.addPageRequestListener((pageKey) {
      getProducts(pageKey);
    });
    isLoadingFirstProducts.value = false;
  }

  initalMarkets() async {
    productsPagingController.addPageRequestListener((pageKey) {
      // getMarkets(pageKey);
    });
    isLoadingFirstMarkets.value = false;
  }

  getProducts(int pageKey) async {
    loadingStateProducts.value = LoadingState.loading;

    try {
      final newPage =
          await productRepo.getProducts(page: pageKey, perPage: perPage);
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
    loadingStateProducts.value = LoadingState.doneWithData;
  }

  String getCategoryforProducts(int id) {
    return "";
  }

  getMarkets(BuildContext context) async {
    loadingStateMarkets.value = LoadingState.loading;
    final response = await marketRepo.getMarkets(page: 1, perPage: 10);
    if (response.success) {
      if (response.data[ApiKey.message] == "successfully get markets") {
        final jsonList =
            response.data["markets"]["currentPageItems"] as List<dynamic>;
        markets
            .addAll(jsonList.map((json) => MarketsCard.fromMap(json)).toList());
        loadingStateMarkets.value = LoadingState.doneWithData;
        print(response.data);
      } else {}
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingStateMarkets.value = LoadingState.hasError;
    }
  }

  goToCart() {
    Get.to(CartPage(), binding: CartPageBindings());
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
