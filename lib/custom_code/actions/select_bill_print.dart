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

Future<List<dynamic>> selectBillPrint(
  String billNo,
  List<dynamic> list,
) async {
  List<dynamic> returnedList = [];

  for (int i = 0; i < list.length; i++) {
    if (list[i]["billno"] == int.parse(billNo)) {
      returnedList.add(list[i]);
      break;
    }
  }

  return returnedList;
}
