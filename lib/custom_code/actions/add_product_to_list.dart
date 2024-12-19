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

Future<List<SelItemListStruct>> addProductToList(
    List<dynamic> itemCartList) async {
  // Add your function code here!

  List<SelItemListStruct> returnList = [];
  SelItemListStruct struct = SelItemListStruct();
  if (itemCartList.isNotEmpty) {
    for (int j = 0; j < itemCartList.length; j++) {
      print(itemCartList[j]);

      struct = createSelItemListStruct(
          name: itemCartList[j]["name"],
          price: itemCartList[j]["price"],
          quantity: itemCartList[j]["quantity"]);
      returnList.add(struct);
    }
  }

  return returnList;
}
