import 'package:financial_control/src/models/transaction_model.dart';

abstract class DatabaseEvent {}

class UpdateDatabase extends DatabaseEvent {
  String transactionId;
  String name;
  double value;

  UpdateDatabase({this.transactionId, this.name, this.value});
}

class AddDatabase extends DatabaseEvent {
  String name;
  double value;
  DateTime createdAt;

  AddDatabase({this.name, this.value, this.createdAt});
}

class DeleteDatabase extends DatabaseEvent {
  String transactionId;

  DeleteDatabase({this.transactionId});
}

class ReceivedNewList extends DatabaseEvent {
  List<TransactionModel> transactions;

  ReceivedNewList(this.transactions);
}
