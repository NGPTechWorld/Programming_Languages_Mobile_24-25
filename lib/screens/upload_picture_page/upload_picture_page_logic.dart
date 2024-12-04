import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/users_repositories.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_custom.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_logic.dart';
import 'package:ngpiteapp/screens/custom_widgets/snack_bar_error.dart';

class UploadPicturePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UploadPicturePageController());
  }
}

class UploadPicturePageController extends GetxController {
  File? imageProfile;
  final picker = ImagePicker();
  var loadingState = LoadingState.idle.obs;
  final AuthRepositories = Get.find<ImpUsersRepositories>();

  upload() {
    Get.offAll(CurvedNavigationBarCustom(),
        binding: CurvedNavigationBarBinding());
  }

  uploadPicture(BuildContext context) async {
    if (imageProfile == null) {
      Get.snackbar('Error', 'Please select an image first');
      return;
    }
    String fileName = imageProfile!.path.split('/').last;
    Dio.FormData formData = Dio.FormData.fromMap({
      "image": await Dio.MultipartFile.fromFile(
        imageProfile!.path,
        filename: fileName,
      ),
    });
    loadingState.value = LoadingState.loading;
    final response = await AuthRepositories.uploadImage(image: formData);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.loginSuccess.tr);
      loadingState.value = LoadingState.doneWithData;
      Get.off(CurvedNavigationBarCustom(),
          binding: CurvedNavigationBarBinding());
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  choosePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageProfile = File(pickedFile.path);
      update();
    }
  }
}
