import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';
import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/data/cache/const.dart';
import 'package:ngpiteapp/data/entities/login_entitie.dart';
import 'package:ngpiteapp/data/entities/user_entitie.dart';
import 'package:ngpiteapp/data/module/settings_model.dart';

abstract class AuthRepositories {
  Future<AppResponse> getSettings();
  Future<AppResponse> register(
      {required String username,
      required String firstName,
      required String lastName,
      required String entryYear,
      required String password,
      required String passwordConfirm});
  Future<AppResponse> login(
      {required String username, required String password});
  Future<AppResponse> logout();
  Future<AppResponse> refreshToken();
  Future<AppResponse> currentUser();
  Future<AppResponse> getUser({required String username});
  Future<AppResponse> getSpecialization(
      {required String username, required String yearName});
  Future<AppResponse> setSpecialization(
      {required String academic_year,
      required String specialization,
      required String name});
  Future<AppResponse> editUser(
      {required String first_name, required String last_name});
  Future<AppResponse> getUserName(
      {required String first_name, required String last_name});
}

class ImpAuthRepositories implements AuthRepositories {
  final ApiServices api;
  ImpAuthRepositories({required this.api});

  @override
  Future<AppResponse> getSettings() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.apiSettings, method: Method.get, requiredToken: false);
      response.data = SettingsModel.fromJson(response.data.data[0]);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> register(
      {required String username,
      required String firstName,
      required String lastName,
      required String entryYear,
      required String password,
      required String passwordConfirm}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.registerUrl,
          method: Method.post,
          requiredToken: false,
          params: {
            ApiKey.name: username,
            ApiKey.first_name: firstName,
            ApiKey.last_name: lastName,
            ApiKey.entry_year: entryYear,
            ApiKey.password: password,
            ApiKey.password_confirmation: passwordConfirm
          });
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> login(
      {required String username, required String password}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.loginUrl,
          method: Method.post,
          requiredToken: false,
          params: {ApiKey.name: username, ApiKey.password: password});
      debugPrint(response.data.toString());
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = LoginEntitie.fromMap(data);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> logout() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.logoutUrl,
          method: Method.post,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> refreshToken() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.refreshToken,
          method: Method.put,
          requiredToken: true);
      response.data = LoginEntitie.fromMap(response.data);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> currentUser() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.currentUserUrl,
          method: Method.get,
          requiredToken: true);
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      debugPrint(data.toString());
      response.data = UserEntitie.fromMap(data["user"]);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getUser({required String username}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getUserUrl + username,
          method: Method.get,
          requiredToken: false);
      response.data = UserEntitie.fromMap(response.data["user"]);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getSpecialization(
      {required String username, required String yearName}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl +
              EndPoints.getSpecializationUserUrl +
              yearName +
              "/" +
              username,
          method: Method.get,
          requiredToken: false);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> setSpecialization(
      {required String academic_year,
      required String specialization,
      required String name}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.setSpecializationUrl,
          method: Method.put,
          requiredToken: true,
          params: {
            "name": name,
            "specialization": specialization,
            "academic_year": academic_year
          });
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> editUser(
      {required String first_name, required String last_name}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.editUserUrl,
          method: Method.put,
          requiredToken: true,
          params: {
            "name": user!.name,
            "first_name": first_name,
            "last_name": last_name
          });
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getUserName(
      {required String first_name, required String last_name}) async {
    AppResponse response = AppResponse(success: false);
    try {
      final req = await api.request(
        url: EndPoints.baserUrl +
            EndPoints.getUserNameWithFullName +
            first_name +
            "/" +
            last_name,
        method: Method.get,
        requiredToken: false,
      );
      response.data = req.data;
      if (response.data != []) {
        final List<UserEntitie> items =
            (response.data as List).map((m) => UserEntitie.fromMap(m)).toList();
        response.data = items;
      } else {
        response.data = null;
      }
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
