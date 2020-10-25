import 'package:financial_control/src/views/addTransactionView.dart';
import 'package:financial_control/src/widgets/button.dart';
import 'package:financial_control/src/widgets/header.dart';
import 'package:financial_control/src/widgets/topic.dart';
import 'package:financial_control/src/widgets/transactionItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> litems = ["Conta de Luz", "Salário", "Mercado"];

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topic("Current Balance"),
            Text(
              "RS 2.000,00",
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
                      Text("RS 2.500,00",
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
                        "RS 500,00",
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
                child: getTransactions(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              width: double.infinity,
              child: Button(
                  text: "Add Transaction",
                  onPress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AddTransactionView()))),
            ),
          ],
        ),
      ),
    );
  }
}

// build a TransactionItem for every item of litems
ListView getTransactions() {
  return ListView.builder(
      itemCount: litems.length,
      itemBuilder: (BuildContext context, int position) {
        return new TransactionItem(text: litems[position]);
      });
}
