
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';

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

class FakeOrder {
  final String date;
  final String status;
  final String price;
  final List<FakeProduct> products;
  final String id;

  FakeOrder(
      {required this.date,
      required this.status,
      required this.price,
      required this.products,
      required this.id});
}

class TrackOrdersPageController extends GetxController {
  var isCurrentSelected = true.obs;

  // Fake orders
  final succeededOrders = [
    FakeOrder(
        price: '\$12.00',
        date: '5/12/2024',
        id: '#1',
        status: 'Pending',
        products: []),
    FakeOrder(
        price: '\$11.50',
        date: '4/12/2024',
        id: '#2',
        status: 'Success',
        products: [])
  ].obs;

  final pastOrders = [
    FakeOrder(
        price: '\$15.90',
        date: '3/12/2024',
        id: '#3',
        status: 'Pending',
        products: []),
    FakeOrder(
        price: '\$10.00',
        date: '2/12/2024',
        id: '#4',
        status: 'On The Way',
        products: []),
  ].obs;

  List<FakeOrder> get orders {
    List<FakeOrder> orders = [];
    orders.addAll(succeededOrders);
    orders.addAll(pastOrders);
    return orders;
  }

  void onTap() {
    // TODO :Show Order Details
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

  void cancelOrder(int index) {
    print("###################################################");
    print("Canceled");
    print("###################################################");
  }

  void editOrder(int index) {
    print("###################################################");
    print("Edited");
    print("###################################################");
  }
}
