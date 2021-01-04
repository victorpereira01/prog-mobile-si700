import 'package:financial_control/src/bloc/auth_bloc.dart';
import 'package:financial_control/src/bloc/auth_event.dart';
import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/inputContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  RegisterUser registerUser = new RegisterUser();

  bool acceptTheTerms = false;

  int radioValue = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Register",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Form(
            key: formKey,
            child: Column(
              children: [
                InputContainer(
                    labelName: "E-mail",
                    hide: false,
                    onSaved: (value) => registerUser.email = value),
                InputContainer(
                    labelName: "Password",
                    hide: true,
                    onSaved: (value) => registerUser.password = value),
                Container(
                  margin: EdgeInsets.only(top: 12, bottom: 10),
                  child: Row(children: [
                    Checkbox(
                      value: acceptTheTerms,
                      onChanged: (bool value) => setState(() {
                        acceptTheTerms = value;
                      }),
                    ),
                    Text(
                      "Li e aceito os termos de uso",
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Receber novidade do app por e-mail?",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(children: [
                        Radio(
                          value: 1,
                          groupValue: radioValue,
                          onChanged: (int value) => setState(() {
                            radioValue = value;
                          }),
                        ),
                        Text(
                          "Sim",
                          style: TextStyle(fontSize: 18),
                        ),
                        Radio(
                          value: 2,
                          groupValue: radioValue,
                          onChanged: (int value) => setState(() {
                            radioValue = value;
                          }),
                        ),
                        Text(
                          "Nâo",
                          style: TextStyle(fontSize: 18),
                        )
                      ])
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: Button(
                    text: "Sign up",
                    onPress: () => {
                      if (formKey.currentState.validate() && acceptTheTerms)
                        {
                          formKey.currentState.save(),
                          BlocProvider.of<AuthBloc>(context).add(registerUser),
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
                )
              ],
            )),
      ],
    );
  }
}
