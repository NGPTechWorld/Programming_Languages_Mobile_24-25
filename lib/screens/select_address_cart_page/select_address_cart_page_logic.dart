import 'package:get/get.dart';

class SelectAddressCartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectAddressCartPageControlle());
  }
}

class SelectAddressCartPageControlle extends GetxController {
  final indexCurrent = 0.obs;
}
