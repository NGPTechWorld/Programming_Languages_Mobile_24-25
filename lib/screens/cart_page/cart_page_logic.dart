import 'package:get/get.dart';

class CartPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartPageController());
  }
}

class CartPageController extends GetxController {
  nextCart() {}
}
