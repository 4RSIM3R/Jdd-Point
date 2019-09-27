// import 'package:flutter/material.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:tes_flutter/state/info.dart';
// class Test extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: ScopedModelDescendant<Info>(
//             builder: (context, child, info) => Text("Nama Saya  Umur Saya ${info.currentAge}")
//           )
//         ),
//         floatingActionButton: ScopedModelDescendant<Info>(
//             builder:(context, child, info) => FloatingActionButton(
//             onPressed: () {
//              info.currentAge = 1;
//             },
//             backgroundColor: Colors.blueAccent[200],
//           ),
//         ));
//   }
// }