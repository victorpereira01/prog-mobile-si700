import 'package:financial_control/src/widgets/loginForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          elevation: 0,
          title: Container(
            padding: EdgeInsets.only(top: 35),
            child: Text(
              "Financial Control",
              style: TextStyle(fontSize: 34),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        child: LoginForm(),
      ),
    );
  }
}
