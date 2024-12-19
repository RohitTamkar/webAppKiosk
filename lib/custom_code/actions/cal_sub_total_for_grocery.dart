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

// Imports other custom actions

Future<double> calSubTotalForGrocery(
  String billNo,
  List<dynamic> allBillList,
) async {
  double total = 0;
  double qty = 0;
  double tax = 0;
  double disAmt = 0;
  double disPer = 0;

//  print(obj.length);
  List<dynamic> itemList = [];
  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"].toString() == billNo) {
        if (allBillList[i]["details"]["itemList"].length >= 0) {
          itemList = (allBillList[i]["details"]["itemList"]);
          if (itemList.isNotEmpty) {
            for (int i = 0; i < itemList.length; i++) {
              tax += itemList[i]["taxAmt"];
              disAmt += itemList[i]["disAmt"];
              disPer += itemList[i]["disPer"];
              //tax = 0;
              double tax2 = itemList[i]["taxPer"];
              itemList[i]["taxPer"] = tax2.roundToDouble();
              /*  if (itemList[i]["taxPer"] > 0.0) {
                total += itemList[i]["total"] ;
              } else {
                total += itemList[i]["total"] ;
              }*/
              tax.toStringAsFixed(2);
              total += itemList[i]["total"];
              qty += itemList[i]["quantity"];
              print("total");
              print(total);
            }
          }
          FFAppState().disPer = disPer.toDouble();
          FFAppState().disAmt = disAmt.toDouble();
          FFAppState().subTotal = total.toDouble();
          FFAppState().taxamt = tax.toDouble();
          FFAppState().billAmt = total.toDouble();
          FFAppState().totalQuantity = qty.toDouble();
          FFAppState().noOfItems = itemList.length;
          break;
        }
      }
    }
  }
  return total.roundToDouble();
}
