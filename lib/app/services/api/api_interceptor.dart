import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO : Handle this api key
    options.headers["Accept-Language"] = Get.locale.toString();
    super.onRequest(options, handler);
  }
}
