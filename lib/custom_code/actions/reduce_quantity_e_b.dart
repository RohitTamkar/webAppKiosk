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

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> reduceQuantityEB(dynamic obj) async {
  List<dynamic> itemList = [];

  itemList.add(FFAppState().selectedInvoiceJson);
  if (itemList[0]["productList"].isNotEmpty) {
    var index = itemList[0]["productList"].indexOf(obj);
    if (itemList[0]["productList"][index]["quantity"] > 0) {
      itemList[0]["productList"][index]["quantity"]--;
      itemList[0]["productList"][index]["total"] = itemList[0]["productList"]
              [index]["quantity"] *
          itemList[0]["productList"][index]["price"];

      FFAppState().selectedInvoiceJson = itemList[0];

      print(itemList);
    } else if (itemList[0]["productList"][index]["quantity"] <= 0) {
      itemList[0]["productList"][index]["isDeletedItem"] = true;
      itemList[0]["productList"][index]["quantity"] = 0;
      itemList[0]["productList"][index]["total"] = 0;

      FFAppState().selectedInvoiceJson = itemList[0];

      print(itemList);
    } else {
      itemList[0]["productList"][index]["isDeletedItem"] = true;
      itemList[0]["productList"][index]["quantity"] = 0;
      itemList[0]["productList"][index]["total"] = 0;
      FFAppState().selectedInvoiceJson = itemList[0];

      print(itemList);
    }
  }
  return itemList;
}
