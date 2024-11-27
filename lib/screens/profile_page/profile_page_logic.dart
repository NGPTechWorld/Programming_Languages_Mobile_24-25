
import 'package:get/get.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilePageController());
  }
}

class ProfilePageController extends GetxController {
  
  
  myAccountOnTap() {}
  trackOrderOnTap() {}
  loactionOnTap() {}
  orderHistoryOnTap() {}
  languageOnTap() {}
  helpOnTap() {}
  String getName() {return "TempName";}
}
