import 'package:financial_control/src/views/registerView.dart';
import 'package:financial_control/src/widgets/loginForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: Column(
          children: [
            LoginForm(),
            Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ",
                          style: TextStyle(fontSize: 18)),
                      InkWell(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.deepPurple,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterView())),
                      )
                    ],
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
