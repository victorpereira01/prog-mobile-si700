import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class LoginData {
  String username = "";
  String password = "";
  int radioValue = 1;
  bool checkBoxValue = false;

  showValues() {
    print("Username: $username");
    print("Password: $password");
    print("Radio Value: $radioValue");
    print("CheckBox Value: $checkBoxValue");
    print("");
  }
}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyForm();
  }
}

class _MyForm extends State<MyForm> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  LoginData loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "E-mail",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.deepPurple[800]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurple, width: 2))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.length == 0) {
                        return "Please enter username";
                      }
                    },
                    onSaved: (String value) {
                      loginData.username = value;
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.deepPurple[800]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurple, width: 2))),
                    obscureText: true,
                    validator: (String value) {
                      if (value.length < 10) {
                        return "Password must be longer than 10 characters";
                      }
                    },
                    onSaved: (String value) {
                      loginData.password = value;
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Você tem mais de 18 anos?",
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Radio(
                        activeColor: Colors.deepPurple,
                        value: 1,
                        groupValue: loginData.radioValue,
                        onChanged: (int value) {
                          setState(() {
                            loginData.radioValue = value;
                          });
                        }),
                    Text("Sim"),
                    Radio(
                        activeColor: Colors.deepPurple,
                        value: 2,
                        groupValue: loginData.radioValue,
                        onChanged: (int value) {
                          setState(() {
                            loginData.radioValue = value;
                          });
                        }),
                    Text("Não"),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Colors.deepPurple,
                    value: loginData.checkBoxValue,
                    onChanged: (bool value) => setState(() {
                          loginData.checkBoxValue = value;
                        })),
                Text(
                  "Li e aceito os termos de uso",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 24),
              child: ButtonTheme(
                  padding: EdgeInsets.all(14),
                  minWidth: 350,
                  child: Tooltip(
                    message: "Não é possível entrar",
                    child: RaisedButton(
                        color: Colors.deepPurple[700],
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          if (formKey.currentState.validate() &&
                              loginData.checkBoxValue &&
                              loginData.radioValue == 1) {
                            formKey.currentState.save();
                            loginData.showValues();
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text(
                                          "An error has occurred! Try again later."));
                                });
                          }
                        }),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
