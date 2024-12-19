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

Future updateHiveInvoice(
    String? id,
    String? invoice,
    String? products,
    String? party,
    int? invoiceDate,
    String? dayId,
    String? paymentMode,
    double? discountAmt,
    double? discountPer,
    double? delliveryChrg,
    double? taxAmt,
    double? billAmt,
    double? finalBillAmt,
    int? createdDate,
    int? updatedDate,
    double? roundOff,
    String? updatedBy,
    int? code,
    String? partyMobNo,
    List<SelItemListStruct>? productList,
    String? createdBy,
    String? shiftId,
    bool? synC,
    int? hiveKey,
    int? version) async {
  invoiceBox = await Hive.openBox<InvoiceStructStruct>('invoice');
  // print('itemBox is open? ');
  //var question = itemBox.isOpen;
  // print(question);
  id = id ?? '';
  invoice = invoice ?? '';
  party = party ?? '';
  products = products;
  invoiceDate = invoiceDate ?? 00;
  dayId = dayId ?? '';
  paymentMode = paymentMode ?? '';
  discountAmt = discountAmt ?? 00.0;
  discountPer = discountPer ?? 00.0;
  delliveryChrg = delliveryChrg ?? 00.0;
  taxAmt = taxAmt ?? 00.0;
  billAmt = billAmt ?? 00.0;
  finalBillAmt = finalBillAmt ?? 00.0;
  roundOff = roundOff ?? 00.0;
  productList = productList;
  shiftId = shiftId ?? '';
  createdDate = createdDate ?? 00;
  updatedDate = updatedDate ?? 00;
  updatedBy = updatedBy ?? '';
  code = code ?? 00;
  partyMobNo = partyMobNo ?? '';
  createdBy = createdBy ?? '';
  synC = synC;
  version = version;
  // add the new item into the Hive box
  invoiceBox.put(
      hiveKey,
      InvoiceStructStruct(
          id: id,
          invoice: invoice,
          party: party,
          products: products,
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
          productList: productList,
          shiftId: shiftId,
          createdDate: createdDate,
          updatedDate: updatedDate,
          updatedBy: updatedBy,
          code: code,
          partyMobNo: partyMobNo,
          createdBy: createdBy,
          synC: synC,
          version: version));
  print(invoiceBox.values);
}
