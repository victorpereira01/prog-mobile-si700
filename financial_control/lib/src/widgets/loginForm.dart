import 'package:financial_control/src/database/database_helper.dart';
import 'package:financial_control/src/models/user.dart';
import 'package:financial_control/src/views/navigationView.dart';
import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/inputContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  User user = new User.withId(null, "", "", 1);

  DatabaseHelper helper = DatabaseHelper.helper;

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
                    onSaved: (value) => user.email = value),
                InputContainer(
                    labelName: "Password",
                    hide: true,
                    onSaved: (value) => user.password = value)
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
                  if (await validateUser() != null)
                    {
                      //push view without back navigation
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  NavigationView(userId: user.id)))
                    }
                  else
                    {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("User not found!"),
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

  validateUser() async {
    // var usuarios = helper.findAllUsers();
    // usuarios.then((value) => print(value));

    User usr = await helper.getUser(user.email, user.password);

    user.id = usr.id;

    if (usr == null) {
      return null;
    } else {
      print(usr.email);
      print(usr.password);
      print(usr.sendNews);
      return usr;
    }
  }
}
