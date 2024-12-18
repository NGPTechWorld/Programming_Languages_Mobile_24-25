// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class CategoryEntities {
  final int id;
  // TODO : Replace all name_en to name
  final String name_en;
  CategoryEntities({
    required this.id,
    required this.name_en,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.id: id,
      ApiKey.name_en: name_en,
    };
  }

  factory CategoryEntities.fromMap(Map<String, dynamic> map) {
    return CategoryEntities(
      id: map[ApiKey.id] as int,
      name_en: map[ApiKey.name_en] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryEntities.fromJson(String source) =>
      CategoryEntities.fromMap(json.decode(source) as Map<String, dynamic>);
}
