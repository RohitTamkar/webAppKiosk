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

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> ratePriceChangedFunctiongrocery(
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

  // Calculate discount amount if discount percentage is provided
  if (disPer > 0) {
    disAmt = (price * disPer * quantity) / 100.0;
  }

  // Calculate discounted total
  double discountedTotal = (price * quantity) - disAmt;

  // Calculate tax amount based on the discounted total
  double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
      ? (discountedTotal * taxPer) / (100.0 + taxPer)
      : (discountedTotal * taxPer) / 100.0;

  // Calculate total tax amount based on quantity
  double totalTaxAmt = taxAmtPerItem * quantity;

  // Calculate total amount considering discount and tax
  double total = (inclusiveorexclusive.toLowerCase() == 'exclusive')
      ? discountedTotal + totalTaxAmt
      : discountedTotal;

  // Fix floating-point precision by rounding to two decimal places
  total = double.parse(total.toStringAsFixed(2));
  totalTaxAmt = double.parse(totalTaxAmt.toStringAsFixed(2));
  disAmt = double.parse(disAmt.toStringAsFixed(2));
  disPer = double.parse(disPer.toStringAsFixed(2));

  // Create data object for the item
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
    "taxAmt": totalTaxAmt,
    "disPer": disPer,
    "disAmt": disAmt,
  };

  bool billExists = false;
  int billIndex = -1;

  // Check if the bill already exists
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

        // Update existing item details
        itemList[j]["taxPer"] = taxPer;
        itemList[j]["price"] = price;
        itemList[j]["quantity"] = quantity;
        itemList[j]["taxAmt"] = totalTaxAmt;
        itemList[j]["disPer"] = disPer;
        itemList[j]["disAmt"] = disAmt;

        // Update total for existing item
        itemList[j]["total"] = double.parse((discountedTotal +
                (inclusiveorexclusive.toLowerCase() == 'exclusive'
                    ? totalTaxAmt
                    : 0.0))
            .toStringAsFixed(2));

        list[billIndex]["details"]["itemList"] = itemList;
        break;
      }
    }

    if (!itemExists) {
      // Add new item to the bill
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
  return itemList;
}
