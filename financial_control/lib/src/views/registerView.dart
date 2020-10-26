import 'package:financial_control/src/widgets/loginForm.dart';
import 'package:financial_control/src/widgets/registerForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterView();
  }
}

class _RegisterView extends State<RegisterView> {
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
        child: Column(
          children: [
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
