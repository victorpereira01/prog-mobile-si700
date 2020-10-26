import 'package:financial_control/src/views/loginView.dart';
import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/inputContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterData {
  String email = "";
  String password = "";
  bool acceptTheTerms = false;
  int receiveNews = 1;

  showValues() {
    print("Email: $email");
    print("Password: $password");
    print("Accept the terms: $acceptTheTerms");
    print("Receive News: $receiveNews");
    print("");
  }
}

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  RegisterData registerData = new RegisterData();

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
                    onSaved: (value) => registerData.email = value),
                InputContainer(
                    labelName: "Password",
                    hide: true,
                    onSaved: (value) => registerData.password = value),
                // container to wrap the checkbox and the statement
                Container(
                  margin: EdgeInsets.only(top: 12, bottom: 10),
                  child: Row(children: [
                    Checkbox(
                      value: registerData.acceptTheTerms,
                      onChanged: (bool value) => setState(() {
                        registerData.acceptTheTerms = value;
                      }),
                    ),
                    Text(
                      "Li e aceito os termos de uso",
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                ),
                // container to wrap the question and the radio buttons
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
                          groupValue: registerData.receiveNews,
                          onChanged: (int value) => setState(() {
                            registerData.receiveNews = value;
                          }),
                        ),
                        Text(
                          "Sim",
                          style: TextStyle(fontSize: 18),
                        ),
                        Radio(
                          value: 2,
                          groupValue: registerData.receiveNews,
                          onChanged: (int value) => setState(() {
                            registerData.receiveNews = value;
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
                      if (formKey.currentState.validate() &&
                          registerData.acceptTheTerms)
                        {
                          formKey.currentState.save(),
                          registerData.showValues(),
                          // shows success message and redirects to loginView
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Registered successfully!"),
                              actions: [
                                FlatButton(
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                        color: Colors.deepPurple, fontSize: 24),
                                  ),
                                  onPressed: () => {
                                    Navigator.of(context).pop(),
                                    Navigator.pop(context),
                                  },
                                )
                              ],
                            ),
                          )
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
