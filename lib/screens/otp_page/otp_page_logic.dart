
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:ngpiteapp/data/enums/app_state_enum.dart';
import 'package:ngpiteapp/data/repositories/auth_repositories.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';

class OtpPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpPageController());
  }
}

class OtpPageController extends GetxController {
   late TextEditingController textEditingController  = Get.put(TextEditingController());
   var x = 0.obs;
  
}
