class TransactionModel {
  String id;
  String name;
  double value;

  TransactionModel({this.id, this.name, this.value});

  TransactionModel.fromMap(String id, Map<String, dynamic> map) {
    this.id = id;
    this.name = map["name"];
    this.value = map["value"];
  }
}
