// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ngpiteapp/app/services/api/end_points.dart';

class UserEntitie {
  String name;
  String firstName;
  String lastName;


  UserEntitie({
    required this.name,
    required this.firstName,
    required this.lastName,

  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.name: name,
      ApiKey.first_name: firstName,
      ApiKey.last_name: lastName,
          };
  }

  factory UserEntitie.fromMap(Map<String, dynamic> map) {
    return UserEntitie(
      name: map[ApiKey.name] as String,
      firstName: map[ApiKey.first_name] as String,
      lastName: map[ApiKey.last_name] as String,
        );
  }


}
