import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/locations_repositories.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';
import 'package:ngpiteapp/screens/upload_picture_page/upload_picture_page.dart';
import 'package:ngpiteapp/screens/upload_picture_page/upload_picture_page_logic.dart';

class AddressPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddressPageController());
  }
}

class AddressPageController extends GetxController {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final streetController = TextEditingController();
  final notesController = TextEditingController();
  final locationsRepo = Get.find<ImpLocationsRepositories>();
  var loadingState = LoadingState.idle.obs;

  addLocation(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await locationsRepo.addLocation(
        name: nameController.text,
        location: addressController.text,
        street: streetController.text,
        notes: notesController.text);
    if (response.success) {
      SnackBarCustom.show(context, response.data);
      loadingState.value = LoadingState.doneWithData;
      Get.off(ProfilePictureUpload(), binding: UploadPicturePageBinding());
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }
}
