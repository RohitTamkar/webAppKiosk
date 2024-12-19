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

Future<List<SelItemListStruct>> newCustomAction2(List<dynamic> list) async {
  // Add your function code here!

  List<dynamic> itemList = [];
  itemList = list;
  List<SelItemListStruct> returnList = [];
  SelItemListStruct struct = SelItemListStruct();

  for (int j = 0; j < itemList.length; j++) {
    struct = createSelItemListStruct(
        name: itemList[j]["name"],
        price: itemList[j]["price"],
        quantity: itemList[j]["quantity"],
        total: itemList[j]["total"],
        id: itemList[j]["id"],
        catId: itemList[j]["catId"],
        isDeletedItem: itemList[j]["isDeletedItem"]);

    returnList.add(struct);
    print(returnList);
  }
  return returnList;
}
