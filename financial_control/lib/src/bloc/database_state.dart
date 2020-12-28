import 'package:financial_control/src/models/transaction_model.dart';

abstract class DatabaseState {}

class UnauthenticatedDatabaseState extends DatabaseState {}

class TransactionsDatabaseState extends DatabaseState {
  List<TransactionModel> transactions;

  TransactionsDatabaseState(this.transactions);
}
