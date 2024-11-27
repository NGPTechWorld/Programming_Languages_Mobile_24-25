import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/core/errors/network_failure_model.dart';

class ErrorHandler implements Exception {
  late NetworkFailureModel failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

NetworkFailureModel _handleError(DioException error) {
  if (error.response == null) {
    return DataSource.NO_INTERNET_CONNECTION.getFailure();
  }
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return NetworkFailureModel(
            code: error.response?.statusCode ?? 0,
            message: error.response?.data is Map
                ? (error.response?.data["message"] ?? "")
                : "",
            data: error.response?.data is Map
                ? (error.response?.data["errors"] ?? "")
                : "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  NetworkFailureModel getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return NetworkFailureModel(
            code: ResponseCode.SUCCESS, message: ResponseMessage.SUCCESS.tr);
      case DataSource.NO_CONTENT:
        return NetworkFailureModel(
            code: ResponseCode.NO_CONTENT,
            message: ResponseMessage.NO_CONTENT.tr);
      case DataSource.BAD_REQUEST:
        return NetworkFailureModel(
          code: ResponseCode.BAD_REQUEST,
          message: ResponseMessage.BAD_REQUEST.tr,
        );
      case DataSource.FORBIDDEN:
        return NetworkFailureModel(
            code: ResponseCode.FORBIDDEN,
            message: ResponseMessage.FORBIDDEN.tr);
      case DataSource.UNAUTORISED:
        return NetworkFailureModel(
            code: ResponseCode.UNAUTORISED,
            message: ResponseMessage.UNAUTORISED.tr);
      case DataSource.NOT_FOUND:
        return NetworkFailureModel(
            code: ResponseCode.NOT_FOUND,
            message: ResponseMessage.NOT_FOUND.tr);
      case DataSource.INTERNAL_SERVER_ERROR:
        return NetworkFailureModel(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR.tr);
      case DataSource.CONNECT_TIMEOUT:
        return NetworkFailureModel(
            code: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.CONNECT_TIMEOUT.tr);
      case DataSource.CANCEL:
        return NetworkFailureModel(
            code: ResponseCode.CANCEL, message: ResponseMessage.CANCEL.tr);
      case DataSource.RECIEVE_TIMEOUT:
        return NetworkFailureModel(
            code: ResponseCode.RECIEVE_TIMEOUT,
            message: ResponseMessage.RECIEVE_TIMEOUT.tr);
      case DataSource.SEND_TIMEOUT:
        return NetworkFailureModel(
            code: ResponseCode.SEND_TIMEOUT,
            message: ResponseMessage.SEND_TIMEOUT.tr);
      case DataSource.CACHE_ERROR:
        return NetworkFailureModel(
            code: ResponseCode.CACHE_ERROR,
            message: ResponseMessage.CACHE_ERROR.tr);
      case DataSource.NO_INTERNET_CONNECTION:
        return NetworkFailureModel(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.NO_INTERNET_CONNECTION.tr);
      case DataSource.DEFAULT:
        return NetworkFailureModel(
            code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT.tr);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = StringManager.success; // success with data
  static const String NO_CONTENT =
      StringManager.success; // success with no data (no content)
  static const String BAD_REQUEST =
      StringManager.strBadRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      StringManager.strUnauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      StringManager.strForbiddenError; //  failure, API rejected request
  static String INTERNAL_SERVER_ERROR =
      StringManager.strInternalServerError.tr; // failure, crash in server side
  static const String NOT_FOUND =
      StringManager.strNotFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = StringManager.strTimeoutError;
  static const String CANCEL = StringManager.strDefaultError;
  static const String RECIEVE_TIMEOUT = StringManager.strTimeoutError;
  static const String SEND_TIMEOUT = StringManager.strTimeoutError;
  static const String CACHE_ERROR = StringManager.strCacheError;
  static const String NO_INTERNET_CONNECTION = StringManager.strNoInternetError;
  static const String DEFAULT = StringManager.strDefaultError;
}

class ApiInternalStatus {
  static const int SUCCESS = 200;
  static const int FAILURE = 400;
}
