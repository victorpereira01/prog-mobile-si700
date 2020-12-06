import 'package:firebase_sample/bloc/auth_bloc.dart';
import 'package:firebase_sample/bloc/auth_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AUTHENTICATE"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Authenticate',
            ),
            Text(
              "algo",
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: Text("Login Anonimo"),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LoginAnonimousUser());
              },
            )
          ],
        ),
      ),
    );
  }
}
