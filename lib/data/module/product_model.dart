// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String name;
  final String image;
  final String description;
  final int id;
  final int market_id;
  final int category_id;
  final int quantity;
  final int price;
  final int number_of_purchases;
  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.id,
    required this.market_id,
    required this.category_id,
    required this.quantity,
    required this.price,
    required this.number_of_purchases,
  });

  ProductModel copyWith({
    String? name,
    String? image,
    String? description,
    int? id,
    int? market_id,
    int? category_id,
    int? quantity,
    int? price,
    int? number_of_purchases,
  }) {
    return ProductModel(
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      id: id ?? this.id,
      market_id: market_id ?? this.market_id,
      category_id: category_id ?? this.category_id,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      number_of_purchases: number_of_purchases ?? this.number_of_purchases,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'description': description,
      'id': id,
      'market_id': market_id,
      'category_id': category_id,
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
      market_id: map['market_id'] as int,
      category_id: map['category_id'] as int,
      quantity: map['quantity'] as int,
      price: map['price'] as int,
      number_of_purchases: map['number_of_purchases'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, image: $image, description: $description, id: $id, market_id: $market_id, category_id: $category_id, quantity: $quantity, price: $price, number_of_purchases: $number_of_purchases)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.description == description &&
        other.id == id &&
        other.market_id == market_id &&
        other.category_id == category_id &&
        other.quantity == quantity &&
        other.price == price &&
        other.number_of_purchases == number_of_purchases;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        id.hashCode ^
        market_id.hashCode ^
        category_id.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        number_of_purchases.hashCode;
  }
}
