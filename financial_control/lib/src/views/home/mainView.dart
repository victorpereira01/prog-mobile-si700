import 'package:financial_control/src/bloc/database_bloc.dart';
import 'package:financial_control/src/bloc/database_state.dart';
import 'package:financial_control/src/models/transaction_model.dart';
import 'package:financial_control/src/views/home/transactionTile.dart';
import 'package:financial_control/src/widgets/header.dart';
import 'package:financial_control/src/widgets/topic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> litems = ["Conta de Luz", "Salário", "Mercado"];

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  double balance = 0;

  double revenues = 0;

  double expenses = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is TransactionsDatabaseState) {
          List<TransactionModel> list = state.transactions;
          state.transactions.forEach((element) {
            balance += element.value;
            if (element.value > 0) {
              revenues += element.value;
            } else {
              expenses += element.value;
            }
          });
          return Scaffold(
            appBar: header(context),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topic("Current Balance"),
                  Text(
                    "RS " + balance.toStringAsFixed(2),
                    style: TextStyle(color: Colors.deepPurple, fontSize: 48),
                  ),
                  // revenues and expenses container
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.8,
                          blurRadius: 5,
                          offset: Offset(2, 2))
                    ]),
                    // revenues history box
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "REVENUE",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text("RS " + revenues.toStringAsFixed(2),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        // expenses history box
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "EXPENSES",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "RS " + expenses.toStringAsFixed(2),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                  ),
                  topic("Transactions"),
                  Container(
                      child: Expanded(
                    child: ListView.builder(
                        itemCount: list.length > 4 ? 4 : list.length,
                        itemBuilder: (context, index) {
                          return TranscationTile(
                              transaction: list[index], isStatic: true);
                        }),
                  )),
                ],
              ),
            ),
          );
        } else {
          Text("Access denied");
        }
      },
    );
  }
}
