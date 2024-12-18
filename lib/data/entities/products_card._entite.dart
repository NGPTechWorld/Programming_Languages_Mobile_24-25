import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class ProductsCardEntite {
  final String name;
  final String image;
  final String marketName;
  final int id;
  final int categoryId;
  final int price;
  final int marketId;
  ProductsCardEntite({
    required this.name,
    required this.image,
    required this.marketName,
    required this.id,
    required this.categoryId,
    required this.price,
    required this.marketId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.name: name,
      ApiKey.image: image,
      ApiKey.market_name: marketName,
      ApiKey.id: id,
      ApiKey.category_id: categoryId,
      ApiKey.price: price,
      ApiKey.market_id: marketId,
    };
  }

  factory ProductsCardEntite.fromMap(Map<String, dynamic> map) {
    return ProductsCardEntite(
      name: map[ApiKey.name] as String,
      image: (map[ApiKey.image] as String?) ?? "",
      marketName: map[ApiKey.market_name] as String,
      id: map[ApiKey.id] as int,
      categoryId: map[ApiKey.category_id] as int,
      price: map[ApiKey.price] as int,
      marketId: map[ApiKey.market_id] as int,
    );
  }

  String toJson() => json.encode(toMap());

}
