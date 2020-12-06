import 'package:firebase_sample/bloc/auth_bloc.dart';
import 'package:firebase_sample/bloc/auth_state.dart';
import 'package:firebase_sample/views/auth/authenticate.dart';
import 'package:firebase_sample/views/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        return Home();
      } else {
        return Authenticate();
      }
    });
  }
}
