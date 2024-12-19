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

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> reduceQuantityHoldListkiosk(
  dynamic obj,
  int billNo,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
) async {
  // Add your function code here!
  List<dynamic> list = FFAppState().allBillsList;
  print(obj);
  List<dynamic> itemList = [];
  var y = 1.0;

  String? taxId = '';
  if (obj['taxId'] == null) {
    taxId = 'QPIz6c63YKBYVKT80oPv';
  } else {
    taxId = obj['taxId'];
  }

  TaxMasterRecord? taxRecord = taxcollection.firstWhere(
    (element) => element.id == taxId,
    orElse: null,
  );

  if (taxRecord != null) {
    double taxPer = taxRecord.percentage ?? 0.0;
    double price = obj['price'];
    double quantity = y.toDouble();

    // Calculate taxAmt for each item separately
    double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * taxPer) / (100.0 + taxPer)
        : (price * taxPer) / 100.0;

    double taxAmt = taxAmtPerItem * quantity;

    /* double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * quantity)
        : (price * quantity) + double.parse(taxAmt.toStringAsFixed(2));*/
    double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * quantity)
        : (price * quantity);

    final data = {
      "name": obj['name'],
      "price": (obj['price'])!.toDouble(),
      "quantity": quantity,
      "total": total, // Include taxAmt for exclusive tax
      "id": obj['id'],
      "catId": obj['catId'],
      "taxId": taxId,
      "taxPer": taxPer,
      "taxAmt": double.parse(taxAmt.toStringAsFixed(2)),
    };

    var index;
    var flag = false;
    var flag1 = false;

    if (list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        if (list[i]["billno"] == billNo) {
          if (list[i]["details"]["itemList"].length > 0) {
            itemList = (list[i]["details"]["itemList"]);
            index = i;
            flag1 = true;
            break;
          } else {
            itemList.add(data);
            list[i]["details"]["itemList"] = itemList;

            FFAppState().allBillsList = list;
            break;
          }
        }
      }

      if (flag1) {
        for (int j = 0; j < itemList.length; j++) {
          if (itemList[j]["quantity"] > 1) {
            if (itemList[j]["name"] == data["name"]) {
              itemList[j]["quantity"]--;
              itemList[j]["taxAmt"] = itemList[j]["quantity"] *
                  taxAmtPerItem; // Update taxAmt for each item based on the new quantity
              if (inclusiveorexclusive.toLowerCase() == 'inclusive') {
                itemList[j]["total"] = itemList[j]["quantity"] *
                    itemList[j]["price"]; // Update total for each item
              } else {
                itemList[j]["total"] =
                    itemList[j]["quantity"] * itemList[j]["price"];
              } // Update total for each item
              list[index]["details"]["itemList"] = itemList;
              FFAppState().allBillsList = list;
              flag = true;
              break;
            }
          }
        }

        /*  if (!flag) {
          itemList.add(data);
          list[index]["details"]["itemList"] = itemList;
          FFAppState().allBillsList = list;
        }*/
      }
    }
  }

  print(FFAppState().allBillsList);
  return FFAppState().allBillsList;
}
