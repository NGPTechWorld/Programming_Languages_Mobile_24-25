// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ngpiteapp/app/services/api/end_points.dart';

class OrderCardEntite {
  final String date;
  final int totalPrice;
  final int id;
  final int statusId;
  OrderCardEntite(
      {required this.id , required this.statusId, required this.date, required this.totalPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.date: date,
      ApiKey.total_cost: totalPrice,
      ApiKey.id: id,
    };
  }

  factory OrderCardEntite.fromMap(Map<String, dynamic> map) {
    return OrderCardEntite(
      date: map[ApiKey.date] as String,
      totalPrice: map[ApiKey.total_cost] as int,
      statusId: map[ApiKey.status_id] as int,
      id: map[ApiKey.id] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderCardEntite.fromJson(String source) =>
      OrderCardEntite.fromMap(json.decode(source) as Map<String, dynamic>);
}
