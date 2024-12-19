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

Future<List<dynamic>> addToHoldListprdGrocery(
  ProductStructStruct document,
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
  List<UnitTypeRecord> unitcollection,
) async {
  List<dynamic> list = FFAppState().allBillsList;
  print(document);
  List<dynamic> itemList = [];
  double quantity = 1.0; // Default quantity

  // Resolve taxId and unitId defaults if necessary
  String taxId =
      document.taxId.isNotEmpty ? document.taxId : 'QPIz6c63YKBYVKT80oPv';
  TaxMasterRecord? taxRecord = taxcollection.firstWhere(
    (element) => element.id == taxId,
  );

  String unitId =
      document.unitId.isNotEmpty ? document.unitId : 'HjExWViQAwNJCUiUPwBz';
  UnitTypeRecord? unitRecord = unitcollection.firstWhere(
    (element) => element.id == unitId,
  );

  // Discount calculation adjustments
  int disPer = document.discountPer.toInt();
  double disAmt = document.discountAmt;

  if (disAmt > 0) {
    disPer = (disAmt * 100 / document.sellingPrice).toInt();
  } else if (disPer > 0) {
    disAmt = (document.sellingPrice * disPer) / 100.0;
  }

  // Continue if taxRecord is available
  if (taxRecord != null) {
    double taxPer = taxRecord.percentage ?? 0.0;
    double price = document.sellingPrice;

    // Calculate tax amount per item based on inclusive/exclusive option
    double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * taxPer) / (100.0 + taxPer)
        : (price * taxPer) / 100.0;

    double taxAmt = taxAmtPerItem * quantity;

    // Calculate total price based on tax and discount
    double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? (price * quantity)
        : (price * quantity) + taxAmt;
    total -= disAmt * quantity; // Deduct discount

    int srNo = 1;
    // Fetch serial number if a bill with the same number already exists
    for (var bill in list) {
      if (bill["billno"] == billno && bill["details"]["itemList"].isNotEmpty) {
        itemList = bill["details"]["itemList"];
        srNo = itemList.length + 1;
        break;
      }
    }

    // New data structure for an item
    final data = {
      "srno": srNo,
      "name": document.name,
      "regionallang": document.regionalName,
      "barcode": document.barcode,
      "price": price,
      "mrpPrice": document.mrpPrice.toDouble(),
      "quantity": quantity,
      "unit": unitRecord?.unitType,
      "unitId": unitRecord?.id,
      "total": double.parse(total.toStringAsFixed(2)),
      "id": document.id,
      "catId": document.categoryId,
      "taxId": document.taxId,
      "taxPer": double.parse(taxPer.toStringAsFixed(2)),
      "taxAmt": double.parse(taxAmt.toStringAsFixed(2)),
      "disPer": double.parse(disPer.toStringAsFixed(2)),
      "disAmt": double.parse(disAmt.toStringAsFixed(2)),
      "mfgDate": " ",
      "expDate": " ",
      "stockable": document.stockable,
      "currentStock": document.stock,
    };

    // Add or update item in the bill list
    bool itemFound = false;
    for (int i = 0; i < list.length; i++) {
      if (list[i]["billno"] == billno) {
        for (int j = 0; j < itemList.length; j++) {
          if (itemList[j]["name"] == data["name"]) {
            itemList[j]["quantity"]++;

            itemList[j]["disAmt"] = double.parse(
                (disAmt * itemList[j]["quantity"]).toStringAsFixed(2));

            itemList[j]["taxAmt"] = double.parse(
                (taxAmtPerItem * itemList[j]["quantity"]).toStringAsFixed(2));

            // Update total for inclusive or exclusive tax
            itemList[j]["total"] =
                inclusiveorexclusive.toLowerCase() == 'inclusive'
                    ? (itemList[j]["price"] * itemList[j]["quantity"])
                    : (itemList[j]["price"] * itemList[j]["quantity"]) +
                        itemList[j]["taxAmt"];
            itemList[j]["total"] -= itemList[j]["disAmt"];

            list[i]["details"]["itemList"] = itemList;
            FFAppState().allBillsList = list;
            itemFound = true;
            break;
          }
        }
        if (!itemFound) {
          data["srno"] = itemList.length + 1;
          itemList.add(data);
          list[i]["details"]["itemList"] = itemList;
          FFAppState().allBillsList = list;
        }
        break;
      }
    }
  }
  print(FFAppState().allBillsList);
  return itemList;
}
