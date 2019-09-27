import 'package:scoped_model/scoped_model.dart';
import 'package:tes_flutter/state/transaction.dart';

class Balance extends Model {

  int _currentBalance = 1000;
  List<Transaction> _history = [];
  //getter nya
  int get currentBalance => _currentBalance;
  List<Transaction> get transaction =>_history;
  //setternya
  set currentBalance(int newBalance){
    _currentBalance += newBalance;
    notifyListeners();
  }

  //081217141850

  //Filled Stacks

  set addTransaction(Transaction transaction){
   _history.add(transaction);
    notifyListeners();
  }

}