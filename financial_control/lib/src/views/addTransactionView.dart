import 'dart:ui';

import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/header.dart';
import 'package:financial_control/src/widgets/inputContainer.dart';
import 'package:financial_control/src/widgets/topic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionData {
  String name = "";
  String value = "";

  showValues() {
    print("Name: $name");
    print("Value: $value");
    print("");
  }
}

class AddTransactionView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTransactionView();
  }
}

class _AddTransactionView extends State<AddTransactionView> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  TransactionData transactionData = new TransactionData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              topic("Add Transaction"),
              Form(
                key: formKey,
                child: Column(children: [
                  InputContainer(
                      hide: false,
                      labelName: "Name",
                      onSaved: (value) => transactionData.name = value),
                  InputContainer(
                      hide: false,
                      labelName: "Value",
                      onSaved: (value) => transactionData.value = value)
                ]),
              ),
              // expanded widget to keep the buttons always alligned to the bottom
              // of the screen regardless of the screen scale
              Expanded(
                child: Container(
                  alignment: FractionalOffset.bottomCenter,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                width: double.infinity,
                child: Button(
                    text: "Confirm",
                    onPress: () => {
                          if (formKey.currentState.validate())
                            {
                              formKey.currentState.save(),
                              transactionData.showValues(),
                              Navigator.pop(context),
                            }
                        }),
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  color: Colors.red,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        ));
  }
}
