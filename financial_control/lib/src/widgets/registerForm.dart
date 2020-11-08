import 'package:financial_control/src/database/database_helper.dart';
import 'package:financial_control/src/models/transaction.dart';
import 'package:financial_control/src/models/user.dart';
import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/inputContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  User user = new User("", "", 1);

  String email;

  bool acceptTheTerms = false;

  DatabaseHelper helper = DatabaseHelper.helper;

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
                    onSaved: (value) => user.email = value),
                InputContainer(
                    labelName: "Password",
                    hide: true,
                    onSaved: (value) => user.password = value),
                // container to wrap the checkbox and the statement
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
                          groupValue: user.sendNews,
                          onChanged: (int value) => setState(() {
                            user.sendNews = value;
                          }),
                        ),
                        Text(
                          "Sim",
                          style: TextStyle(fontSize: 18),
                        ),
                        Radio(
                          value: 2,
                          groupValue: user.sendNews,
                          onChanged: (int value) => setState(() {
                            user.sendNews = value;
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

                          // persists data on the database
                          _saveData(),

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

  _saveData() async {
    await helper.insert(user);

    await helper.getCount("users").then((value) {
      print("value = $value");
    });
  }
}
