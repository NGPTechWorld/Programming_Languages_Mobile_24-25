import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';

abstract class ProductsRepositories {
  Future<AppResponse> toggleFavorite({required String id});
  Future<AppResponse> getFavoriteProducts(
      {required String prePage, required String page});
  Future<AppResponse> getProducts(
      {required String prePage, required String page});
  Future<AppResponse> getProductsByCategory(
      {required String prePage,
      required String page,
      required String categoryID});
  Future<AppResponse> getProduct({required String id});
  Future<AppResponse> getProductsByName(
      {required String prePage,
      required String page,
      required String productName});
  Future<AppResponse> getImageProduct({required String id});
}

class ImpProductsRepositories implements ProductsRepositories {
  final ApiServices api;
  ImpProductsRepositories({required this.api});

  @override
  Future<AppResponse> getFavoriteProducts(
      {required String prePage, required String page}) {
    // TODO: implement getFavoriteProducts
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> getImageProduct({required String id}) {
    // TODO: implement getImageProduct
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> getProduct({required String id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getProduct + id,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data;
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getProducts(
      {required String prePage, required String page}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl +
              EndPoints.getProducts +
              "?perPage=${prePage}&page=${page}",
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data;
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getProductsByCategory(
      {required String prePage,
      required String page,
      required String categoryID}) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> getProductsByName(
      {required String prePage,
      required String page,
      required String productName}) {
    // TODO: implement getProductsByName
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> toggleFavorite({required String id}) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }
}
