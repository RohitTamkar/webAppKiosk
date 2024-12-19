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

Future<double> calSubTotalForHoldList2(
  String billNo,
  List<dynamic> allBillList,
) async {
  double total = 0;
  double qty = 0;
  double tax = 0;
//  print(obj.length);
  print(
      "----------------------------------------------------2B---------------------------------------------------------------");
  List<dynamic> itemList = [];
  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"].toString() == billNo) {
        if (allBillList[i]["details"]["itemList"].length > 0) {
          itemList = (allBillList[i]["details"]["itemList"]);
          if (itemList.isNotEmpty) {
            for (int i = 0; i < itemList.length; i++) {
              /*  if (itemList[i]["taxPer"] > 0.0) {
                total += itemList[i]["quantity"] * itemList[i]["price"] +
                    itemList[i]["taxAmt"];
              } else {
                total += itemList[i]["quantity"] * itemList[i]["price"];
              }*/
              total += itemList[i]["total"];
              qty += itemList[i]["quantity"];
              print("total");
              print(total);
            }
            FFAppState().subTotal = total.toDouble();
            FFAppState().finalAmt = total.toDouble();

            FFAppState().billAmt = total.toDouble();
            FFAppState().totalQuantity = qty.toDouble();
            FFAppState().noOfItems = itemList.length;
          }
          break;
        }
      }
    }
  }
  return total.roundToDouble();
}
