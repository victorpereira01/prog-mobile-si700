import 'package:financial_control/src/bloc/database_bloc.dart';
import 'package:financial_control/src/bloc/database_event.dart';
import 'package:financial_control/src/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;

  final bool isStatic;

  TransactionTile({this.transaction, this.isStatic}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: [
          BoxShadow(
              color: Colors.grey[350],
              spreadRadius: 0.2,
              blurRadius: 2,
              offset: Offset(1, 1))
        ]),
        child: Card(
          child: isStatic
              ? ListTile(
                  title: Text(
                    transaction.name,
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "RS " + transaction.value.toString(),
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: transaction.value > 0
                                ? Colors.green
                                : Colors.red),
                      ),
                      isStatic
                          ? Text("")
                          : GestureDetector(
                              child: Icon(Icons.delete),
                              onTap: () =>
                                  BlocProvider.of<DatabaseBloc>(context).add(
                                      DeleteDatabase(
                                          transactionId: transaction.id))),
                    ],
                  ),
                )
              : ListTile(
                  leading: transaction.value > 0
                      ? ClipRect(
                          child: Image.asset(
                          'lib/public/images/upward_arrow.png',
                          width: 30,
                        ))
                      : ClipRect(
                          child: Image.asset(
                          'lib/public/images/downward_arrow.png',
                          width: 30,
                        )),
                  title: Text(
                    transaction.name,
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "RS " + transaction.value.toString(),
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: transaction.value > 0
                                ? Colors.green
                                : Colors.red),
                      ),
                      isStatic
                          ? Text("")
                          : GestureDetector(
                              child: Icon(Icons.delete),
                              onTap: () =>
                                  BlocProvider.of<DatabaseBloc>(context).add(
                                      DeleteDatabase(
                                          transactionId: transaction.id))),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
