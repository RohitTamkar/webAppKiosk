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

import 'package:hive_flutter/hive_flutter.dart';
import 'setup_item_hive.dart';

Future<InvoiceStructStruct> addInvoiceBillhive(
  String id,
  String invoice,
  String party,
  int invoiceDate,
  String dayId,
  String paymentMode,
  double discountAmt,
  double discountPer,
  double delliveryChrg,
  double taxAmt,
  double billAmt,
  double finalBillAmt,
  double roundOff,
  List<SelItemListStruct>? productlist,
  String shiftId,
  bool synC,
  int version,
) async {
  invoice = invoice ?? '';
  party = party ?? '';
  invoiceDate = invoiceDate;
  dayId = dayId ?? '';
  paymentMode = paymentMode ?? '';
  discountAmt = discountAmt;
  discountPer = discountPer;
  delliveryChrg = delliveryChrg;
  taxAmt = taxAmt;
  billAmt = billAmt;
  finalBillAmt = finalBillAmt;
  roundOff = roundOff;
  shiftId = shiftId ?? '';

  invoiceBox.add(InvoiceStructStruct(
      id: id,
      invoice: invoice,
      party: party,
      invoiceDate: invoiceDate,
      dayId: dayId,
      paymentMode: paymentMode,
      discountAmt: discountAmt,
      discountPer: discountPer,
      delliveryChrg: delliveryChrg,
      taxAmt: taxAmt,
      billAmt: billAmt,
      finalBillAmt: finalBillAmt,
      roundOff: roundOff,
      productList: productlist,
      shiftId: shiftId,
      synC: synC,
      version: version));
  print(invoiceBox.values);
  return InvoiceStructStruct(
      id: id,
      invoice: invoice,
      party: party,
      invoiceDate: invoiceDate,
      dayId: dayId,
      paymentMode: paymentMode,
      discountAmt: discountAmt,
      discountPer: discountPer,
      delliveryChrg: delliveryChrg,
      taxAmt: taxAmt,
      billAmt: billAmt,
      finalBillAmt: finalBillAmt,
      roundOff: roundOff,
      productList: productlist,
      shiftId: shiftId,
      synC: synC,
      version: version);
}
