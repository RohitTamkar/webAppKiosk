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

// Imports other custom actions
Future<List<dynamic>> addToHoldListGrmfgdate(
  ProductStructStruct document,
  int billno,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
  List<UnitTypeRecord> unitcollection,
  String mfgDate,
  String expdate,
) async {
  List<dynamic> list = FFAppState().allBillsList;
  print(document);
  List<dynamic> itemList = [];

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
      if (itemList[j]["id"] == document.id) {
        itemExists = true;
        itemList[j]["mfgDate"] = mfgDate;
        itemList[j]["expDate"] = expdate;

        list[billIndex]["details"]["itemList"] = itemList;
        break;
      }
    }

    /*  if (!itemExists) {
      itemList.add(data);
      list[billIndex]["details"]["itemList"] = itemList;
    }*/
  } else {
    // Create a new bill if it doesn't exist
    /*   list.add({
      "billno": billno,
      "details": {
        "itemList": [data],
      },
    });*/
  }
//
  FFAppState().allBillsList = list;
  print(FFAppState().allBillsList);
  return itemList;
}

//
