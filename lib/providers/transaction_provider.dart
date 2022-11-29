import 'package:database/database/transaction_db.dart';
import 'package:database/models/Transactions.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transactions> transactions = [];

  //ดึงข้อมูล
  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statrment) async {
    var db = await TransactionDB(dbName: "transaction.db").openDatabase();
    print(db);
    transactions.insert(0, statrment);
    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
