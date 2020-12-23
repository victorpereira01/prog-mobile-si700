import 'package:financial_control/src/widgets/loginForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginView();
  }
}

class _LoginView extends State<LoginView> {
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
            LoginForm(),
            Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                )),
            Container(
              padding: EdgeInsets.only(top: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FaIcon(FontAwesomeIcons.facebookSquare,
                      size: 56, color: Colors.grey[800]),
                  FaIcon(FontAwesomeIcons.googlePlusSquare,
                      size: 56, color: Colors.grey[800]),
                  FaIcon(FontAwesomeIcons.twitterSquare,
                      size: 56, color: Colors.grey[800]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
