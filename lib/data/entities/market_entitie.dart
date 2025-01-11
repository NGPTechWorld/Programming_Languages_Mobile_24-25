// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class MarketEntitie {
  final int id;
  final String name;
  final String? image;

  MarketEntitie({required this.id, required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.image: image,
    };
  }

  factory MarketEntitie.fromMap(Map<String, dynamic> map) {
    return MarketEntitie(
      id: map[ApiKey.id] as int,
      name: map[ApiKey.name] as String,
      image: map[ApiKey.image] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketEntitie.fromJson(String source) =>
      MarketEntitie.fromMap(json.decode(source) as Map<String, dynamic>);
}
