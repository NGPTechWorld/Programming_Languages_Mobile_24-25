// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class LocationEntite {
  final int id;
  final String name;
  final String address;
  final String street;
  final String notes;

  LocationEntite(
      {required this.id,
      required this.name,
      required this.address,
      required this.street,
      required this.notes});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.location: address,
      ApiKey.street: street,
      ApiKey.notes: notes,
    };
  }

  factory LocationEntite.fromMap(Map<String, dynamic> map) {
    return LocationEntite(
      id: map[ApiKey.id] as int,
      name: map[ApiKey.name] as String,
      address: map[ApiKey.location] as String,
      street: map[ApiKey.street] as String,
      notes: map[ApiKey.notes] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationEntite.fromJson(String source) =>
      LocationEntite.fromMap(json.decode(source) as Map<String, dynamic>);
}
