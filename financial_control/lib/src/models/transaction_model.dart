import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  String id;
  String name;
  double value;
  Timestamp createdAt;

  TransactionModel({this.id, this.name, this.value, this.createdAt});

  TransactionModel.fromMap(String id, Map<String, dynamic> map) {
    this.id = id;
    this.name = map["name"];
    this.value = map["value"];
    this.createdAt = map["createdAt"];
  }
}
