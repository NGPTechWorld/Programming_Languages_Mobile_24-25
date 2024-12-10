import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';
import 'package:ngpiteapp/data/entities/order_card_entite.dart';

abstract class OrdersRepositories {
  Future<AppResponse> getOrdersByStatus({required int status}); // could be enum
}

class ImpOrdersRepositories implements OrdersRepositories {
  final ApiServices api;

  ImpOrdersRepositories({required this.api});

  @override
  Future<AppResponse> getOrdersByStatus({required int status}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl +
              EndPoints.getOrdersByStatus +
              status.toString(),
          method: Method.get,
          requiredToken: true);

      response.data = parseOrders(response.data.toString());
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  List<OrderCardEntite> parseOrders(String jsonString) {
    final Map<String, dynamic> decodedJson = json.decode(jsonString);

    final List<dynamic> ordersJson = decodedJson[ApiKey.orders];

    return ordersJson
        .map((orderMap) =>
            OrderCardEntite.fromMap(orderMap as Map<String, dynamic>))
        .toList();
  }
}
