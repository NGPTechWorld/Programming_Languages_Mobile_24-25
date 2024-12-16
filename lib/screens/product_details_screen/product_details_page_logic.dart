import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/data/entities/category_entities.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/module/product_model.dart';
import 'package:ngpiteapp/data/repositories/category_repositoris.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';

class ProductDetailsPageindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailsPageController());
  }
}

class ProductDetailsPageController extends GetxController {
  final productRepo = Get.find<ImpProductsRepositories>();
  ProductModel? product;
  var loadingState = LoadingState.idle.obs;
  int currentPage = 1;

  getProduct(BuildContext context, int id) async {
    loadingState.value = LoadingState.loading;
    final response = await productRepo.getProduct(id: id.toString());
    if (response.success) {
      if (response.data[ApiKey.message] == "successfully get product") {
        product = ProductModel.fromMap(response.data["product"]);
        loadingState.value = LoadingState.doneWithData;
        print(response.data);
      } else {}
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }
}
