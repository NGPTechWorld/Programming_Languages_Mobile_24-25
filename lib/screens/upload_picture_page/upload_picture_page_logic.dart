import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_custom.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_logic.dart';

class UploadPicturePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UploadPicturePageController());
  }
}

class UploadPicturePageController extends GetxController {
  File? imageProfile;
  final picker = ImagePicker();
  upload() {
    Get.offAll(CurvedNavigationBarCustom(),
        binding: CurvedNavigationBarBinding());
  }

  choosePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageProfile = File(pickedFile.path);
      update();
    }
  }
}
