import 'package:get/get.dart';
import 'package:ngpiteapp/data/entities/cart_entitie.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/carts_repositoris.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';

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
