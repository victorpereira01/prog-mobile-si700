import 'package:financial_control/src/bloc/auth_bloc.dart';
import 'package:financial_control/src/bloc/auth_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget header(context) {
  return AppBar(
    actions: [
      IconButton(
        icon: Icon(Icons.exit_to_app, color: Colors.red),
        onPressed: () => BlocProvider.of<AuthBloc>(context).add(Logout()),
      )
    ],
    title: Text(
      "Financial Control",
      style: TextStyle(color: Colors.deepPurple, fontSize: 28),
    ),
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    centerTitle: true,
  );
}
