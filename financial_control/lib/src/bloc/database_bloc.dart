import 'dart:async';

import 'package:financial_control/src/bloc/database_state.dart';
import 'package:financial_control/src/firebase/database.dart';
import 'package:financial_control/src/models/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'database_event.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseService _databaseService;

  StreamSubscription _databaseSubscription;

  DatabaseBloc(String uid) : super(UnauthenticatedDatabaseState()) {
    _databaseService = DatabaseService(uid: uid);
    _databaseSubscription =
        _databaseService.transactions.listen((List<TransactionModel> event) {
      add(ReceivedNewList(event));
    });
  }

  @override
  Stream<DatabaseState> mapEventToState(event) async* {
    if (event is AddDatabase) {
      _databaseService.addTransaction(event.name, event.value);
    } else if (event is DeleteDatabase) {
      _databaseService.removeTransaction(event.transactionId);
    } else if (event is UpdateDatabase) {
      _databaseService.updateTransaction(
          event.transactionId, event.name, event.value);
    } else if (event is ReceivedNewList) {
      yield TransactionsDatabaseState(event.transactions);
    }
  }

  @override
  Future<void> close() {
    _databaseSubscription.cancel();
    return super.close();
  }
}
