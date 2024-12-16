import 'dart:convert';

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
      'name': name,
      'image': image,
      'marketName': marketName,
      'id': id,
      'categoryId': categoryId,
      'price': price,
      'marketId': marketId,
    };
  }

  factory ProductsCardEntite.fromMap(Map<String, dynamic> map) {
    return ProductsCardEntite(
      name: map['name'] as String,
      image: (map['image'] as String?) ?? "",
      marketName: map['market_name'] as String,
      id: map['id'] as int,
      categoryId: map['category_id'] as int,
      price: map['price'] as int,
      marketId: map['market_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsCardEntite.fromJson(String source) =>
      ProductsCardEntite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsCardEntite(name: $name, image: $image, marketName: $marketName, id: $id, categoryId: $categoryId, price: $price, marketId: $marketId)';
  }

  @override
  bool operator ==(covariant ProductsCardEntite other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.marketName == marketName &&
        other.id == id &&
        other.categoryId == categoryId &&
        other.price == price &&
        other.marketId == marketId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        marketName.hashCode ^
        id.hashCode ^
        categoryId.hashCode ^
        price.hashCode ^
        marketId.hashCode;
  }
}
