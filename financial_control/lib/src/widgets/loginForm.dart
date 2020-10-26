import 'package:financial_control/src/views/navigationView.dart';
import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/inputContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginData {
  String email = "";
  String password = "";

  showValues() {
    print("Email: $email");
    print("Password: $password");
    print("");
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  LoginData loginData = new LoginData();

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
                    onSaved: (value) => loginData.email = value),
                InputContainer(
                    labelName: "Password",
                    hide: true,
                    onSaved: (value) => loginData.password = value)
              ],
            )),
        Container(
          padding: EdgeInsets.only(top: 48, bottom: 32),
          child: Button(
            text: "Sign In",
            onPress: () => {
              if (formKey.currentState.validate())
                {
                  formKey.currentState.save(),
                  loginData.showValues(),
                  //push view without back navigation
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NavigationView()))
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
