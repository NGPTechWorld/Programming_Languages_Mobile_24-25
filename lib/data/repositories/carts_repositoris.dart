import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';
import 'package:ngpiteapp/data/entities/cart_entitie.dart';

abstract class CartsRepositoris {
  Future<AppResponse> addProduct({required int id}); //{product}
  Future<AppResponse> plusProductOne({required int id}); //{product}
  Future<AppResponse> minusProductOne({required int id}); //{product}
  Future<AppResponse> deleteProduct({required int id}); //{product}
  Future<AppResponse> clearCart();
  Future<AppResponse> getCart();
}

class ImpCartsRepositories implements CartsRepositoris {
  final ApiServices api;
  ImpCartsRepositories({required this.api});

  @override
  // TODO : Maybe add {required int count}
  Future<AppResponse> addProduct({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.addProductInCart + id.toString(),
          method: Method.post,
          requiredToken: true,
          // TODO: Check this.
          params: {ApiKey.count: 1});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> clearCart() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.clearCart,
        method: Method.delete,
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

  @override
  Future<AppResponse> deleteProduct({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.deleteProductCart + id.toString(),
        method: Method.delete,
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

  @override
  Future<AppResponse> getCart() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.getCart,
        method: Method.get,
        requiredToken: true,
      );
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = CartEntitie.fromMap(data[ApiKey.cart]);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> minusProductOne({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.minusProductOneCart + id.toString(),
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

  @override
  Future<AppResponse> plusProductOne({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.plusProductOneCart + id.toString(),
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
