import 'package:financial_control/src/views/auth/loginView.dart';
import 'package:financial_control/src/views/auth/registerView.dart';
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: AppBar(
            bottom: TabBar(tabs: [
              Tab(text: "LOGIN"),
              Tab(text: "REGISTER"),
            ]),
            toolbarHeight: 90,
            elevation: 0,
            title: Container(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "Financial Control",
                style: TextStyle(fontSize: 36),
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          LoginView(),
          RegisterView(),
        ]),
      ),
    );
  }
}
