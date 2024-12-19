import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class ProductsCardEntite {
  final String name;
  final String image;
  final String marketName;
  final int id;
  final String categoryId;
  final int price;

  ProductsCardEntite({
    required this.name,
    required this.image,
    required this.marketName,
    required this.id,
    required this.categoryId,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.name: name,
      ApiKey.image: image,
      ApiKey.market_name: marketName,
      ApiKey.id: id,
      ApiKey.category: categoryId,
      ApiKey.price: price,
    };
  }

  factory ProductsCardEntite.fromMap(Map<String, dynamic> map) {
    return ProductsCardEntite(
      name: map[ApiKey.name] as String,
      image: (map[ApiKey.image] as String?) ?? "",
      marketName: map[ApiKey.market_name] as String,
      id: map[ApiKey.id] as int,
      categoryId: map[ApiKey.category] as String,
      price: map[ApiKey.price] as int,
    );
  }

  String toJson() => json.encode(toMap());
}
