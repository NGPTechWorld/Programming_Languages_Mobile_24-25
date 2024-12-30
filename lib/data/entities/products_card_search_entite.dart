import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class ProductsCardSearchEntite {
  final String name;
  final String image;
  final String marketName;
  final int id;
  final String categoryId;
  final int price;

  ProductsCardSearchEntite({
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

  factory ProductsCardSearchEntite.fromMap(Map<String, dynamic> map) {
    return ProductsCardSearchEntite(
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
