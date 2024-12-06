import 'package:get/get.dart';
import 'package:ngpiteapp/screens/track_orders_page/track_orders_page_logic.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailsPageController());
  }
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
        ]);
  }
}
