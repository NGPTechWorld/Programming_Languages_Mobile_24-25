import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/carts_repositoris.dart';
import 'package:ngpiteapp/screens/cart_page/widgets/delete_dialog_buttons.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/select_address_cart_page.dart';
import 'package:ngpiteapp/screens/select_address_cart_page/select_address_cart_page_logic.dart';

class CartPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartPageController());
  }
}

class CartPageController extends GetxController {
  final products = [].obs;
  final cartRepo = Get.find<ImpCartsRepositories>();
  final totalCost = 0.obs;
  final totalCount = 0.obs;
  var loadingState = LoadingState.idle.obs;

  var deleteState = LoadingState.idle.obs;
  goToChooseAddress() async {
   final res =await Get.to(() => SelectAddressCartPage(),
        binding: SelectAddressCartPageBinding(totalCost: totalCost.value)) ?? false;
   print(res);
    if(res){
      products.clear();
    }
  }

  deleteDialog(int index) async {
    await Get.dialog(
      AlertDialog(
        title: Text(StringManager.cartDialogTitle.tr),
        content: Text(StringManager.cartDialogContent.tr),
        actions: [
          DeleteDialogButtons(
            cancelText: StringManager.cartCancel.tr,
            okText: StringManager.cartDelete.tr,
            onCancel: () {
              Get.back();
            },
            onOk: () {
              deleteProduct(index);
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  deleteProduct(int index) async {
    deleteState.value = LoadingState.loading;
    final response = await cartRepo.deleteProduct(id: products[index].id);
    if (response.success) {
      totalCost.value -= products[index].total_cost as int;
      products.removeAt(index);
      deleteState.value = LoadingState.doneWithNoData;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  addOne(int index) async {
    final response = await cartRepo.plusProductOne(id: products[index].id);
    if (response.success) {
      products[index].count++;
      products[index].total_cost += products[index].price;
      totalCost.value += products[index].price as int;
      products[index] = products[index];
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  subOne(int index) async {
    final response = await cartRepo.minusProductOne(id: products[index].id);
    if (response.success) {
      products[index].count--;
      products[index].total_cost -= products[index].price;
      totalCost.value -= products[index].price as int;
      products[index] = products[index];
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  getCart() async {
    final response = await cartRepo.getCart();
    loadingState.value = LoadingState.loading;
    if (response.success) {
      loadingState.value = LoadingState.doneWithData;
      products.clear();
      products.addAll(response.data.products);
      totalCost.value = response.data.total_cost;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }
}
