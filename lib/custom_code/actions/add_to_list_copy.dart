// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> addToListCopy(ProductRecord? document) async {
  // Add your function code here!
  List<dynamic> list = FFAppState().itemCartList;
  var y = 1;
  print(document);
  final data = {
    "name": document!.name,
    "price": (document.sellingPrice)!.toDouble(),
    "quantity": y.toDouble()
  };

  var flag = false;
  if (list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      if (list[i]["name"] == data["name"]) {
        list[i]["quantity"]++;
        FFAppState().itemCartList = list;
        flag = true;
        break;
      }
    }
    if (!flag) {
      FFAppState().itemCartList.add(data);
    }
  } else {
    FFAppState().itemCartList.add(data);
  }

  /*

  if (list.contains(data) != true) {
    print(list);
    print("adding item");
    FFAppState().itemCartList.add(data);
  } else {
    print("updating item");
    int index = list.indexOf(data);
    print(index);
    list[index]["quantity"]++;
    FFAppState().itemCartList = list;
  }
*/
  return FFAppState().itemCartList;
}
