import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget header() {
  return AppBar(
    title: Text(
      "Financial Control",
      style: TextStyle(color: Colors.deepPurple, fontSize: 28),
    ),
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    centerTitle: true,
  );
}
