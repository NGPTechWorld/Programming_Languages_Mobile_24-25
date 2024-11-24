import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/data/module/settings_model.dart';

class AuthRemoteDataSource {
  final ApiServices api;

  AuthRemoteDataSource({required this.api});

  Future<SettingsModel> getSettings() async {
    final response = await api.request(
        url: EndPoints.apiSettings, method: Method.get, requiredToken: F);
    debugPrint(response.toString());
    return SettingsModel.fromJson(response.data[0]);
  }
}
