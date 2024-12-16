import 'dart:convert';

class CategoryEntities {
  final int id;
  final String name_en;
  final String name_ar;
  CategoryEntities({
    required this.id,
    required this.name_en,
    required this.name_ar,
  });

  CategoryEntities copyWith({
    int? id,
    String? name_en,
    String? name_ar,
  }) {
    return CategoryEntities(
      id: id ?? this.id,
      name_en: name_en ?? this.name_en,
      name_ar: name_ar ?? this.name_ar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_en': name_en,
      'name_ar': name_ar,
    };
  }

  factory CategoryEntities.fromMap(Map<String, dynamic> map) {
    return CategoryEntities(
      id: map['id'] as int,
      name_en: map['name_en'] as String,
      name_ar: map['name_ar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryEntities.fromJson(String source) =>
      CategoryEntities.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoryEntities(id: $id, name_en: $name_en, name_ar: $name_ar)';

  @override
  bool operator ==(covariant CategoryEntities other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name_en == name_en &&
        other.name_ar == name_ar;
  }

  @override
  int get hashCode => id.hashCode ^ name_en.hashCode ^ name_ar.hashCode;
}
