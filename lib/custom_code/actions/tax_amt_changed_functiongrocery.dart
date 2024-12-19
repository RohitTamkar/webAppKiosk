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
Future<List<dynamic>> taxAmtChangedFunctiongrocery(
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
  print(document);
  List<dynamic> itemList = [];

  String? unitId = '';
  if (document?.unitId == null) {
    unitId = 'HjExWViQAwNJCUiUPwBz';
  } else {
    unitId = document?.unitId;
  }
  UnitTypeRecord? unitRecord = unitcollection.firstWhere(
    (element) => element.id == unitId,
    orElse: null,
  );

  double price = ratePrice;
  double quantity = qty.toDouble();

  // Calculate taxPer if taxAmt is provided
  if (taxAmt > 0) {
    taxPer = (inclusiveorexclusive.toLowerCase() == 'inclusive')
        ? taxAmt * 100 / (price * quantity - taxAmt)
        : taxAmt * 100 / (price * quantity);
  }

  // Calculate disPer if disAmt is provided
  if (disAmt > 0) {
    disPer = disAmt * 100 / price;
  } else if (disPer > 0) {
    disAmt = (price * disPer) / 100.0;
  }

  // Calculate taxAmt for each item separately
  /* double taxAmtPerItem = (inclusiveorexclusive.toLowerCase() == 'inclusive')
      ? (price * taxPer) / (100.0 + taxPer)
      : (price * taxPer) / 100.0;*/

  // Calculate total tax amount based on quantity
  double totalTaxAmt = taxAmt * quantity;

  // Calculate total amount considering discounts and tax
  double total = (inclusiveorexclusive.toLowerCase() == 'exclusive')
      ? (price * quantity)
      : (price * quantity) + double.parse(totalTaxAmt.toStringAsFixed(2));

  // Deduct discount amount from total
  total -= disAmt * quantity;

  // Add tax amount for exclusive tax
  if (inclusiveorexclusive.toLowerCase() == 'exclusive') {
    total += totalTaxAmt;
  }

  final data = {
    "name": document!.name,
    "price": price,
    "mrpPrice": (document.mrpPrice)!.toDouble(),
    "quantity": quantity,
    "unit": unitRecord.unitType,
    "total": total,
    "id": document.id,
    "catId": document.categoryId,
    "taxId": document.taxId,
    "taxPer": taxPer,
    "taxAmt": double.parse(totalTaxAmt.toStringAsFixed(2)),
    "disPer": disPer,
    "disAmt": double.parse(disAmt.toStringAsFixed(2)),
  };

  var index;
  var flag = false;
  var flag1 = false;

  if (list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      if (list[i]["billno"] == billno) {
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
        if (itemList[j]["name"] == data["name"]) {
          itemList[j]["taxPer"] = taxPer;
          itemList[j]["price"] = ratePrice;
          itemList[j]["taxAmt"] = double.parse(
              (taxAmt * qty).toStringAsFixed(2)); // Update taxAmt for each item
          itemList[j]["disPer"] = disPer;
          itemList[j]["disAmt"] = double.parse(disAmt.toStringAsFixed(2));
          itemList[j]["quantity"] = qty;

          if (inclusiveorexclusive.toLowerCase() == 'inclusive') {
            itemList[j]["total"] = qty * itemList[j]["price"];
            double tt = itemList[j]["total"];
            itemList[j]["total"] = double.parse(tt.toStringAsFixed(2));
          } else {
            itemList[j]["total"] = qty * itemList[j]["price"] + taxAmt;
            double tt = itemList[j]["total"];
            itemList[j]["total"] = double.parse(tt.toStringAsFixed(2));
          }
          itemList[j]["total"] -= disAmt * qty;

          list[index]["details"]["itemList"] = itemList;
          FFAppState().allBillsList = list;
          flag = true;
          break;
        }
      }

      if (!flag) {
        itemList.add(data);
        list[index]["details"]["itemList"] = itemList;
        FFAppState().allBillsList = list;
      }
    }
  }

  print(FFAppState().allBillsList);
  return itemList;
}
