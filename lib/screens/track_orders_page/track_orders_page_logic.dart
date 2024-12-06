import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_service_getstorage.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';

class TrackOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrackOrdersPageController());
  }
}

class FakeProduct {
  final String name;
  final String price;

  FakeProduct({required this.name, required this.price});
}

class Order {
  final String status;
  final int id;
  final String date;
  final String address;
  final double totalPrice;
  final List<Market> markets;

  Order(
      {required this.status,
      required this.id,
      required this.date,
      required this.address,
      required this.totalPrice,
      required this.markets});
}

class Market {
  final String name;
  final List<Product> products;

  Market({required this.name, required this.products});
}

class Product {
  final String name;
  final int count;
  final int unitPrice;
  final int totalPrice;

  Product(
      {required this.name,
      required this.count,
      required this.unitPrice,
      required this.totalPrice});
}

class TrackOrdersPageController extends GetxController {
  var isCurrentSelected = true.obs;
  RxList<Order> orders = [
    Order(
        status: 'Success',
        id: 1,
        date: '20022002',
        address: 'address',
        totalPrice: 1000,
        markets: [
          Market(name: 'First', products: [
            Product(name: 'namedsa;fl;asjd;fljasl;dfj;lasdkjf;ljsadlfjl;askj', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
          ]),
          Market(name: 'Second', products: [
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
            Product(name: 'name', count: 2, unitPrice: 25, totalPrice: 50),
          ]),
        ])
  ].obs;

  List getOrders() {
    return orders;
  }

  void onTap(int index) {
    // TODO :Show Order Details
    Get.to(() => OrderDetailsPage(id: orders[index].id) , binding: OrderDetailsBinding());
  }

  handleMenuSelection(String value, int index) {
    switch (value) {
      case StringManager.trackOrdersMenuEditValue:
        editOrder(index);
        break;
      case StringManager.trackOrdersMenuCancelValue:
        cancelOrder(index);
        break;
    }
  }

  void cancelOrder(int index) {}

  void editOrder(int index) {}
}
