import 'package:firebase_sample/bloc/auth_bloc.dart';
import 'package:firebase_sample/bloc/auth_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HOME',
            ),
            Text(
              "algo",
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: Text("Efetuar logoout"),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(Logout());
              },
            ),
          ],
        ),
      ),
    );
  }
}
