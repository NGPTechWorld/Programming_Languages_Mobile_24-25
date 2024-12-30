import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class ProductForMarketEntitie {
  final String name;
  final String image;
  final int id;
  final String categoryId;
  final int price;

  ProductForMarketEntitie({
    required this.name,
    required this.image,
    required this.id,
    required this.categoryId,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.name: name,
      ApiKey.image: image,
      ApiKey.id: id,
      ApiKey.category: categoryId,
      ApiKey.price: price,
    };
  }

  factory ProductForMarketEntitie.fromMap(Map<String, dynamic> map) {
    return ProductForMarketEntitie(
      name: map[ApiKey.name] as String,
      image: (map[ApiKey.image] as String?) ?? "",
      id: map[ApiKey.id] as int,
      categoryId: map[ApiKey.category] as String,
      price: map[ApiKey.price] as int,
    );
  }

  String toJson() => json.encode(toMap());
}
