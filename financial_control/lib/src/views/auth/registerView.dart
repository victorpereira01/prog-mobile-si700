import 'package:financial_control/src/widgets/registerForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
