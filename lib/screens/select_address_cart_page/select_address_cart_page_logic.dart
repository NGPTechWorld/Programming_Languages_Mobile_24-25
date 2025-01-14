// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';

import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/locations_repositories.dart';
import 'package:ngpiteapp/data/repositories/orders_repositories.dart';
import 'package:ngpiteapp/screens/add_address_page/add_address_page.dart';
import 'package:ngpiteapp/screens/add_address_page/add_address_page_logic.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class SelectAddressCartPageBinding extends Bindings {
  final int totalCost;

  SelectAddressCartPageBinding({required this.totalCost});
  @override
  void dependencies() {
    Get.put(SelectAddressCartPageController(totalCost: totalCost));
  }
}

class SelectAddressCartPageController extends GetxController {
  final currentIndex = 0.obs;
  final locationsRepo = Get.find<ImpLocationsRepositories>();
  final ordersRepo = Get.find<ImpOrdersRepositories>();

  var loadingState = LoadingState.idle.obs;
  var loadingCostState = LoadingState.idle.obs;
  RxList addresses = [].obs;
  int totalCost;
  var deleviryPrice = 0.obs;
  SelectAddressCartPageController({
    required this.totalCost,
  });
  @override
  void onInit() async {
    await getAddresses();
    getCost();
    super.onInit();
  }

  getAddresses() async {
    loadingState.value = LoadingState.loading;
    final response = await locationsRepo.getLocations();
    if (response.success) {
      addresses.clear();
      addresses.addAll(response.data);
      loadingState.value = LoadingState.doneWithData;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  void getCost() async {
    loadingCostState.value = LoadingState.loading;
    Future.delayed(Duration(seconds: 3));
    final response =
        await locationsRepo.cost(id: addresses[currentIndex.value].id);
    if (response.success) {
      deleviryPrice.value = response.data;
      loadingCostState.value = LoadingState.doneWithData;
    } else {
      loadingCostState.value = LoadingState.hasError;
    }
  }

  createOrder() async {
    final response =
        await ordersRepo.createOrder(id: addresses[currentIndex.value].id);
    if (response.success) {
      Get.back();
      Get.off(TrackOrdersPage(), binding: TrackOrdersBinding());
    } else {
      // Get.snackbar(StringManager.strDefaultError, message)
    }
  }

  goToAddAddressPage() async {
    await Get.to(AddAddressPage(), binding: AddAddressPageBinding());
    await getAddresses();
    getCost();
  }
}
