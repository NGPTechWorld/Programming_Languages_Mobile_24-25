
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
