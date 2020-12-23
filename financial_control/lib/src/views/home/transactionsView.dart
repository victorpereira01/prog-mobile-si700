import 'package:financial_control/src/bloc/auth_bloc.dart';
import 'package:financial_control/src/bloc/auth_event.dart';
import 'package:financial_control/src/widgets/header.dart';
import 'package:financial_control/src/widgets/topic.dart';
import 'package:financial_control/src/widgets/transactionItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> litems = [
  "Conta de Luz",
  "Salário",
  "Mercado",
  "Conta de água",
  "Restaurante"
];

class TransactionsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionsView();
  }
}

class _TransactionsView extends State<TransactionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            topic("Your transactions"),
            Expanded(
              child: getTransactions(),
            )
          ],
        ),
      ),
    );
  }
}

ListView getTransactions() {
  return ListView.builder(
      itemCount: litems.length,
      itemBuilder: (BuildContext context, int position) {
        return new TransactionItem(text: litems[position]);
      });
}
