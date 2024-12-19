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

Future<List<ShiftDetailsStruct>?> hiveGetShiftDetails() async {
  // Add your function code here!
  await shiftDetailBox;

  //how many items are in the hive box?
  final int boxcount = shiftDetailBox.length;

  List<ShiftDetailsStruct> itemFlowConverted = [];

  // for loop through the box and convert each item to <Item> datatype then into a list of <Item> datatypes
  for (int i = 0; i < boxcount; i++) {
    final dynamic key = shiftDetailBox.keyAt(i); // Use dynamic type for key
    final item = shiftDetailBox.getAt(i);
    var capturedid = item.id;
    var capturedbillCount = item.billCount;
    var captureddayId = item.dayId;
    var capturedlastBillNo = item.lastBillNo;
    var capturedlastBillTime = item.lastBillTime;
    var capturedtax = item.tax;
    var captureddeliveryCharges = item.deliveryCharges;
    var capturedcode = item.code;
    var capturedendTime = item.endTime;
    var capturedadvanceAmtTotal = item.advanceAmtTotal;
    var capturedcustomerReciveAmtTotal = item.customerReciveAmtTotal;
    var captureddiscount = item.discount;
    var capturedexpensesAmtTotal = item.expensesAmtTotal;
    var capturedopeningAmt = item.openingAmt;
    var capturedreceiveAmtTotal = item.receiveAmtTotal;

    var capturedrefoundAmount = item.refoundAmount;
    var capturedtotalSale = item.totalSale;
    var capturedroundOff = item.roundOff;
    var capturedcashInHand = item.cashInHand;
    var capturedcashSale = item.cashSale;
    var capturedstartTime = item.startTime;
    var capturedinActive = item.inActive;
    var capturedshiftNo = item.shiftNo;
    var capturedsubTotalBill = item.subTotalBill;
    var captureduserId = item.userId;
    var captureddeviceId = item.deviceId;
    var capturedpaymentJson = item.paymentJson;
    var capturedproductSaleList = item.productSaleList;
    var capturedshiftId = item.shiftId;
    var capturednewIDShift = item.newIDShift;
    var capturedsynC = item.synC;
    var capturedversion = item.version;

    // Check if key is a valid int
    int parsedKey = key is int ? key : 9999;

    ShiftDetailsStruct itemPreConvert = ShiftDetailsStruct(
      hivekey: parsedKey,
      id: capturedid ?? '',
      billCount: capturedbillCount ?? 00, // Add the missing fields
      dayId: captureddayId ?? '',
      lastBillNo: capturedlastBillNo ?? '',
      lastBillTime: capturedlastBillTime ?? 00,
      tax: capturedtax ?? 0.00,
      deliveryCharges: captureddeliveryCharges ?? 0.00,

      code: capturedcode ?? 00,
      endTime: capturedendTime ?? 0,
      advanceAmtTotal: capturedadvanceAmtTotal ?? 0.00,
      customerReciveAmtTotal: capturedcustomerReciveAmtTotal ?? 0.00,
      discount: captureddiscount ?? 0.00,
      expensesAmtTotal: capturedexpensesAmtTotal ?? 0.00,

      openingAmt: capturedopeningAmt ?? 0.00,
      receiveAmtTotal: capturedreceiveAmtTotal ?? 0.00,
      refoundAmount: capturedrefoundAmount ?? 0.00,
      totalSale: capturedtotalSale ?? 0.00,
      roundOff: capturedroundOff ?? 0.00,
      cashInHand: capturedcashInHand ?? 0.00,
      cashSale: capturedcashSale ?? 0.00,
      startTime: capturedstartTime ?? 00,
      inActive: capturedinActive ?? '',
      shiftNo: capturedshiftNo ?? 00,
      subTotalBill: capturedsubTotalBill ?? 0.00,
      userId: captureduserId ?? '',
      deviceId: captureddeviceId ?? '',
      paymentJson: capturedpaymentJson ?? '',
      productSaleList: capturedproductSaleList ?? '',
      shiftId: capturedshiftId ?? '',
      newIDShift: capturednewIDShift ?? 00,
      synC: capturedsynC ?? false,
      version: capturedversion ?? 0,
    );

    itemFlowConverted.add(itemPreConvert);
  }

  // this MAKES the most recent ITEM on top OF THE LIST PAGE...using 'reversed'
  itemFlowConverted = itemFlowConverted.reversed.toList();
  //print('shiftdatahive');
  // print(itemFlowConverted);
  return itemFlowConverted;
}
