import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  save(){}
}
