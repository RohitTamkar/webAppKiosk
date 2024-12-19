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

Future<int> accessDropdown(String? value) async {
  // Add your function code here!
  int res = 0;
  if (value == "NONE") {
    res = 0;
  }
  if (value == "CHECKER") {
    res = 1;
  }
  if (value == "MAKER") {
    res = 2;
  }
  if (value == "AUDITOR") {
    res = 3;
  }
  if (value == "ADMIN") {
    res = 4;
  }
  print(res);
  return res;
}
