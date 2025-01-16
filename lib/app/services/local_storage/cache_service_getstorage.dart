import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services.dart';

class CacheServiceGetStorage implements CacheServices {
  late GetStorage _getStorage;

  CacheServiceGetStorage() {
    _getStorage = GetStorage();
  }

  bool isLoggedIn() {
    debugPrint("User=>>>>>>>>>> ${_getStorage.hasData(kUserLoginModelKey)}");
    return _getStorage.hasData(kUserLoginModelKey);
  }

  void deleteCurrentUserAndToken() {
    debugPrint("deleting user from cache");
    _getStorage.remove(kUserLoginModelKey);
    _getStorage.remove(kUserTokenKey);
  }

  // Future updateUserInfo(UserModel user) async {
  //   await _getStorage.write(kUserLoginModelKey, user.toRawJson());
  // }

  // Future updateUserImage(String image) async {
  //   UserModel user =
  //       UserModel.fromRawJson(_getStorage.read(kUserLoginModelKey));
  //   user.imageName = image;
  //   await _getStorage.write(kUserLoginModelKey, user.toRawJson());
  // }

  // Future storeLoggedInUserAndToken(UserModel user, String token) async {
  //   await _getStorage.write(kUserLoginModelKey, user.toRawJson());
  //   await _getStorage.write(kUserTokenKey, token);
  //   debugPrint("User=>>>>>>>>>> ${_getStorage.hasData(kUserLoginModelKey)}");
  // }

  // UserModel getLoggedInUser() {
  //   return UserModel.fromRawJson(_getStorage.read(kUserLoginModelKey));
  // }

  Future storeUserToken(String token) async {
    await _getStorage.write(kUserTokenKey, token);
  }

  Future writeCache(String key, dynamic data) async {
    await _getStorage.write(key, data);
  }

  bool isKeyContaine(String key) {
    return _getStorage.hasData(key);
  }

  dynamic readCache(String key) {
    dynamic text = _getStorage.read(key);
    return text ?? "";
  }
  /*String getUserToken() {
    return UserLoginModel.fromRawJson(_getStorage.read(kUserLoginModelKey))
        .token!;
  }*/

  Future<String> getUserToken() async {
    String? token = _getStorage.read(kUserTokenKey);
    return token ?? "";
  }

  void storePushNotificationReceivingState(bool pushNotification) {
    _getStorage.write(kPushNotification, pushNotification);
  }

  bool getPushNotificationReceivingState() {
    return _getStorage.read(kPushNotification) ?? true;
  }

  // Store Objects in GetStorage
  Future setTimeOfDay(String key, TimeOfDay time) async {
    String value = json.encode({'hour': time.hour, 'minute': time.minute});
    await _getStorage.write(key, value);
  }

  TimeOfDay? getTimeOfDay(String key) {
    Map<String, dynamic>? storedTimeMap;

    if (_getStorage.read(key) != null) {
      storedTimeMap = json.decode(_getStorage.read(key));
    }

    if (storedTimeMap != null) {
      return TimeOfDay(
        hour: storedTimeMap['hour'],
        minute: storedTimeMap['minute'],
      );
    }
    return null;
  }
}
