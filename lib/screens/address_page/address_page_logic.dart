import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  save() {
    Get.to(ProfilePictureUpload(), binding: UploadPicturePageBinding());
  }
}
