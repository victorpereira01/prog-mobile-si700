import 'package:firebase_sample/bloc/auth_bloc.dart';
import 'package:firebase_sample/bloc/auth_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = new GlobalKey();
  RegisterUser registerUser = new RegisterUser();

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
              registerUser.username = value;
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
              registerUser.password = value;
            },
            decoration: InputDecoration(
                hintText: "*******", labelText: "Password (email address)"),
          ),
          RaisedButton(
              child: Text("REGISTER"),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  BlocProvider.of<AuthBloc>(context).add(registerUser);
                }
              })
        ],
      ),
    );
  }
}
