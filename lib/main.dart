import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tes_flutter/history.dart';
import 'package:tes_flutter/network/getdata.dart';
import 'package:tes_flutter/state/balance.dart';
import 'package:tes_flutter/state/locator.dart';
import 'package:tes_flutter/state/transaction.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Balance>(
      model: locator<Balance>(),
      child: MaterialApp(
        home: Payme(),
      ),
    );
  }
}

class Payme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentBalance =
        ScopedModel.of<Balance>(context, rebuildOnChange: true).currentBalance;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.dribbble.com/users/310943/screenshots/5651737/in-store_purchase_2x.png"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        )),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "N657HUI",
                          style: TextStyle(
                              fontFamily: "Regular",
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Muhammad Ilzam Mulkhaq",
                          style: TextStyle(
                              fontFamily: "Regular",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500]),
                        ),
                      ],
                    ),
                    Container(
                      height: 64.0,
                      width: 64.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.dribbble.com/users/1488946/screenshots/6212020/111111_2x.png"),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sisa Saldo : ",
                      style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "$currentBalance",
                      style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ]),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Pilih Metode",
                      style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 4.0,
                      children: <Widget>[
                        ScopedModelDescendant<Balance>(
                          builder: (context, child, balance) => GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.0, vertical: 18.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Masukkan Kode Anda',
                                              style: TextStyle(
                                                  fontFamily: "Regular",
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: TextField(
                                                onSubmitted: (value) async {
                                                  int result =
                                                      await locator<GetData>()
                                                          .getData(value);
                                                  Transaction transaction =
                                                      Transaction(result,
                                                          "Top Up Saldo");
                                                  balance.currentBalance =
                                                      result;
                                                  balance.addTransaction =
                                                      transaction;
                                                    if (result == null) {
                                                      
                                                    }
                                                },
                                                decoration: InputDecoration(
                                                    hintText: 'Kode Anda'),
                                                autofocus: true,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ));
                            },
                            child: Container(
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://cdn.dribbble.com/users/623808/screenshots/5968034/bitcoin-3_2x.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 70.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.dribbble.com/users/161337/screenshots/970572/filthyrich.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => History()
                            ));
                          },
                          child: Container(
                            height: 70.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.dribbble.com/users/1162077/screenshots/3451058/blackboard.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
