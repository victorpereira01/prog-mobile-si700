import 'package:firebase_sample/bloc/auth_bloc.dart';
import 'package:firebase_sample/bloc/auth_event.dart';
import 'package:firebase_sample/views/home/book_entry.dart';
import 'package:firebase_sample/views/home/book_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [
            FlatButton.icon(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(Logout());
                },
                icon: Icon(Icons.person),
                label: Text("Logout"))
          ],
          bottom: TabBar(tabs: [
            Tab(
                icon: Row(
              children: [Icon(Icons.announcement), Text("Lista de livros")],
            )),
            Tab(
                icon: Row(
              children: [Icon(Icons.cake), Text("Adicionar livro")],
            ))
          ]),
        ),
        body: TabBarView(children: [
          BookList(),
          BookEntry(),
        ]),
      ),
    );
  }
}
