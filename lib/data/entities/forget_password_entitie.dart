// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class ForgetPasswordEntitie {
  final String message;
  final int id;

  ForgetPasswordEntitie({required this.message, required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.message: message,
      ApiKey.id: id,
    };
  }

  factory ForgetPasswordEntitie.fromMap(Map<String, dynamic> map) {
    return ForgetPasswordEntitie(
      message: map[ApiKey.message] as String,
      id: map[ApiKey.id] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForgetPasswordEntitie.fromJson(String source) =>
      ForgetPasswordEntitie.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
