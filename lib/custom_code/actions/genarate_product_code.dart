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

Future<int> genarateProductCode(List<ProductRecord>? list) async {
  // Add your function code here!
  int nextCode;
  if (list!.isNotEmpty) {
    list.sort((a, b) => b.code!.compareTo(a.code!));
    int maxCode = list[0].code!;
    print(list);
    nextCode = maxCode + 1;
  } else {
    nextCode = 1;
  }
  print(nextCode);
  return nextCode;
}
