import 'package:get/get.dart';

class ProductsMarketPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsMarketPageController());
  }
}

class ProductsMarketPageController extends GetxController {
  int index = 0;
}
