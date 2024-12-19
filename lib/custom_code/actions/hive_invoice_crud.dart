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

Future<InvoiceStructStruct> hiveInvoiceCrud(
  int? hivekey,
  InvoiceStructStruct? itemBlob,
  String actionType,
) async {
  invoiceBox = await Hive.openBox<InvoiceStructStruct>('invoice');

  hivekey = hivekey ?? 999;

  if (itemBlob == null) {
    itemBlob = createInvoiceStructStruct(
      id: '',
      invoice: '',
      products: '',
      party: '',
      invoiceDate: 00,
      dayId: '',
      paymentMode: '',
      discountAmt: 00.0,
      discountPer: 00.0,
      delliveryChrg: 00.0,
      taxAmt: 00.0,
      billAmt: 00.0,
      finalBillAmt: 00.0,
      createdDate: 00,
      updatedDate: 00,
      roundOff: 00.0,
      updatedBy: '',
      code: 00,
      partyMobNo: '',
      //  productList: [],
      createdBy: '',
      shiftId: '',
      synC: false,
      version: 0,
    );
  }

  // add the new item into the Hive box
  switch (actionType) {
    case 'update':
      InvoiceStructStruct returningData = itemBlob;
      print('hi$returningData.productName');
      await invoiceBox.put(
        returningData.hivekey,
        InvoiceStructStruct(
          id: returningData.id,
          invoice: returningData.invoice,
          party: returningData.party,
          products: returningData.products,
          invoiceDate: returningData.invoiceDate,
          dayId: returningData.dayId,
          paymentMode: returningData.paymentMode,
          discountAmt: returningData.discountAmt,
          discountPer: returningData.discountPer,
          delliveryChrg: returningData.delliveryChrg,
          taxAmt: returningData.taxAmt,
          billAmt: returningData.billAmt,
          finalBillAmt: returningData.finalBillAmt,
          roundOff: returningData.roundOff,
          productList: returningData.productList,
          shiftId: returningData.shiftId,
          createdDate: returningData.createdDate,
          updatedDate: returningData.updatedDate,
          updatedBy: returningData.updatedBy,
          code: returningData.code,
          partyMobNo: returningData.partyMobNo,
          createdBy: returningData.createdBy,
          synC: returningData.synC,
          version: returningData.version,
        ),
      );
      return returningData;
      break;
    case 'create':
      InvoiceStructStruct returningData = itemBlob;
      await invoiceBox.add(
        InvoiceStructStruct(
          id: returningData.id,
          invoice: returningData.invoice,
          party: returningData.party,
          products: returningData.products,
          invoiceDate: returningData.invoiceDate,
          dayId: returningData.dayId,
          paymentMode: returningData.paymentMode,
          discountAmt: returningData.discountAmt,
          discountPer: returningData.discountPer,
          delliveryChrg: returningData.delliveryChrg,
          taxAmt: returningData.taxAmt,
          billAmt: returningData.billAmt,
          finalBillAmt: returningData.finalBillAmt,
          roundOff: returningData.roundOff,
          productList: returningData.productList,
          shiftId: returningData.shiftId,
          createdDate: returningData.createdDate,
          updatedDate: returningData.updatedDate,
          updatedBy: returningData.updatedBy,
          code: returningData.code,
          partyMobNo: returningData.partyMobNo,
          createdBy: returningData.createdBy,
          synC: returningData.synC,
          version: returningData.version,
        ),
      );
      return returningData;
      break;
    case 'delete':
      await invoiceBox.delete(hivekey);
      break;
    case 'get':
      InvoiceStructStruct? itemBlob = await invoiceBox.get(hivekey);
      if (itemBlob != null) {
        return itemBlob;
      } else {
        return InvoiceStructStruct(
          hivekey: hivekey,
        );
      }

      break;
    default:
      throw Exception('Unsupported action type: $actionType');
  }
  return itemBlob;
}
