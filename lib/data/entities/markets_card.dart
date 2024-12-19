
import 'dart:convert';

class MarketsCard {
  final int id;
  final String name;
  MarketsCard({
    required this.id,
    required this.name,
  });

  MarketsCard copyWith({
    int? id,
    String? name,
  }) {
    return MarketsCard(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory MarketsCard.fromMap(Map<String, dynamic> map) {
    return MarketsCard(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketsCard.fromJson(String source) => MarketsCard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MarketsCard(id: $id, name: $name)';

  @override
  bool operator ==(covariant MarketsCard other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
