// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class ProductEntitie {
  final String name;
  final String image;
  final String description;
  final int id;
  final String? market;
  final String category;
  final int quantity;
  final int price;
  final int number_of_purchases;
  ProductEntitie({
    required this.name,
    required this.image,
    required this.description,
    required this.id,
    required this.market,
    required this.category,
    required this.quantity,
    required this.price,
    required this.number_of_purchases,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.name: name,
      ApiKey.image: image,
      ApiKey.description: description,
      ApiKey.id: id,
      ApiKey.market_name: market,
      ApiKey.category_id: category,
      ApiKey.quantity: quantity,
      ApiKey.price: price,
      ApiKey.number_of_purchases: number_of_purchases,
    };
  }

  factory ProductEntitie.fromMap(Map<String, dynamic> map) {
    return ProductEntitie(
      name: map[ApiKey.name] as String,
      image: (map[ApiKey.image] as String?) ?? "",
      description: map[ApiKey.description] as String,
      id: map[ApiKey.id] as int,
      market: map[ApiKey.market_name] as String?,
      category: map[ApiKey.category] as String,
      quantity: map[ApiKey.quantity] as int,
      price: map[ApiKey.price] as int,
      number_of_purchases: map[ApiKey.number_of_purchases] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductEntitie.fromJson(String source) =>
      ProductEntitie.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductModel {
  final ProductEntitie product;
  final bool isFavorite;

  ProductModel({required this.product, required this.isFavorite});
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      isFavorite: map[ApiKey.isFavorite] as bool,
      product: ProductEntitie.fromMap(map[ApiKey.product]),
    );
  }
}
