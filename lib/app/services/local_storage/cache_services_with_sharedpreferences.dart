import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheServicesSharedPreferences implements CacheServices {
  static late SharedPreferences sharedPreferences;
  static const fcmTokenKey = "fcmTokenKey";
//! Here The Initialize of cache .
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveFCMtoken(String fcmToken) async {
    return await sharedPreferences.setString(fcmTokenKey, fcmToken);
  }

  dynamic getFcmToken() {
    return getDataString(key: fcmTokenKey);
  }
//! this method to put data in local database using key

  String? getDataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  Future<String?> getUserToken() async {
    if (await containsKey(kUserTokenKey))
      return sharedPreferences.getString(kUserTokenKey);
    else
      return null;
  }
//! this method to put data in local database using key

  Future<bool> saveData(String key, dynamic value) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

//! remove data using specific key

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

//! this method to check if local database contains {key}
  Future<bool> containsKey(String key) async {
    return sharedPreferences.containsKey(key);
  }

//! clear all data in the local database
  Future<bool> clearData() async {
    debugPrint("================ Clear Cache done ==================");
    return await sharedPreferences.clear();
  }

//! this method to put data in local database using key
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }
}
