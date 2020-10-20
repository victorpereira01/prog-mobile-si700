import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final onPress;

  Button({@required this.text, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: Colors.deepPurple,
        padding: EdgeInsets.all(12),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        onPressed: this.onPress);
  }
}
