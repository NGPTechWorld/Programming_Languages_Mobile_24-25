// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String name;
  final String image;
  final String description;
  final int id;
  final String market;
  final String category;
  final int quantity;
  final int price;
  final int number_of_purchases;
  ProductModel({
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
      'name': name,
      'image': image,
      'description': description,
      'id': id,
      'market_id': market,
      'category_id': category,
      'quantity': quantity,
      'price': price,
      'number_of_purchases': number_of_purchases,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      image: (map['image'] as String?) ?? "",
      description: map['description'] as String,
      id: map['id'] as int,
      market: map['market_name'] as String,
      category: map['category'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as int,
      number_of_purchases: map['number_of_purchases'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
