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

import 'dart:convert';

Future<dynamic> calShiftSummaryNewgrocery(
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
  dynamic payJson = FFAppState().groceryJson["paymentMode"];
  print(payJson);

  for (int i = 0; i < shift.length; i++) {
    shift[i]["lastBillNo"] = invoice.invoice;
    // shift[i]["billAmt"] = shift[i]["billAmt"] + invoice.billAmt;
    shift[i]["deliveryCharges"] =
        shift[i]["deliveryCharges"] + invoice.delliveryChrg;
    shift[i]["discount"] = shift[i]["discount"] + invoice.discountAmt;
    shift[i]["tax"] = shift[i]["tax"] + invoice.taxAmt;
    shift[i]["totalSale"] = shift[i]["totalSale"] + total;
    // shift[i]["subTotalBill"] = shift[i]["subTotalBill"] + invoice.billAmt;
    if (payJson['CASH'] != null) {
      print(payJson["CASH"]);
      shift[i]["cashSale"] = shift[i]["cashSale"].toDouble() + payJson['CASH'];
    }

    /*
         shift[i]["creditSale"] = shift[i]["creditSale"].toDouble() +
        (invoice.paymentMode == "CREDIT"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["googlePay"] = shift[i]["googlePay"].toDouble() +
        (invoice.paymentMode == "GOOGLEPAY"
            ? invoice.finalBillAmt!.toDouble()
            : 0);
    shift[i]["paytm"] = shift[i]["paytm"].toDouble()+
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
        : 0
        );
        */
    final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);
    if (payJson['CASH'] != null) {
      paymentJsonData["cash"] =
          paymentJsonData["cash"].toDouble() + (payJson['CASH'].toDouble());
    }
    if (payJson['CREDIT'] != null) {
      paymentJsonData["credit"] =
          paymentJsonData["credit"].toDouble() + payJson['CREDIT'];
    }
    if (payJson['GOOGLEPAY'] != null) {
      paymentJsonData["googlepay"] =
          paymentJsonData["googlepay"].toDouble() + payJson['GOOGLEPAY'];
    }
    if (payJson['PAYTM'] != null) {
      paymentJsonData["paytm"] =
          paymentJsonData["paytm"].toDouble() + payJson['PAYTM'];
    }
    if (payJson['PHONEPE'] != null) {
      paymentJsonData["phonepe"] =
          paymentJsonData["phonepe"].toDouble() + payJson['PHONEPE'];
    }
    if (payJson['CHEQUE'] != null) {
      paymentJsonData["cheque"] =
          paymentJsonData["cheque"].toDouble() + payJson['CHEQUE'];
    }
    if (payJson['OTHER'] != null) {
      paymentJsonData["other"] =
          paymentJsonData["other"].toDouble() + payJson['OTHER'];
    }
    if (payJson['CARD'] != null) {
      paymentJsonData["card"] =
          paymentJsonData["card"].toDouble() + payJson['CARD'];
    }

    var paymentJsonDataString = jsonEncode(paymentJsonData).toString();
    shift[i]["paymentJson"] = paymentJsonDataString;
  }

  return shift[0];
}
