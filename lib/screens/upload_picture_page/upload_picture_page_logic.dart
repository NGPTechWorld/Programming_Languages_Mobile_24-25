import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadPicturePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UploadPicturePageController());
  }
}

class UploadPicturePageController extends GetxController {
  File? imageProfile;
  final picker = ImagePicker();
  upload() {}
  choosePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageProfile = File(pickedFile.path);
      update();
    }
  }
}
