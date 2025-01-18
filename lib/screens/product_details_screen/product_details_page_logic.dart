import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/module/product_model.dart';
import 'package:ngpiteapp/data/repositories/carts_repositoris.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';

class ProductDetailsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailsPageController());
  }
}

class ProductDetailsPageController extends GetxController {
  final productRepo = Get.find<ImpProductsRepositories>();
  final cartRepo = Get.find<ImpCartsRepositories>();
  ProductEntitie? product;
  var loadingState = LoadingState.idle.obs;
  int currentPage = 1;
  final isFavorite = false.obs;
  var count = 1.obs;
  getProduct(BuildContext context, int id) async {
    loadingState.value = LoadingState.loading;
    final response = await productRepo.getProduct(id: id.toString());
    if (response.success) {
      product = response.data.product;
      isFavorite.value = response.data.isFavorite;
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  addOne() async {
    count++;
  }

  subOne() async {
    count--;
  }

  toggleFavorite(BuildContext context) async {
    final response =
        await productRepo.toggleFavorite(id: product!.id.toString());
    if (response.success) {
      SnackBarCustom.show(context, response.data);
      isFavorite.value = !isFavorite.value;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
    }
  }

  addToCart(BuildContext context) async {
    final response =
        await cartRepo.addProduct(id: product!.id, count: count.value);
    if (response.success) {
      await Future.sync(() => SnackBarCustom.show(context, response.data));
      Get.back();
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
    }
  }

  goToCart(BuildContext context) async {
    await addToCart(context);
    Get.to(CartPage(), binding: CartPageBindings());
  }
}
