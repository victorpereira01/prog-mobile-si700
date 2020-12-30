import 'package:financial_control/src/bloc/auth_bloc.dart';
import 'package:financial_control/src/bloc/auth_event.dart';
import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/loginForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                )),
            Container(
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide(color: Colors.grey, width: 3)),
                  padding:
                      EdgeInsets.only(top: 12, bottom: 12, right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                            color: Colors.grey[850],
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      FaIcon(
                        FontAwesomeIcons.google,
                        size: 26,
                        color: Colors.red,
                      )
                    ],
                  ),
                  onPressed: () => BlocProvider.of<AuthBloc>(context)
                      .add(LoginWithGoogle())),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "App developed for the mobile programming discipline",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey[400]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
