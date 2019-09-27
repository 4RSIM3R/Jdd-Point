import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tes_flutter/state/balance.dart';

class History extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ScopedModelDescendant<Balance>(
            builder:(context, child, balance) => ListView.builder(
            itemCount: balance.transaction.length,
            itemBuilder: (context, index) {
              if (balance.transaction.length == 0) {
                return Center(
                  child: Text("Belum Ada Transaksi"),
                );
              }
              return ListTile(
                title: Text("${balance.transaction[index].note}"),
                subtitle: Text("${balance.transaction[index].amount}"),
              );
            },
          ),
        ),
      ),
    );
  }
}