import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class OrdersHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersHistoryPageController());
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

class OrdersHistoryPageController extends GetxController {
  var isCurrentSelected = true.obs;

  // Fake orders
  final succeededOrders = [
    FakeOrder(
        price: '\$12.00',
        date: '5/12/2024',
        id: '#1',
        status: 'Success',
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
        status: 'Failed',
        products: []),
    FakeOrder(
        price: '\$10.00',
        date: '2/12/2024',
        id: '#4',
        status: 'Failed',
        products: []),
  ].obs;

  List<FakeOrder> get orders =>
      isCurrentSelected.value ? succeededOrders : pastOrders;

  void onTap() {
    // TODO :Show Order Details
  }
}
