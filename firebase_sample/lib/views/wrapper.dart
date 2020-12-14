import 'package:firebase_sample/bloc/auth_bloc.dart';
import 'package:firebase_sample/bloc/auth_state.dart';
import 'package:firebase_sample/bloc/database_bloc.dart';
import 'package:firebase_sample/views/auth/authenticate.dart';
import 'package:firebase_sample/views/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return BlocProvider<DatabaseBloc>(
              create: (context) {
                return DatabaseBloc(state.user.uid);
              },
              child: Home());
        } else {
          return Authenticate();
        }
      },
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Erro no servidor"),
              content: Text(state.message),
              actions: [
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        }
      },
    );
  }
}
