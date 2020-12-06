import 'package:firebase_sample/bloc/auth_bloc.dart';
import 'package:firebase_sample/bloc/auth_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> formKey = new GlobalKey();
  LoginUser loginUser = new LoginUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [registerForm()],
        ),
      ),
    );
  }

  Widget registerForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value.length == 0) {
                return "Please enter username";
              }
              return null;
            },
            onSaved: (value) {
              loginUser.username = value;
            },
            decoration: InputDecoration(
                hintText: "none@none.com",
                labelText: "Username (email address)"),
          ),
          TextFormField(
            validator: (value) {
              if (value.length == 0) {
                return "Please enter password";
              }
              return null;
            },
            onSaved: (value) {
              loginUser.password = value;
            },
            decoration: InputDecoration(
                hintText: "*******", labelText: "Password (email address)"),
          ),
          RaisedButton(
              child: Text("SIGN IN"),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  BlocProvider.of<AuthBloc>(context).add(loginUser);
                }
              })
        ],
      ),
    );
  }
}
