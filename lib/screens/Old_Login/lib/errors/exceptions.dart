import 'package:dio/dio.dart';
import 'package:shop_app/errors/error_model.dart';

class ServerException implements Exception{
  final ErrorModel errorModel;
  ServerException({required this.errorModel});
}


void handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: // Bad Request
            throw ServerException(errorModel: e.response!.data);
          case 401: // UnAuthorized
            throw ServerException(errorModel: e.response!.data);
          case 403: // Forbidden
            throw ServerException(errorModel: e.response!.data);
          case 404: // Not Found
            throw ServerException(errorModel: e.response!.data);
          case 504: // Server Exception
            throw ServerException(errorModel: e.response!.data);
        }
      case DioExceptionType.connectionTimeout:
        throw ServerException(errorModel: e.response!.data);
      case DioExceptionType.sendTimeout:
        throw ServerException(errorModel: e.response!.data);
      case DioExceptionType.receiveTimeout:
        throw ServerException(errorModel: e.response!.data);
      case DioExceptionType.badCertificate:
        throw ServerException(errorModel: e.response!.data);
      case DioExceptionType.cancel:
        throw ServerException(errorModel: e.response!.data);
      case DioExceptionType.connectionError:
        throw ServerException(errorModel: e.response!.data);
      case DioExceptionType.unknown:
        throw ServerException(errorModel: e.response!.data);
    }
  }
