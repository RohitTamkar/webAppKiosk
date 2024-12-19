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

Future<ShiftDetailsStruct> hiveShiftCrud(
  int? newIDShift,
  ShiftDetailsStruct? itemBlob,
  String actionType,
) async {
  shiftDetailBox = await Hive.openBox<ShiftDetailsStruct>('shiftDetails');

  newIDShift = newIDShift ?? 999;

  if (itemBlob == null) {
    itemBlob = createShiftDetailsStruct(
      id: '',
      billCount: 00,
      dayId: '',
      lastBillNo: '',
      lastBillTime: 00,
      tax: 0,
      deliveryCharges: 0.00,
      code: 00,
      endTime: 00,
      advanceAmtTotal: 00.0,
      customerReciveAmtTotal: 00.0,
      discount: 00.0,
      expensesAmtTotal: 00.0,
      openingAmt: 0.00,
      receiveAmtTotal: 0.00,
      refoundAmount: 0.00,
      totalSale: 0.00,
      roundOff: 00,
      cashInHand: 0.00,
      //  productList: [],
      cashSale: 0.00,
      startTime: 00,
      inActive: false,

      shiftNo: 00,
      subTotalBill: 00,
      userId: '',
      deviceId: '',
      paymentJson: '',
      //productSaleList: '',
      shiftId: '',
      synC: false,
      version: 0,
    );
  }

  // add the new item into the Hive box
  switch (actionType) {
    case 'update':
      ShiftDetailsStruct returningData = itemBlob;
      print('hi$returningData.dayId');
      await shiftDetailBox.put(
        returningData.hivekey,
        ShiftDetailsStruct(
          id: returningData.id,
          billCount: returningData.billCount,
          dayId: returningData.dayId,
          lastBillNo: returningData.lastBillNo,
          lastBillTime: returningData.lastBillTime,
          tax: returningData.tax,
          deliveryCharges: returningData.deliveryCharges,
          code: returningData.code,
          endTime: returningData.endTime,
          advanceAmtTotal: returningData.advanceAmtTotal,
          customerReciveAmtTotal: returningData.customerReciveAmtTotal,
          discount: returningData.discount,
          expensesAmtTotal: returningData.expensesAmtTotal,
          openingAmt: returningData.openingAmt,
          receiveAmtTotal: returningData.receiveAmtTotal,
          refoundAmount: returningData.refoundAmount,
          totalSale: returningData.totalSale,
          roundOff: returningData.roundOff,
          cashInHand: returningData.cashInHand,
          cashSale: returningData.cashSale,
          startTime: returningData.startTime,
          inActive: returningData.inActive,
          shiftNo: returningData.shiftNo,
          subTotalBill: returningData.subTotalBill,
          userId: returningData.userId,
          deviceId: returningData.deviceId,
          paymentJson: returningData.paymentJson,
          productSaleList: returningData.productSaleList,
          //productSaleList: '',
          shiftId: returningData.shiftId,
          newIDShift: returningData.newIDShift,
          synC: returningData.synC,
          version: returningData.version,
        ),
      );
      return returningData;
      break;
    case 'create':
      ShiftDetailsStruct returningData = itemBlob;
      print(returningData.dayId);
      await shiftDetailBox.add(
        ShiftDetailsStruct(
          id: returningData.id,
          billCount: returningData.billCount,
          dayId: returningData.dayId,
          lastBillNo: returningData.lastBillNo,
          lastBillTime: returningData.lastBillTime,
          tax: returningData.tax,
          deliveryCharges: returningData.deliveryCharges,
          code: returningData.code,
          endTime: returningData.endTime,
          advanceAmtTotal: returningData.advanceAmtTotal,
          customerReciveAmtTotal: returningData.customerReciveAmtTotal,
          discount: returningData.discount,
          expensesAmtTotal: returningData.expensesAmtTotal,
          openingAmt: returningData.openingAmt,
          receiveAmtTotal: returningData.receiveAmtTotal,
          refoundAmount: returningData.refoundAmount,
          totalSale: returningData.totalSale,
          roundOff: returningData.roundOff,
          cashInHand: returningData.cashInHand,
          cashSale: returningData.cashSale,
          startTime: returningData.startTime,
          inActive: returningData.inActive,
          shiftNo: returningData.shiftNo,
          subTotalBill: returningData.subTotalBill,
          userId: returningData.userId,
          deviceId: returningData.deviceId,
          paymentJson: returningData.paymentJson,
          productSaleList: returningData.productSaleList,
          shiftId: returningData.shiftId,
          newIDShift: returningData.newIDShift,
          synC: returningData.synC,
          version: returningData.version,
        ),
      );
      print(returningData);
      return returningData;
      break;
    case 'delete':
      await shiftDetailBox.delete(newIDShift);
      break;
    case 'get':
      // Find the hivekey based on newIDShift
      int? hivekey = await findHiveKeyByNewIDShift(newIDShift);

      if (hivekey != null) {
        // Use the found hivekey to get the item
        ShiftDetailsStruct? itemBlob = await shiftDetailBox.get(hivekey);
        if (itemBlob != null) {
          print('get');
          print(itemBlob);
          return itemBlob;
        }
      } else {
        // If no item is found, return a default ShiftDetailsStruct
        print('else');
        print(newIDShift);
        return ShiftDetailsStruct(newIDShift: newIDShift);
      }
      break;

// Function to find hivekey based on newIDShift

    default:
      throw Exception('Unsupported action type: $actionType');
  }
  return itemBlob;
}

Future<int?> findHiveKeyByNewIDShift(int newIDShift) async {
  // Iterate through keys in the Hive box and find the corresponding hivekey
  for (var key in shiftDetailBox.keys) {
    ShiftDetailsStruct? item = await shiftDetailBox.get(key);
    if (item != null && item.newIDShift == newIDShift) {
      return key;
    }
  }

  // Return null if no match is found
  return null;
}
