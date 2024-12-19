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

Future<List<dynamic>> reduceQuantity(dynamic obj) async {
  List<dynamic> list = FFAppState().itemCartList;
  int index = list.indexOf(obj);
  print("index");
  print(index);
  // dynamic item = list[index];
  if (list[index]["quantity"] >= 0) {
    list[index]["quantity"]--;

    FFAppState().itemCartList = list;
  }
  return (FFAppState().itemCartList);
}
