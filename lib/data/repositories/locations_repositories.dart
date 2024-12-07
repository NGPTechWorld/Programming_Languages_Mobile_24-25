import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';

abstract class LocationsRepositories {
  Future<AppResponse> addLocation(
      {required String name,
      required String location,
      required String street,
      required String notes});
  Future<AppResponse> getLocations({required int prePage, required int page});
  Future<AppResponse> deleteLocation({required int idLocation});
}

class ImpLocationsRepositories implements LocationsRepositories {
  final ApiServices api;
  ImpLocationsRepositories({required this.api});

  @override
  Future<AppResponse> addLocation(
      {required String name,
      required String location,
      required String street,
      required String notes}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.addLocation,
          method: Method.post,
          requiredToken: true,
          params: {
            ApiKey.name: name,
            ApiKey.location: location,
            ApiKey.street: street,
            ApiKey.notes: notes
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
  Future<AppResponse> deleteLocation({required int idLocation}) {
    // TODO: implement deleteLocation
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> getLocations({required int prePage, required int page}) {
    // TODO: implement getLocations
    throw UnimplementedError();
  }
}
