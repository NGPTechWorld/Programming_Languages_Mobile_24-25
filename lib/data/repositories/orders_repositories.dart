import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';
import 'package:ngpiteapp/data/entities/order_card_entitie.dart';
import 'package:ngpiteapp/data/entities/order_details_entite.dart';

abstract class OrdersRepositories {
  Future<AppResponse> getOrdersByStatus({required int status}); // could be enum
  Future<AppResponse> getOrder({required int id}); // could be enum
  Future<AppResponse> getOrders();
  Future<AppResponse> createOrder({required int id});

  Future<AppResponse> deleteProduct(
      {required int orderId, required int productId});
  Future<AppResponse> cancelOrder({required int id});
  Future<AppResponse> editOrder({required int id});
}

class ImpOrdersRepositories implements OrdersRepositories {
  final ApiServices api;

  ImpOrdersRepositories({required this.api});

  @override
  Future<AppResponse> getOrdersByStatus({required int status}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getOrdersByStatus + status.toString(),
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
    final Map<String, dynamic> decodedJson = jsonDecode(jsonString);

    final List<dynamic> ordersJson = decodedJson[ApiKey.orders];

    return ordersJson
        .map((orderMap) =>
            OrderCardEntite.fromMap(orderMap as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<AppResponse> getOrders() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getOrders, method: Method.get, requiredToken: true);

      response.data = parseOrders(response.data.toString());
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getOrder({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getOrder + id.toString(),
          method: Method.get,
          requiredToken: true);
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = OrderDetailsEntite.fromMap(data);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> cancelOrder({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.cancelOrder + id.toString(),
          method: Method.put,
          requiredToken: true);
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> editOrder({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.editOrder,
          method: Method.put,
          requiredToken: true,
          params: {ApiKey.location_id: id});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> createOrder({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      final date = DateTime.now().toString().substring(0, 10);
      response.data = await api.request(
          url: EndPoints.createOrder,
          method: Method.post,
          requiredToken: true,
          params: {ApiKey.location_id: id, ApiKey.date: date});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> deleteProduct(
      {required int orderId, required int productId}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.deleteProduct + '/$orderId/$productId',
        method: Method.put,
        requiredToken: true,
      );
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
