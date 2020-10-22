import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget topic(String title) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 5),
    padding: EdgeInsets.only(bottom: 5),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[700], width: 1))),
    child: Text(
      title,
      style: TextStyle(color: Colors.grey[700], fontSize: 24),
    ),
  );
}
