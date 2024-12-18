import 'dart:convert';

import 'package:ngpiteapp/app/services/api/api_response_model.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:ngpiteapp/app/services/api/dio_consumer.dart';
import 'package:ngpiteapp/app/services/api/end_points.dart';
import 'package:ngpiteapp/core/errors/error_handler.dart';
import 'package:ngpiteapp/data/entities/location_entite.dart';

abstract class LocationsRepositories {
  Future<AppResponse> addLocation(
      {required String name,
      required String location,
      required String street,
      required String notes});
  Future<AppResponse> getLocations();
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
          url:  EndPoints.addLocation,
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
  Future<AppResponse> deleteLocation({required int idLocation}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: 
              EndPoints.deleteLocation +
              idLocation.toString(),
          method: Method.delete,
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
  Future<AppResponse> getLocations() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url:  EndPoints.getLocations,
          method: Method.get,
          requiredToken: true,
          params: {});
      // final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;

      response.data = parseLocations(response.data.toString());
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  List<LocationEntite> parseLocations(String jsonString) {
    final Map<String, dynamic> decodedJson = jsonDecode(jsonString);

    final List<dynamic> locationsJson = decodedJson[ApiKey.locations];

    return locationsJson
        .map((locationMap) =>
            LocationEntite.fromMap(locationMap as Map<String, dynamic>))
        .toList();
  }
}
