// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class EditUserEntitie {
  final String firstName;
  final String lastName;
  final String email;

  EditUserEntitie({required this.firstName, required this.lastName, required this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.first_name: firstName,
      ApiKey.last_name: lastName,
      ApiKey.email: email,
    };
  }

  factory EditUserEntitie.fromMap(Map<String, dynamic> map) {
    return EditUserEntitie(
      firstName: map[ApiKey.first_name] as String,
      lastName: map[ApiKey.last_name] as String,
      email: map[ApiKey.email] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EditUserEntitie.fromJson(String source) =>
      EditUserEntitie.fromMap(json.decode(source) as Map<String, dynamic>);
}


