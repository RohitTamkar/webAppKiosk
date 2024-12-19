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

import 'index.dart'; // Imports other custom actions

Future<double> calBillAmtGroceryPay(
  double disAmt,
  double delChargs,
  double gstPer,
  String inclusiveorexclusive,
) async {
  double billAmt;
/*  print("----------------------------------------------------3C---------------------------------------------------------------");
  */
  billAmt = FFAppState().billAmt;
  if (disAmt > 0) {
    billAmt -= disAmt;
    print(disAmt);
  }
  if (delChargs > 0) {
    // FFAppState().delCharges = delChargs * FFAppState().noOfItems;
    billAmt += delChargs;
/* print(delChargs); */
  }
  if (gstPer > 0) {
    double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (billAmt * gstPer) / (100.0 + gstPer)
        : (billAmt * gstPer) / 100.0;
    FFAppState().taxAmtPay = taxAmtPerItem;
    billAmt += taxAmtPerItem;
  }
  FFAppState().finalAmt = billAmt.roundToDouble();

  print(billAmt);
  return billAmt.roundToDouble();
}
