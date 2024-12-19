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

Future<dynamic> updateShiftSummaryForEB(
  dynamic newInvoice,
  String currentMode,
  String prevMode,
  dynamic shift1,
) async {
  dynamic invoice;
  double reducePaymentTotal = 0.0;

  if (FFAppState().updatedInvoiceJson == null) {
    reducePaymentTotal = newInvoice["finalBillAmt"]!.toDouble();
  } else if (FFAppState().updatedInvoiceJson == "") {
    reducePaymentTotal = newInvoice["finalBillAmt"]!.toDouble();
  } else {
    invoice = FFAppState().updatedInvoiceJson;
    reducePaymentTotal = invoice["finalBillAmt"]!.toDouble();
  }

  double addPaymentTotal = newInvoice["finalBillAmt"]!.toDouble();

  List<dynamic> shift = [];
  shift.add(shift1);
  if (reducePaymentTotal == addPaymentTotal) {
    for (int i = 0; i < shift.length; i++) {
      final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);

      paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() +
          (prevMode == "CASH"
              ? -reducePaymentTotal
              : currentMode == "CASH"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "CASH"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);
      shift[0]["cashSale"] = paymentJsonData["cash"];
      paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() +
          (prevMode == "CREDIT"
              ? -reducePaymentTotal
              : currentMode == "CREDIT"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "CREDIT"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);

      paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() +
          (prevMode == "GOOGLEPAY"
              ? -reducePaymentTotal
              : currentMode == "GOOGLEPAY"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "GOOGLEPAY"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);

      paymentJsonData["other"] = paymentJsonData["other"].toDouble() +
          (prevMode == "OTHER"
              ? -reducePaymentTotal
              : currentMode == "OTHER"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "OTHER"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);
      paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() +
          (prevMode == "CHEQUE"
              ? -reducePaymentTotal
              : currentMode == "CHEQUE"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "CHEQUE"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);
      paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
          (prevMode == "PHONEPE"
              ? (-reducePaymentTotal)
              : currentMode == "PHONEPE"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "PHONEPE"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);
      paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() +
          (prevMode == "PAYTM"
              ? -reducePaymentTotal
              : currentMode == "PAYTM"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "PAYTM"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);

      paymentJsonData["card"] = paymentJsonData["card"].toDouble() +
          (prevMode == "CARD"
              ? -reducePaymentTotal
              : currentMode == "CARD"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "CARD"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);

      var paymentJsonDataString = jsonEncode(paymentJsonData).toString();
      shift[i]["paymentJson"] = paymentJsonDataString;
    }
    // shift[0]["totalSale"] = (shift[0]["totalSale"] - invoice["finalBillAmt"]) +newInvoice["finalBillAmt"];
    FFAppState().curMode = "";
    FFAppState().prevMode = "";
    FFAppState().updatedInvoiceJson = "";
  } else {
    for (int i = 0; i < shift.length; i++) {
      final paymentJsonData = jsonDecode(shift[i]["paymentJson"]);

      paymentJsonData["cash"] = paymentJsonData["cash"].toDouble() +
          (prevMode == "CASH"
              ? -reducePaymentTotal
              : currentMode == "CASH"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "CASH"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);
      shift[0]["cashSale"] = paymentJsonData["cash"];
      paymentJsonData["credit"] = paymentJsonData["credit"].toDouble() +
          (prevMode == "CREDIT"
              ? -reducePaymentTotal
              : currentMode == "CREDIT"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "CREDIT"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);

      paymentJsonData["googlepay"] = paymentJsonData["googlepay"].toDouble() +
          (prevMode == "GOOGLEPAY"
              ? -reducePaymentTotal
              : currentMode == "GOOGLEPAY"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "GOOGLEPAY"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);

      paymentJsonData["other"] = paymentJsonData["other"].toDouble() +
          (prevMode == "OTHER"
              ? -reducePaymentTotal
              : currentMode == "OTHER"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "OTHER"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);
      paymentJsonData["cheque"] = paymentJsonData["cheque"].toDouble() +
          (prevMode == "CHEQUE"
              ? -reducePaymentTotal
              : currentMode == "CHEQUE"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "CHEQUE"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);
      paymentJsonData["phonepe"] = paymentJsonData["phonepe"].toDouble() +
          (prevMode == "PHONEPE"
              ? -reducePaymentTotal
              : currentMode == "PHONEPE"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "PHONEPE"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);
      paymentJsonData["paytm"] = paymentJsonData["paytm"].toDouble() +
          (prevMode == "PAYTM"
              ? -reducePaymentTotal
              : currentMode == "PAYTM"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "PAYTM"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);

      paymentJsonData["card"] = paymentJsonData["card"].toDouble() +
          (prevMode == "CARD"
              ? -reducePaymentTotal
              : currentMode == "CARD"
                  ? addPaymentTotal
                  : newInvoice["paymentMode"] == "CARD"
                      ? -(invoice["finalBillAmt"]!.toDouble() -
                          newInvoice["finalBillAmt"]!.toDouble())
                      : 0);

      var paymentJsonDataString = jsonEncode(paymentJsonData).toString();
      shift[i]["paymentJson"] = paymentJsonDataString;
    }
    shift[0]["totalSale"] = (shift[0]["totalSale"] - invoice["finalBillAmt"]) +
        newInvoice["finalBillAmt"];
    FFAppState().curMode = "";
    FFAppState().prevMode = "";
    FFAppState().updatedInvoiceJson = "";
  }

  return shift[0];
}
