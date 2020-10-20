import 'package:financial_control/src/widgets/loginForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
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
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        child: LoginForm(),
      ),
    );
  }
}
