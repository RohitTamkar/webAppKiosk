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

Future<List<dynamic>> removeHoldListItem(
  dynamic obj,
  int billNo,
) async {
  // Add your function code here!
  List<dynamic> itemList;
  List<dynamic> allBillList = FFAppState().allBillsList;
  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"] == billNo) {
        if (allBillList[i]["details"]["itemList"].length >= 0) {
          itemList = (allBillList[i]["details"]["itemList"]);
          if (itemList.isNotEmpty) {
            var index = itemList.indexOf(obj);
            itemList.removeAt(index);
            allBillList[i]["details"]["itemList"] = itemList;
          }
          break;
        }
      }
    }
  }
  FFAppState().allBillsList = allBillList;
  return (allBillList);
}
