import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/inputContainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                onPress: () =>
                    {formKey.currentState.save(), loginData.showValues()})),
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text("Don't have an account? Sign up",
              style: TextStyle(fontSize: 16)),
        ),
        Container(
          padding: EdgeInsets.only(top: 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaIcon(FontAwesomeIcons.facebookSquare,
                  size: 56, color: Colors.grey[800]),
              FaIcon(FontAwesomeIcons.googlePlusSquare,
                  size: 56, color: Colors.grey[800]),
              FaIcon(FontAwesomeIcons.twitterSquare,
                  size: 56, color: Colors.grey[800]),
            ],
          ),
        )
      ],
    );
  }
}
