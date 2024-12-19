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

Future<List<SelItemListStruct>> filterProducts(
  int billno,
  List<dynamic> allBillList,
) async {
  // Add your function code here!

  List<dynamic> itemList = [];
  List<SelItemListStruct> returnList = [];
  SelItemListStruct struct = SelItemListStruct();
  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"] == billno) {
        if (allBillList[i]["details"]["itemList"].length > 0) {
          itemList = (allBillList[i]["details"]["itemList"]);
          for (int j = 0; j < itemList.length; j++) {
            print(itemList[j]);
/*
            var map_name = new Map();

            map_name["name"] = itemList[j]["name"];
            map_name["price"] = itemList[j]["price"];
            map_name["quantity"] = itemList[j]["quantity"];
*/
            struct = createSelItemListStruct(
                name: itemList[j]["name"],
                price: itemList[j]["price"],
                quantity: itemList[j]["quantity"],
                total: itemList[j]["total"],
                id: itemList[j]["id"],
                catId: itemList[j]["catId"],
                taxPer: itemList[j]["taxPer"],
                taxAmt: itemList[j]["taxAmt"],
                isDeletedItem: false);

            returnList.add(struct);

            //  returnList.add(struct1);
            // returnList.addAll(itemList.map((e) => e));
            print(returnList);
          }
          break;
        }
      }
    }
  }

  return returnList;
}
