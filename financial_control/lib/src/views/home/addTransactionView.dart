import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_control/src/bloc/database_bloc.dart';
import 'package:financial_control/src/bloc/database_event.dart';
import 'package:financial_control/src/models/transaction_model.dart';
import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/header.dart';
import 'package:financial_control/src/widgets/inputContainer.dart';
import 'package:financial_control/src/widgets/topic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTransactionView();
  }
}

class _AddTransactionView extends State<AddTransactionView> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final TransactionModel transaction = new TransactionModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context),
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
                      onSaved: (value) => transaction.name = value),
                  InputContainer(
                      hide: false,
                      labelName: "Value",
                      onSaved: (value) =>
                          transaction.value = double.parse(value))
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
                              BlocProvider.of<DatabaseBloc>(context).add(
                                  AddDatabase(
                                      name: transaction.name,
                                      value: transaction.value,
                                      createdAt: Timestamp.now().toDate())),
                              formKey.currentState.reset(),
                            }
                        }),
              ),
            ],
          ),
        ));
  }
}
