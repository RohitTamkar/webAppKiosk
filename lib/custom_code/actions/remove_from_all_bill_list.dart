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

Future<List<dynamic>> removeFromAllBillList(int billno) async {
  // Add your function code here!
  List<dynamic> itemList = [];
  List<dynamic> allBillList = FFAppState().allBillsList;
  print(billno);
  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"] == billno) {
        allBillList.removeAt(i);
        FFAppState().allBillsList = allBillList;
        print("REmove");
        print(allBillList);
        if (allBillList.length == 0) {
          FFAppState().holdBillCount = 0;
        }
        break;
      }
    }
  }

  return FFAppState().allBillsList;
}
