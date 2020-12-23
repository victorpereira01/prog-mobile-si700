import 'package:financial_control/src/bloc/auth_bloc.dart';
import 'package:financial_control/src/bloc/auth_state.dart';
import 'package:financial_control/src/views/auth/authenticate.dart';
import 'package:financial_control/src/views/home/navigationView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return NavigationView();
        } else {
          return Authenticate();
        }
      },
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Server error"),
                content: Text(state.message),
                actions: [
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
            },
          );
        }
      },
    );
  }
}
