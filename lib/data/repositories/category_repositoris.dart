import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';
import 'package:ngpiteapp/data/entities/category_entities.dart';

abstract class CategoryRepositories {
  Future<AppResponse> getAllCategories();
  Future<AppResponse> getCategory({required String id});
}

class ImpCategoryRepositories implements CategoryRepositories {
  final ApiServices api;
  ImpCategoryRepositories({required this.api});

  @override
  Future<AppResponse> getAllCategories() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getAllCategories,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final jsonData = data["categories"] as List<dynamic>;
      response.data =
          jsonData.map((json) => CategoryEntities.fromMap(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getCategory({required String id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getCategory,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = CategoryEntities.fromMap(data);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
