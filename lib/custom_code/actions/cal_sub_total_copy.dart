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

import 'index.dart'; // Imports other custom actions

Future<double> calSubTotalCopy(dynamic obj) async {
  double total = 0;
  double qty = 0;
//  print(obj.length);
  FFAppState().updatedInvoiceJson = {"finalBillAmt": obj["finalBillAmt"]};

  List<dynamic> itemList = [];
  itemList = obj["productList"];

  for (int i = 0; i < obj["productList"].length; i++) {
    total += itemList[i]["quantity"] * itemList[i]["price"];
    qty += itemList[i]["quantity"];
    print(total);
  }
  obj["billAmt"] = total;
  obj["finalBillAmt"] =
      (total + obj["delliveryChrg"]) - (obj["discountAmt"] + obj["taxAmt"]);
  FFAppState().selectedInvoiceJson = obj;

  return total.toDouble();

  // Add your function code here!
}
