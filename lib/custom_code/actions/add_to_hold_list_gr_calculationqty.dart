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

// Imports other custom actions

// Imports other custom actions
Future<List<dynamic>> addToHoldListGrCalculationqty(
  ProductStructStruct document,
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
  List<UnitTypeRecord> unitcollection,
  double disPer,
  double disAmt,
  double ratePrice,
  double qty,
  double taxPer,
  double taxAmt,
) async {
  List<dynamic> list = FFAppState().allBillsList;
  List<dynamic> itemList = [];

  // Default unitId if none provided
  String? unitId = document?.unitId ?? 'HjExWViQAwNJCUiUPwBz';

  // Fetch unit record
  UnitTypeRecord? unitRecord = unitcollection.firstWhere(
    (element) => element.id == unitId,
  );

  double price = ratePrice;
  double quantity = qty.toDouble();

  // Calculate discount amount based on discount percentage (if provided)
  if (disPer > 0) {
    disAmt = (price * quantity * disPer) / 100.0; // Calculate discount amount
  } else {
    disAmt = 0.0; // No discount
  }

  // Calculate discounted total
  double discountedTotal = (price * quantity) - disAmt;

  // Calculate tax amount (exclusive GST)
  double totalTaxAmt =
      (discountedTotal * taxPer) / 100.0; // Apply tax on discounted total

  // Calculate final total (exclusive GST)
  double total = discountedTotal + totalTaxAmt;

  final data = {
    "name": document!.name,
    "price": price,
    "mrpPrice": (document.mrpPrice)!.toDouble(),
    "quantity": quantity,
    "unit": unitRecord?.unitType,
    "total": total,
    "id": document.id,
    "catId": document.categoryId,
    "taxId": document.taxId,
    "taxPer": taxPer,
    "taxAmt": double.parse(totalTaxAmt.toStringAsFixed(2)),
    "disPer": double.parse(disPer.toStringAsFixed(2)),
    "disAmt": double.parse(disAmt.toStringAsFixed(2)),
  };

  bool billExists = false;
  int billIndex = -1;

  // Iterate over existing bills
  for (int i = 0; i < list.length; i++) {
    if (list[i]["billno"] == billno) {
      billExists = true;
      billIndex = i;
      itemList = list[i]["details"]["itemList"];
      break;
    }
  }

  if (billExists) {
    bool itemExists = false;

    // Iterate over existing items in the bill
    for (int j = 0; j < itemList.length; j++) {
      if (itemList[j]["name"] == data["name"]) {
        itemExists = true;

        // Update quantity
        itemList[j]["quantity"] = quantity;

        // Recalculate discount amount
        if (disPer > 0) {
          disAmt = (price * quantity * disPer) /
              100.0; // Recalculate discount amount
        } else {
          disAmt = 0.0; // No discount
        }

        // Recalculate discounted total
        double discountedTotal = (price * quantity) - disAmt;

        // Recalculate tax amount (exclusive GST)
        double totalTaxAmt = (discountedTotal * taxPer) / 100.0;

        // Recalculate final total (exclusive GST)
        double total = discountedTotal + totalTaxAmt;

        // Update item details
        itemList[j]["taxPer"] = taxPer;
        itemList[j]["price"] = price;
        itemList[j]["taxAmt"] = double.parse(totalTaxAmt.toStringAsFixed(2));
        itemList[j]["disPer"] = disPer;
        itemList[j]["disAmt"] = double.parse(disAmt.toStringAsFixed(2));
        itemList[j]["total"] =
            double.parse(total.toStringAsFixed(2)); // Update total

        list[billIndex]["details"]["itemList"] = itemList;
        break;
      }
    }

    if (!itemExists) {
      itemList.add(data);
      list[billIndex]["details"]["itemList"] = itemList;
    }
  } else {
    // Create a new bill if it doesn't exist
    list.add({
      "billno": billno,
      "details": {
        "itemList": [data],
      },
    });
  }

  FFAppState().allBillsList = list;
  print(FFAppState().allBillsList);
  return itemList;
}
