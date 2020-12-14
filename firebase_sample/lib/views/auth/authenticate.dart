import 'package:firebase_sample/views/auth/register.dart';
import 'package:firebase_sample/views/auth/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AUTHENTICATE USER"),
          bottom: TabBar(tabs: [
            Tab(
                icon: Row(
              children: [Icon(Icons.announcement), Text("Novo Registro")],
            )),
            Tab(
                icon: Row(
              children: [Icon(Icons.cake), Text("Efetuar Login")],
            ))
          ]),
        ),
        body: TabBarView(children: [
          Register(),
          SignIn(),
        ]),
      ),
    );
  }
}
