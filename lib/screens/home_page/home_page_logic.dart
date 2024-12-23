import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/data/entities/markets_card.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/category_repositoris.dart';
import 'package:ngpiteapp/data/repositories/markets_repositories.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}

class HomePageController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final productRepo = Get.find<ImpProductsRepositories>();
  final marketRepo = Get.find<ImpMarketsRepositories>();
  final categoryRepo = Get.find<ImpCategoryRepositories>();
  List<ProductsCardEntite> products = [];
  List<MarketsCard> markets = [];
  var loadingStateProducts = LoadingState.idle.obs;
  var loadingStateMarkets = LoadingState.idle.obs;
  int currentPage = 1;

  getProducts(BuildContext context) async {
    loadingStateProducts.value = LoadingState.loading;
    final response = await productRepo.getProducts(
        page: currentPage.toString(), perPage: "10");
    if (response.success) {
      currentPage++;
      if (response.data[ApiKey.message] == "successfully get products") {
        final jsonList =
            response.data["products"]["currentPageItems"] as List<dynamic>;
        products.addAll(
            jsonList.map((json) => ProductsCardEntite.fromMap(json)).toList());
        loadingStateProducts.value = LoadingState.doneWithData;
        print(response.data);
      } else {}
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingStateProducts.value = LoadingState.hasError;
    }
  }

  String getCategoryforProducts(int id) {
    return "";
  }

  getMarkets(BuildContext context) async {
    loadingStateMarkets.value = LoadingState.loading;
    final response = await marketRepo.getMarkets(page: "1", prePage: "10");
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
    Get.to(CartPage());
  }
}
