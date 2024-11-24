import 'package:ngpiteapp/app/services/api/dio_consumer.dart';

abstract class ApiServices {
  dynamic request({
    required String url,
    required Method method,
    required bool requiredToken,
    Map<String, dynamic>? queryParameters,
    bool uploadImage = false,
    //Map<String, dynamic>? params,
    Object? params,
  });
}
