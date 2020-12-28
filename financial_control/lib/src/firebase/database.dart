import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_control/src/models/transaction_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference transactionCollections =
      FirebaseFirestore.instance.collection("transactions");

  Stream<List<TransactionModel>> get transactions {
    return transactionCollections
        .doc(uid)
        .collection("my_transactions")
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map(_transactionListFromSnapshot);
  }

  addTransaction(String name, double value, DateTime createdAt) async {
    return await transactionCollections
        .doc(uid)
        .collection("my_transactions")
        .add({"name": name, "value": value, "createdAt": createdAt});
  }

  removeTransaction(String transactionId) async {
    return await transactionCollections
        .doc(uid)
        .collection("my_transactions")
        .doc(transactionId)
        .delete();
  }

  updateTransaction(String transactionId, String name, double value) async {
    return await transactionCollections
        .doc(uid)
        .collection("my_transactions")
        .doc(transactionId)
        .update({"name": name, "value": value});
  }

  List<TransactionModel> _transactionListFromSnapshot(QuerySnapshot snapshot) {
    List<TransactionModel> transactions = new List();
    for (var doc in snapshot.docs) {
      transactions.add(TransactionModel.fromMap(doc.id, doc.data()));
    }
    return transactions;
  }
}
