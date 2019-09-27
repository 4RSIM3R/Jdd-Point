import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tes_flutter/serializer/serializer.dart';
import 'package:tes_flutter/state/balance.dart';
import 'package:tes_flutter/state/locator.dart';

class GetData {
  var serializer;
  var ress;
  var state = locator<Balance>();
  Future<String> getData(String token) async {
    final res = await http.get("https://api.myjson.com/bins/$token");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      serializer = Serializer.fromJson(data);
      if (serializer.result == 1) {
        ress = "Oke";
      state.currentBalance = 10;
      }

      return ress;
    }
    
  }
}

class Tes extends StatefulWidget {
  Tes({Key key}) : super(key: key);

  _TesState createState() => _TesState();
}

class _TesState extends State<Tes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index ){
          if () {
            
          }
        },
      ),
    );
  }
}

//https://api.myjson.com/bins/n6fxb -> 250
//https://api.myjson.com/bins/6kj8f -> 1000
//https://api.myjson.com/bins/10xn33 -> 500
//https://api.myjson.com/bins/eb63j -> 50