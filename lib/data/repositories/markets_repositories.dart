import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';
import 'package:ngpiteapp/data/entities/market_entitie.dart';
import 'package:ngpiteapp/data/module/product_model.dart';

abstract class MarketsRepositories {
  Future<AppResponse> getMarkets({required int perPage, required int page});
  Future<AppResponse> getMarketsByName(
      {required int perPage, required int page, required String market_name});
  Future<AppResponse> getProductsForMarket(
      {required int perPage, required int page, required int market_id});
}

class ImpMarketsRepositories implements MarketsRepositories {
  final ApiServices api;
  ImpMarketsRepositories({required this.api});

  @override
  Future<AppResponse> getMarkets(
      {required int perPage, required int page}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getMarkets,
          method: Method.get,
          requiredToken: true,
          queryParameters: {ApiKey.perPage: perPage, ApiKey.page: page});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final jsonList =
          data[ApiKey.markets][ApiKey.currentPageItems] as List<dynamic>;
      response.data =
          (jsonList.map((json) => MarketEntitie.fromMap(json)).toList());
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getMarketsByName(
      {required int perPage,
      required int page,
      required String market_name}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getMarketsByName + market_name,
          method: Method.get,
          requiredToken: true,
          queryParameters: {ApiKey.perPage: perPage, ApiKey.page: page});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final jsonList =
          data[ApiKey.markets][ApiKey.currentPageItems] as List<dynamic>;
      response.data =
          jsonList.map((json) => MarketEntitie.fromMap(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getProductsForMarket(
      {required int perPage, required int page, required int market_id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.getProductsForMarket + '$market_id',
          method: Method.get,
          requiredToken: true,
          queryParameters: {ApiKey.perPage: perPage, ApiKey.page: page});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final jsonList =
          data[ApiKey.products][ApiKey.currentPageItems] as List<dynamic>;
      response.data =
          (jsonList.map((json) => ProductEntitie.fromMap(json)).toList());
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
