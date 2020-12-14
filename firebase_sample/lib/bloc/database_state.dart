import 'package:firebase_sample/models/book_models.dart';

abstract class DatabaseState {}

class UnauthenticatedDatabaseState extends DatabaseState {}

class BookDatabaseState extends DatabaseState {
  List<Book> books;

  BookDatabaseState(this.books);
}
