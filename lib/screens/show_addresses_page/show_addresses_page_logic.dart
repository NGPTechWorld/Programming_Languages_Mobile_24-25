import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/services/connection/network_info.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/locations_repositories.dart';
import 'package:ngpiteapp/screens/add_address_page/add_address_page.dart';
import 'package:ngpiteapp/screens/add_address_page/add_address_page_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';

class ShowAddressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShowAddressesController());
  }
}

class ShowAddressesController extends GetxController {
  final locationsRepo = Get.find<ImpLocationsRepositories>();
 
  var loadingState = LoadingState.idle.obs;
  RxList addresses = [].obs;
  void getAddresses(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await locationsRepo.getLocations();
    if (response.success) {
      addresses.clear();
      addresses.addAll(response.data);
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  void addAddress(BuildContext context) async {
    await Get.to(() => AddAddressPage(), binding: AddAddressPageBinding());
    getAddresses(context);
  }

  void deleteAddress(int index, BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response =
        await locationsRepo.deleteLocation(idLocation: addresses[index].id);
    if (response.success) {
      addresses.removeAt(index);
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }
}
