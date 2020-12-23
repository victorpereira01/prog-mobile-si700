import 'package:financial_control/src/bloc/auth_bloc.dart';
import 'package:financial_control/src/bloc/auth_event.dart';
import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/inputContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  LoginUser loginUser = new LoginUser();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Login",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Form(
            key: formKey,
            child: Column(
              children: [
                InputContainer(
                    labelName: "E-mail",
                    hide: false,
                    onSaved: (value) => loginUser.email = value),
                InputContainer(
                    labelName: "Password",
                    hide: true,
                    onSaved: (value) => loginUser.password = value)
              ],
            )),
        Container(
          padding: EdgeInsets.only(top: 48, bottom: 32),
          child: Button(
            text: "Sign In",
            onPress: () async => {
              if (formKey.currentState.validate())
                {
                  formKey.currentState.save(),
                  BlocProvider.of<AuthBloc>(context).add(loginUser),
                }
              else
                {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("An error ocurred! Try again later"),
                      actions: [
                        FlatButton(
                          child: Text(
                            "OK",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 24),
                          ),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  )
                }
            },
          ),
        ),
      ],
    );
  }
}
