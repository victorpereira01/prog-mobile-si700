import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatefulWidget {
  final String text;

  TransactionItem({@required this.text});

  @override
  State<StatefulWidget> createState() {
    return _TransactionItem();
  }
}

class _TransactionItem extends State<TransactionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.2,
                blurRadius: 2,
                offset: Offset(1, 1))
          ]),
      margin: EdgeInsets.only(top: 15),
      height: 50,
      width: double.infinity,
      child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.text,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
              Text(
                "- RS 200,00",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              )
            ],
          )),
    );
  }
}
