import 'package:get/get.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page.dart';
import 'package:ngpiteapp/screens/order_details_page/order_details_page_logic.dart';

class OrdersHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersHistoryPageController());
  }
}

class Order {
  final String date;
  final String status;
  final int price;
  final int id;

  Order(
      {required this.date,
      required this.status,
      required this.price,
      required this.id});
}

class OrdersHistoryPageController extends GetxController {
  var isSucceededSelected = true.obs;

  // Fake orders
  final succeededOrders = [
    Order(
      price: 12,
      date: '5/12/2024',
      id: 1,
      status: 'Success',
    ),
    Order(
      price: 15,
      date: '4/12/2024',
      id: 2,
      status: 'Success',
    )
  ].obs;

  final incompletedOrders = [
    Order(
      price: 150,
      date: '3/12/2024',
      id: 3,
      status: 'Failed',
    ),
    Order(
      price: 78,
      date: '2/12/2024',
      id: 4,
      status: 'Failed',
    ),
  ].obs;

  List<Order> get orders =>
      isSucceededSelected.value ? succeededOrders : incompletedOrders;

  void onTap(int id) {
    Get.to(() => OrderDetailsPage(id: id), binding: OrderDetailsBinding());
  }
}
