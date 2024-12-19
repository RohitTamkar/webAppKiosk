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
import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'dart:convert';

Future<dynamic> calShiftSummaryNew(
  InvoiceStructStruct invoice,
  dynamic shift1,
) async {
  // Add your function code here!
  print("invoice");
  print(invoice);
  double? total = invoice.finalBillAmt;
  print(shift1);
  List<dynamic> shift = [];
  shift.add(shift1);
  dynamic payJson;
  if (FFAppState().groceryJson != null) {
    payJson = FFAppState().groceryJson["paymentMode"];
  }

  for (int i = 0; i < shift.length; i++) {
    shift[i]["lastBillNo"] = invoice.invoice;
    // shift[i]["billAmt"] = shift[i]["billAmt"] + invoice.billAmt;
    shift[i]["deliveryCharges"] =
        shift[i]["deliveryCharges"] + invoice.delliveryChrg;
    shift[i]["discount"] = shift[i]["discount"] + invoice.discountAmt;
    shift[i]["tax"] = shift[i]["tax"] + invoice.taxAmt;
    shift[i]["totalSale"] = shift[i]["totalSale"] + total;
    // shift[i]["subTotalBill"] = shift[i]["subTotalBill"] + invoice.billAmt;
    shift[i]["cashSale"] = shift[i]["cashSale"].toDouble() +
        (invoice.paymentMode == "CASH" ? invoice.finalBillAmt!.toDouble() : 0);
    /*
    shift[i]["creditSale"] = shift[i]["creditSale"].toDouble() +
        (invoice.paymentMode == "CREDIT"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["googlePay"] = shift[i]["googlePay"].toDouble() +
        (invoice.paymentMode == "GOOGLEPAY"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["paytm"] = shift[i]["paytm"].toDouble() +
        (invoice.paymentMode == "PAYTM" ? invoice.finalBillAmt!.toDouble() : 0);
    shift[i]["phonePe"] = shift[i]["phonePe"].toDouble() +
        (invoice.paymentMode == "PHONEPAY"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["cheque"] = shift[i]["cheque"].toDouble() +
        (invoice.paymentMode == "CHEQUE"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
     shift[i]["other"] = shift[i]["other"].toDouble() +
        (invoice.paymentMode == "OTHER" ? invoice.finalBillAmt!.toDouble() : 0);
     shift[i]["digitalSale"] = shift[i]["digitalSale"] +
        (invoice.paymentMode == "DIGITAL"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["card"] = shift[i]["card"].toDouble() +(invoice.paymentMode == "CARD"
        ? invoice.finalBillAmt!.toDouble()
        : 0);*/
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);
    paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() +
        (invoice.paymentMode == "CASH" ? invoice.finalBillAmt!.toDouble() : 0);
    paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() +
        (invoice.paymentMode == "CREDIT"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() +
        (invoice.paymentMode == "GOOGLEPAY"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() +
        (invoice.paymentMode == "PAYTM" ? invoice.finalBillAmt!.toDouble() : 0);
    paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
        (invoice.paymentMode == "PHONEPE"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() +
        (invoice.paymentMode == "CHEQUE"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    paymentJsonData["other"] = paymentJsonData["other"].toDouble() +
        (invoice.paymentMode == "OTHER" ? invoice.finalBillAmt!.toDouble() : 0);
    paymentJsonData["card"] = paymentJsonData["card"].toDouble() +
        (invoice.paymentMode == "CARD" ? invoice.finalBillAmt!.toDouble() : 0);
    if (invoice.paymentMode == "CASH&PAYTM") {
      paymentJsonData["cash"] =
          paymentJsonData["cash"].toDouble() + (payJson['CASH'].toDouble());
      paymentJsonData["paytm"] =
          paymentJsonData["paytm"].toDouble() + (payJson['PAYTM'].toDouble());
    }
    if (invoice.paymentMode == "CASH&GPAY") {
      paymentJsonData["cash"] =
          paymentJsonData["cash"].toDouble() + (payJson['CASH'].toDouble());
      paymentJsonData["googlepay"] = paymentJsonData["paytm"].toDouble() +
          (payJson['GOOGLEPAY'].toDouble());
    }
    if (invoice.paymentMode == "CASH&CARD") {
      paymentJsonData["cash"] =
          paymentJsonData["cash"].toDouble() + (payJson['CASH'].toDouble());
      paymentJsonData["card"] =
          paymentJsonData["card"].toDouble() + (payJson['CARD'].toDouble());
    }
    if (invoice.paymentMode == "CASH&PHONEPE") {
      paymentJsonData["cash"] =
          paymentJsonData["cash"].toDouble() + (payJson['CASH'].toDouble());
      paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
          (payJson['PHONEPE'].toDouble());
    }
    if (invoice.paymentMode == "CASH&OTHER") {
      paymentJsonData["cash"] =
          paymentJsonData["cash"].toDouble() + (payJson['CASH'].toDouble());
      paymentJsonData["other"] =
          paymentJsonData["other"].toDouble() + (payJson['OTHER'].toDouble());
    }

    var paymentJsonDataString = jsonEncode(paymentJsonData).toString();
    shift[i]["paymentJson"] = paymentJsonDataString;
  }

  return shift[0];
}
