import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';

abstract class MarketsRepositories {
  Future<AppResponse> getMarkets(
      {required String prePage, required String page});
}

class ImpMarketsRepositories implements MarketsRepositories {
  final ApiServices api;
  ImpMarketsRepositories({required this.api});

  @override
  Future<AppResponse> getMarkets(
      {required String prePage, required String page}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: 
              EndPoints.getMarkets +
              "?perPage=${prePage}&page=${page}",
          method: Method.get,
          requiredToken: true,
          );
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data;
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
