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

Future<List<PurchaseSaleItemListStruct>> filterProductsPurches(
  int billno,
  List<dynamic> allBillList,
) async {
  // Add your function code here!
  List<dynamic> itemList = [];
  List<PurchaseSaleItemListStruct> returnList = [];
  PurchaseSaleItemListStruct struct = PurchaseSaleItemListStruct();

  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"] == billno) {
        if (allBillList[i]["details"]["itemList"].length > 0) {
          itemList = (allBillList[i]["details"]["itemList"]);
          for (int j = 0; j < itemList.length; j++) {
            print(itemList[j]);
            struct = createPurchaseSaleItemListStruct(
              name: itemList[j]["name"],
              price: itemList[j]["price"],
              quantity: itemList[j]["quantity"],
              total: itemList[j]["total"].toInt(),
              id: itemList[j]["id"],
              catId: itemList[j]["catId"],
              mfgDate: itemList[j]["mfgDate"],
              expDate: itemList[j]["expDate"],
              barcode: itemList[j]["barcode"],
              mrpPrice: itemList[j]["mrpPrice"],
              // taxId: itemList[j][""],
              // taxPer: itemList[j][""],
              // taxAmt: itemList[j][""],
              // isDeletedItem: false,
            );

            returnList.add(struct);
            print(returnList);
          }
          break;
        }
      }
    }
    //
  }
  return returnList;
}
