import 'package:get/get.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailsPageController());
  }
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

class OrderDetailsPageController extends GetxController {
  late Order order;

  void requestOrderData(int id) {
    order = order = Order(
        status: 'Success',
        id: id,
        date: '12/5/2024',
        address: 'وهي عنوان طويل مشان نعيمي يتفاجئ لما يجي يقلي زبطها بحيث ينزل سطر قله اصلا زبطتها',
        totalPrice: 1000,
        markets: [
          Market(name: 'First', products: [
            Product(
                name: 'وهي اسم طويل شوي مشان نعيمي يروق',
                count: 2,
                unitPrice: 25,
                totalPrice: 50),
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
        ]);
  }
}
