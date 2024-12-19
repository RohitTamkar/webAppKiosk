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

Future<dynamic> productDetails(
  String? regional,
  String? subCat,
  String? unitType,
  String? servicePoint,
  String? tax,
  int? reorderLev,
  double? discountP,
  double? discountA,
  String? cat,
) async {
  // Add your function code here!
  List<dynamic> jsonData = [];

  jsonData.add({
    "subCat": subCat ?? "#",
    "unitType": unitType != null ? unitType : "#",
    "servicePoint": servicePoint != null ? servicePoint : "#",
    "tax": tax != null ? tax : "#",
    "regional": regional != null ? regional : "#",
    "reorderLev": reorderLev != null ? reorderLev : 0,
    "discountP": discountP != null ? discountP : "#",
    "discountA": discountA != null ? discountA : "#"
  });
  print(jsonData[0]);
  return jsonData[0];
}
