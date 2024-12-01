
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilePageController());
  }
}

class ProfilePageController extends GetxController {
  
  
  myAccountOnTap() {
    Get.to(() =>MyAccountPage() , binding: MyAccountBinding());
  }
  trackOrderOnTap() {}
  loactionOnTap() {}
  orderHistoryOnTap() {}
  languageOnTap() {}
  helpOnTap() {}
  String getName() {return "TempName";}
}
