import 'dart:async';
import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/entities/products_card_for_market_entite.dart';
import 'package:ngpiteapp/data/entities/products_card_search_entite.dart';
import 'package:ngpiteapp/data/module/product_model.dart';

abstract class ProductsRepositories {
  Future<AppResponse> toggleFavorite({required String id});
  Future<AppResponse> getFavoriteProducts(
      {required int perPage, required int page});
  Future<AppResponse> getProducts({required int perPage, required int page});
  Future<AppResponse> getProductsByCategory(
      {required int perPage, required int page, required int categoryID});
  Future<AppResponse> getProduct({required String id});
  Future<AppResponse> getProductsByName(
      {required int perPage, required int page, required String productName});
  Future<AppResponse> getImageProduct({required int id});
  Future<AppResponse> getTopProducts({
    required int perPage,
    required int page,
  });
  Future<AppResponse> getTopProductsForMarket(
      {required int perPage, required int page, required int id});
}

class ImpProductsRepositories implements ProductsRepositories {
  final ApiServices api;
  ImpProductsRepositories({required this.api});

  @override
  Future<AppResponse> getFavoriteProducts(
      {required int perPage, required int page}) async {
    AppResponse response = AppResponse(success: false);
    // await Future.delayed(const Duration(seconds: 3));
    try {
      response.data = await api.request(
          url: EndPoints.getFavoriteProducts,
          method: Method.get,
          requiredToken: true,
          queryParameters: {
            ApiKey.perPage: perPage,
            ApiKey.page: page,
          });
      final decodedJson =
          jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final data = decodedJson[ApiKey.products][ApiKey.currentPageItems]
          as List<dynamic>;

      response.data =
          data.map((json) => ProductsCardEntite.fromMap(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getImageProduct({required int id}) {
    // TODO: implement getImageProduct
    // No need to implement it , because in product i have the link of the image.
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> getProduct({required String id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.getProduct + id,
        method: Method.get,
        requiredToken: true,
      );
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = ProductModel.fromMap(data);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getProducts(
      {required int perPage, required int page}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getProducts,
          method: Method.get,
          requiredToken: true,
          queryParameters: {ApiKey.perPage: perPage, ApiKey.page: page});
      // await Future.delayed(Duration(seconds: 6));
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final jsonList =
          data[ApiKey.products][ApiKey.currentPageItems] as List<dynamic>;
      response.data =
          jsonList.map((json) => ProductsCardEntite.fromMap(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getProductsByCategory(
      {required int perPage,
      required int page,
      required int categoryID}) async {
    AppResponse response = AppResponse(success: false);
    // await Future.delayed(const Duration(seconds: 3));
    try {
      response.data = await api.request(
          url: EndPoints.getProductsByCategory + categoryID.toString(),
          method: Method.get,
          requiredToken: true,
          queryParameters: {
            ApiKey.perPage: perPage,
            ApiKey.page: page,
          });
      final decodedJson =
          jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final data = decodedJson[ApiKey.products][ApiKey.currentPageItems]
          as List<dynamic>;

      response.data =
          data.map((json) => ProductsCardEntite.fromMap(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> toggleFavorite({required String id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.toggleFavorite + id + "/",
        method: Method.post,
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
  Future<AppResponse> getProductsByName(
      {required int perPage,
      required int page,
      required String productName}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getProductsByName + productName,
          method: Method.get,
          requiredToken: true,
          queryParameters: {ApiKey.page: page, ApiKey.perPage: perPage});
      final decodedJson =
          jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final data = decodedJson[ApiKey.products][ApiKey.currentPageItems]
          as List<dynamic>;

      response.data =
          data.map((json) => ProductsCardSearchEntite.fromMap(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getTopProducts({
    required int perPage,
    required int page,
  }) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getTopProducts,
          method: Method.get,
          requiredToken: true,
          queryParameters: {ApiKey.page: page, ApiKey.perPage: perPage});
      final decodedJson =
          jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final data = decodedJson[ApiKey.products][ApiKey.currentPageItems]
          as List<dynamic>;

      response.data =
          data.map((json) => ProductsCardEntite.fromMap(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getTopProductsForMarket(
      {required int perPage, required int page, required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getTopProducts,
          method: Method.get,
          requiredToken: true,
          queryParameters: {ApiKey.page: page, ApiKey.perPage: perPage});
      final decodedJson =
          jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final data = decodedJson[ApiKey.products][ApiKey.currentPageItems]
          as List<dynamic>;

      response.data =
          data.map((json) => ProductForMarketEntitie.fromMap(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
