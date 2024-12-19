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
Future<List<dynamic>> addToHoldListGrCalculationdisPer(
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

  String? unitId = document?.unitId ?? 'HjExWViQAwNJCUiUPwBz';
  UnitTypeRecord? unitRecord = unitcollection.firstWhere(
    (element) => element.id == unitId,
  );

  double price = ratePrice;
  double quantity = qty.toDouble();

  // Calculate discount amount based on discount percentage (disPer)
  disAmt = (price * quantity * disPer) / 100.0; // Calculate discount amount

  // Calculate discounted total
  double discountedTotal = (price * quantity) - disAmt;

  // Calculate tax amount based on the discounted total
  double totalTaxAmt;
  if (inclusiveorexclusive.toLowerCase() == 'inclusive') {
    // For inclusive, calculate the tax amount accordingly
    totalTaxAmt = (discountedTotal * taxPer) / (100.0 + taxPer);
  } else {
    // For exclusive, calculate the tax amount normally
    totalTaxAmt = (discountedTotal * taxPer) / 100.0;
  }

  // Calculate the final total
  double total = discountedTotal +
      (inclusiveorexclusive.toLowerCase() == 'exclusive' ? totalTaxAmt : 0.0);

  final data = {
    "name": document!.name,
    "price": price,
    "mrpPrice": (document.mrpPrice)!.toDouble(),
    "quantity": quantity,
    "unit": unitRecord?.unitType,
    "total": double.parse(total.toStringAsFixed(2)),
    // Store total as fixed to 2 decimal places
    "id": document.id,
    "catId": document.categoryId,
    "taxId": document.taxId,
    "taxPer": taxPer,
    "taxAmt": double.parse(totalTaxAmt.toStringAsFixed(2)),
    // Store tax amount as fixed to 2 decimal places
    "disPer": double.parse(disPer.toStringAsFixed(2)),
    "disAmt": double.parse(disAmt.toStringAsFixed(2)),
  };

  bool billExists = false;
  int billIndex = -1;

  // Check if the bill exists
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

    // Check if the item already exists in the bill
    for (int j = 0; j < itemList.length; j++) {
      if (itemList[j]["name"] == data["name"]) {
        itemExists = true;

        // Update item details
        itemList[j]["taxPer"] = taxPer;
        itemList[j]["price"] = price;
        itemList[j]["quantity"] = quantity;

        // Update discount amount
        itemList[j]["disAmt"] = double.parse(disAmt.toStringAsFixed(2));
        itemList[j]["disPer"] = double.parse(disPer.toStringAsFixed(2));
        // Recalculate the total for the existing item
        double updatedDiscountedTotal =
            (price * quantity) - itemList[j]["disAmt"];

        // Recalculate tax amount
        double updatedTotalTaxAmt =
            (inclusiveorexclusive.toLowerCase() == 'exclusive')
                ? (updatedDiscountedTotal * taxPer) / 100.0
                : (updatedDiscountedTotal * taxPer) / (100.0 + taxPer);

        // Update the total amount
        itemList[j]["total"] = double.parse(
            (updatedDiscountedTotal + updatedTotalTaxAmt).toStringAsFixed(2));
        itemList[j]["taxAmt"] =
            double.parse(updatedTotalTaxAmt.toStringAsFixed(2));

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
