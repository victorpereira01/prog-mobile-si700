import 'dart:async';

import 'package:firebase_sample/bloc/database_state.dart';
import 'package:firebase_sample/firebase/database.dart';
import 'package:firebase_sample/models/book_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'database_event.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseService _databaseService;

  StreamSubscription _databaseSubscription;

  DatabaseBloc(String uid) : super(UnauthenticatedDatabaseState()) {
    _databaseService = DatabaseService(uid: uid);
    _databaseSubscription = _databaseService.books.listen((List<Book> event) {
      add(ReceivedNewList(event));
    });
  }

  @override
  Stream<DatabaseState> mapEventToState(event) async* {
    if (event is AddDatabase) {
      _databaseService.addBook(event.titulo, event.autor, event.nota);
    } else if (event is DeleteDatabase) {
      _databaseService.removeBook(event.bookId);
    } else if (event is UpdateDatabase) {
      _databaseService.updateBook(
          event.bookId, event.titulo, event.autor, event.nota);
    } else if (event is ReceivedNewList) {
      yield BookDatabaseState(event.books);
    }
  }

  @override
  Future<void> close() {
    _databaseSubscription.cancel();
    return super.close();
  }
}
