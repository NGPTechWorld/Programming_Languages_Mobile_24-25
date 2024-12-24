// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class CartEntitie {
  int count;
  int total_cost;
  List<Product> products;
  CartEntitie({
    required this.count,
    required this.total_cost,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.count: count,
      ApiKey.total_cost: total_cost,
      ApiKey.products: products.map((x) => x.toMap()).toList(),
    };
  }

  factory CartEntitie.fromMap(Map<String, dynamic> map) {
    return CartEntitie(
      count: map[ApiKey.count] as int,
      total_cost: map[ApiKey.total_cost] as int,
      products: List<Product>.from(
        (map[ApiKey.products] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartEntitie.fromJson(String source) =>
      CartEntitie.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Product {
  final String name;
  final String marketName;
  final String image;
  int id;
  int total_cost;
  int price;
  int count;
  Product(
      {required this.name,
      required this.marketName,
      required this.id,
      required this.count,
      required this.image,
      required this.price,
      required this.total_cost});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.name: name,
      ApiKey.market_name: marketName,
      ApiKey.id: id,
      ApiKey.image: image,
      ApiKey.price: price,
      ApiKey.total_cost: total_cost,
      ApiKey.count: count,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map[ApiKey.name] as String,
      marketName: map[ApiKey.market_name] as String,
      image: map[ApiKey.image] as String,
      id: map[ApiKey.id] as int,
      price: map[ApiKey.price] as int,
      count: map[ApiKey.count] as int,
      total_cost: map[ApiKey.total_cost] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
