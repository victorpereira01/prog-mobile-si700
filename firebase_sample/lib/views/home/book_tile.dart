import 'package:firebase_sample/bloc/database_bloc.dart';
import 'package:firebase_sample/bloc/database_event.dart';
import 'package:firebase_sample/models/book_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookTile extends StatelessWidget {
  final Book book;

  final GlobalKey<FormState> formKey = new GlobalKey();

  BookTile({this.book}) : super();

  @override
  Widget build(BuildContext context) {
    print(book.titulo);
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  child: AlertDialog(
                    content: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Text(book.id),
                                TextFormField(
                                  onSaved: (value) {
                                    book.titulo = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Titulo", labelText: "Titulo"),
                                ),
                                TextFormField(
                                  onSaved: (value) {
                                    book.autor = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Autor", labelText: "Autor"),
                                ),
                                TextFormField(
                                  onSaved: (value) {
                                    book.nota = int.parse(value);
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Nota", labelText: "Nota"),
                                ),
                                RaisedButton(
                                    child: Text("REGISTER"),
                                    onPressed: () {
                                      formKey.currentState.save();
                                      BlocProvider.of<DatabaseBloc>(context)
                                          .add(UpdateDatabase(
                                              bookId: book.id,
                                              titulo: book.titulo,
                                              autor: book.autor,
                                              nota: book.nota));
                                      formKey.currentState.reset();
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    }),
                              ],
                            ))
                      ],
                    ),
                  ));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.blue[book.nota * 100],
            ),
            title: Text("Nome do livro"),
            subtitle: Text(book.autor),
            trailing: GestureDetector(
                child: Icon(Icons.delete),
                onTap: () {
                  BlocProvider.of<DatabaseBloc>(context)
                      .add(DeleteDatabase(bookId: book.id));
                }),
          ),
        ));
  }
}
