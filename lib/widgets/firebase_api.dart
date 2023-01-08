import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/transaction_model.dart';

class FirebaseApi {
  static Future<String> createTransaction(TransactionModel transaction) async {
    final docTransaction =
        FirebaseFirestore.instance.collection('transactions').doc();
    transaction.id = docTransaction.id;
    await docTransaction.set(transaction.toJson());
    return docTransaction.id;
  }
}
