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

import 'dart:convert';

Future<dynamic> todaysSummary(List<ShiftRecord> dataList) async {
  List<dynamic> shiftList = [];
  List<dynamic> payment = [];
  shiftList.add({
    "cash": 0.0,
    "card": 0.0,
    "cheque": 0.0,
    "credit": 0.0,
    "digital": 0.0,
    "credRec": 0.0,
    "delivery": 0.0,
    "discount": 0.0,
    "refund": 0.0,
    "roundOff": 0.0,
    "expenses": 0.0,
    "advance": 0.0,
    "recAmount": 0.0,
    "upi": 0.0,
    "cashInHand": 0.0,
    "totalSale": 0.0,
    "openingBalance": 0.0,
    "noOfBills": 0,
    "tax": 0.0,
    "paytm": 0.0,
    "phonePe": 0.0,
    "googlePay": 0.0,
    "other": 0.0,
    "paymentJson": ""
  });
  payment.add({
    "cash": 0.0,
    "card": 0.0,
    "cheque": 0.0,
    "credit": 0.0,
    "paytm": 0.0,
    "phonepe": 0.0,
    "googlepay": 0.0,
    "other": 0.0,
  });
  print(shiftList);
  if (dataList.isNotEmpty) {
    dataList.forEach((item) {
      shiftList[0]["shiftId"] = item.shiftId;
      shiftList[0]["billCount"] = item.billCount;

      shiftList[0]["shiftTimeIn"] = item.startTime;
      shiftList[0]["shiftTimeOut"] = item.endTime;

      shiftList[0]["discount"] += item.discount;
      shiftList[0]["delivery"] += item.deliveryCharges;

      shiftList[0]["roundOff"] += item.roundOff;
      shiftList[0]["refund"] += item.refoundAmount;
      shiftList[0]["expenses"] += item.expensesAmtTotal;
      shiftList[0]["advance"] += item.advanceAmtTotal;
      shiftList[0]["recAmount"] += item.receiveAmtTotal;
      // shiftList[0]["upi"] = item.digitalSale! +
      //   shiftList[0]["paytm"] +
      //   shiftList[0]["phonePe"] +
      //   shiftList[0]["googlePay"];

      shiftList[0]["totalSale"] += item.totalSale;
      shiftList[0]["openingBalance"] += item.openingAmt;
      shiftList[0]["noOfBills"] += item.billCount;
      shiftList[0]["tax"] += item.tax;
      //shiftList[0]["paytm"] += item.paytm;
      //shiftList[0]["phonePe"] += item.phonePe;
      // shiftList[0]["googlePay"] += item.googlePay;
      // shiftList[0]["credRec"] += item.credReci;
      shiftList[0]["cashInHand"] = shiftList[0]["cash"];

      //

      final paymentJsonData = jsonDecode(item.paymentJson!);
      payment[0]["cash"] += paymentJsonData["cash"].toDouble();
      payment[0]["credit"] += paymentJsonData["credit"].toDouble();
      payment[0]["googlepay"] += paymentJsonData["googlepay"].toDouble();
      payment[0]["paytm"] += paymentJsonData["paytm"].toDouble();
      payment[0]["phonepe"] += paymentJsonData["phonepe"].toDouble();
      payment[0]["cheque"] += paymentJsonData["cheque"].toDouble();
      payment[0]["other"] += paymentJsonData["other"].toDouble();
      payment[0]["card"] += paymentJsonData["card"].toDouble();

      shiftList[0]["paytm"] = payment[0]["paytm"];
      shiftList[0]["phonePe"] = payment[0]["phonepe"];
      shiftList[0]["googlePay"] = payment[0]["googlepay"];
      shiftList[0]["cheque"] = payment[0]["cheque"];
      shiftList[0]["other"] = payment[0]["other"];
      shiftList[0]["card"] = payment[0]["card"];
      shiftList[0]["cash"] = payment[0]["cash"];
      shiftList[0]["credit"] = payment[0]["credit"];

      var paymentJsonDataString = jsonEncode(payment[0]).toString();
      shiftList[0]["paymentJson"] = paymentJsonDataString;
      //
    });
    print(shiftList);
    FFAppState().todaysTotal = shiftList;
    FFAppState().summaryJSON = shiftList[0];
  }
  return shiftList[0];
}
