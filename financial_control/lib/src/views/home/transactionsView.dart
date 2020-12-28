import 'package:financial_control/src/bloc/database_bloc.dart';
import 'package:financial_control/src/bloc/database_state.dart';
import 'package:financial_control/src/models/transaction_model.dart';
import 'package:financial_control/src/views/home/transactionTile.dart';
import 'package:financial_control/src/widgets/header.dart';
import 'package:financial_control/src/widgets/topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is TransactionsDatabaseState) {
          List<TransactionModel> list = state.transactions;
          return Scaffold(
            appBar: header(context),
            body: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  topic("Your transactions"),
                  Expanded(
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return TranscationTile(
                              transaction: list[index], isStatic: false);
                        }),
                  )
                ],
              ),
            ),
          );
        } else {
          return Text("Access denied.");
        }
      },
    );
  }
}

// class TransactionsView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _TransactionsView();
//   }
// }

// class _TransactionsView extends State<TransactionsView> {
//   @override
//   Widget build(BuildContext context) {
//
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             topic("Your transactions"),
//             Expanded(
//               child: getTransactions(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
