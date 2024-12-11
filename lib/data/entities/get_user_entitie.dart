// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class GetUserEntitie {
  String firstName;
  String lastName;
  String email;
  String phone;

  GetUserEntitie({required this.firstName, required this.lastName, required this.email, required this.phone});
  





  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.first_name: firstName,
      ApiKey.last_name: lastName,
      ApiKey.email: email,
      ApiKey.number: phone,
    };
  }

  factory GetUserEntitie.fromMap(Map<String, dynamic> map) {
    return GetUserEntitie(
      firstName: map[ApiKey.first_name] as String,
      lastName: map[ApiKey.last_name] as String,
      email: map[ApiKey.email] as String,
      phone: map[ApiKey.number] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetUserEntitie.fromJson(String source) => GetUserEntitie.fromMap(json.decode(source) as Map<String, dynamic>);
}
