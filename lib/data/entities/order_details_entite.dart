import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class Market {
  final String name;
  final List<Product> products;

  Market({
    required this.name,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.name: name,
      ApiKey.products: products.map((x) => x.toMap()).toList(),
    };
  }

  factory Market.fromMap(Map<String, dynamic> map) {
    return Market(
      name: map[ApiKey.name] as String,
      products: List<Product>.from(
        (map[ApiKey.products] as List<dynamic>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Market.fromJson(String source) =>
      Market.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Product {
  final String name;
  final int price;
  final int count;
  final int total;

  Product({
    required this.name,
    required this.price,
    required this.count,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.price: price,
      ApiKey.count: count,
      ApiKey.total: total,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map[ApiKey.name] as String,
      price: map[ApiKey.price] as int,
      count: map[ApiKey.count] as int,
      total: map[ApiKey.total] as int,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class OrderDetailsEntite {
  final int price;
  final String address;
  final String date;
  final List<Market> markets;
  OrderDetailsEntite({
    required this.price,
    required this.address,
    required this.date,
    required this.markets,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.price: price,
      ApiKey.date: date,
      ApiKey.location_name: address,
      ApiKey.markets: markets.map((market) => market.toMap()).toList(),
    };
  }

  factory OrderDetailsEntite.fromMap(Map<String, dynamic> map) {
    return OrderDetailsEntite(
      price: map[ApiKey.price] as int,
      date: map[ApiKey.date] as String,
      address: map[ApiKey.location_name] as String,
      markets: (map[ApiKey.markets] as Map<String, dynamic>)
          .values
          .map((marketMap) => Market.fromMap(marketMap as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailsEntite.fromJson(String source) =>
      OrderDetailsEntite.fromMap(json.decode(source) as Map<String, dynamic>);
}
