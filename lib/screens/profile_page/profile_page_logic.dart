import 'package:get/get.dart';
import 'package:ngpiteapp/screens/custom_widgets/helper_widget.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page.dart';
import 'package:ngpiteapp/screens/my_account_page/my_account_page_logic.dart';
import 'package:ngpiteapp/screens/orders_history_page/orders_history_page.dart';
import 'package:ngpiteapp/screens/orders_history_page/orders_history_page_logic.dart';
import 'package:ngpiteapp/screens/show_addresses_page/show_addresses_page.dart';
import 'package:ngpiteapp/screens/show_addresses_page/show_addresses_page_logic.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilePageController());
  }
}

class ProfilePageController extends GetxController {
  myAccountOnTap() {
    Get.to(() => MyAccountPage(), binding: MyAccountBinding());
  }

  trackOrderOnTap() {
    Get.to(() => TrackOrdersPage(), binding: TrackOrdersBinding());

  }
  addressesOnTap() {
    Get.to(() => ShowAddressesPage(), binding: ShowAddressesBinding());
  }

  orderHistoryOnTap() {
    Get.to(() => OrdersHistoryPage(), binding: OrdersHistoryBinding());
  }

  languageOnTap() {
    HelperWidget.languageDialgo();
  }

  helpOnTap() {}
  String getName() {
    return "TempName";
  }
}
