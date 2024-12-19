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

Future<List<InvoiceStructStruct>?> hiveGetInvoices() async {
  // Add your function code here!
  await invoiceBox;

  //how many items are in the hive box?
  final int boxcount = invoiceBox.length;

  List<InvoiceStructStruct> itemFlowConverted = [];

  // for loop through the box and convert each item to <Item> datatype then into a list of <Item> datatypes
  for (int i = 0; i < boxcount; i++) {
    final dynamic key = invoiceBox.keyAt(i); // Use dynamic type for key
    final item = invoiceBox.getAt(i);
    var capturedid = item.id;
    var capturedinvoice = item.invoice;
    var capturedparty = item.party;
    var capturedinvoiceDate = item.invoiceDate;
    var captureddayId = item.dayId;
    var capturedpaymentMode = item.paymentMode;
    var captureddiscountAmt = item.discountAmt;
    var captureddiscountPer = item.discountPer;
    var captureddelliveryChrg = item.delliveryChrg;
    var capturedtaxAmt = item.taxAmt;
    var capturedbillAmt = item.billAmt;
    var capturedfinalBillAmt = item.finalBillAmt;
    var capturedroundOff = item.roundOff;
    var capturedproductList = item.productList;
    var capturedshiftId = item.shiftId;
    var capturedsynC = item.synC;
    var capturedversion = item.version;

    // Check if key is a valid int
    int parsedKey = key is int ? key : 9999;

    InvoiceStructStruct itemPreConvert = InvoiceStructStruct(
      hivekey: parsedKey,
      id: capturedid ?? '',
      invoice: capturedinvoice ?? '', // Add the missing fields
      party: capturedparty ?? '',
      invoiceDate: capturedinvoiceDate ?? '',
      dayId: captureddayId ?? '',
      paymentMode: capturedpaymentMode ?? '',
      discountAmt: captureddiscountAmt ?? 0.0,
      discountPer: captureddiscountPer ?? 0.0,
      delliveryChrg: captureddelliveryChrg ?? 0.0,
      taxAmt: capturedtaxAmt ?? 0.0,
      billAmt: capturedbillAmt ?? 0.0,
      finalBillAmt: capturedfinalBillAmt ?? 0.0,
      roundOff: capturedroundOff ?? 0.0,
      productList: capturedproductList ?? '',
      shiftId: capturedshiftId ?? '',
      synC: capturedsynC ?? '',
      version: capturedversion ?? '',
    );

    itemFlowConverted.add(itemPreConvert);
  }

  // this MAKES the most recent ITEM on top OF THE LIST PAGE...using 'reversed'
  itemFlowConverted = itemFlowConverted.reversed.toList();
  // print(itemFlowConverted);
  return itemFlowConverted;
}
