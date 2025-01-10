import 'dart:convert';

// TODO : Check if image is needed or not , if not , delete this and use marketEntite
class MarketsCard {
  final int id;
  final String name;
  final String image;
  MarketsCard({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'image': image};
  }

  factory MarketsCard.fromMap(Map<String, dynamic> map) {
    return MarketsCard(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketsCard.fromJson(String source) =>
      MarketsCard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MarketsCard(id: $id, name: $name)';

  @override
  bool operator ==(covariant MarketsCard other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
