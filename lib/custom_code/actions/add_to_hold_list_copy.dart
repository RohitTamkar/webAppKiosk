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

Future<List<dynamic>> addToHoldListCopy(
  dynamic document,
  int billno,
) async {
  // Add your function code here!

  // Add your function code here!
  List<dynamic> list = FFAppState().allBillsList;
  print("all bill List");
  print(list);
  List<dynamic> itemList = [];
  Map<String, dynamic> itemMapList = new Map();
  var y = 1.0;
  //print(document);
  final data = {
    "name": document["name"],
    "price": document["sellingPrice"].toDouble(),
    "quantity": y.toDouble(),
    "total": document["sellingPrice"].toDouble() * y.toDouble(),
    "id": document["id"],
    "catId": document["catRefId"]
  };
  var index;
  var flag = false;
  var flag1 = false;
  if (list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      print(list[i]["billno"]);
      if (list[i]["billno"] == billno) {
        if (list[i]["details"]["itemList"].length > 0) {
          // itemMapList=list[i]["details"]["itemList"];
          //itemList.add(itemMapList);
          itemList = (list[i]["details"]["itemList"]);
          index = i;
          flag1 = true;
          break;
        } else {
          itemList.add(data);
          list[i]["details"]["itemList"] = itemList;

          FFAppState().allBillsList = list;
          break;
        }
      }
    }
    /*  if (!flag1) {
      print("item not present");
      list[i]["details"]["itemList"] = data;
      FFAppState().allBillsList = list;
    }*/
    if (flag1) {
      for (int j = 0; j < itemList.length; j++) {
        print(itemList[j]["name"]);
        if (itemList[j]["name"] == data["name"]) {
          itemList[j]["quantity"]++;
          itemList[j]["total"] = itemList[j]["quantity"] * itemList[j]["price"];
          list[index]["details"]["itemList"] = itemList;
          FFAppState().allBillsList = list;
          flag = true;
          break;
        }
      }
      if (!flag) {
        print("item not present");
        List<dynamic> x = [];
        itemList.add(data);

        list[index]["details"]["itemList"] = itemList;

        FFAppState().allBillsList = list;
      }
    }
  }
  print("all");
  print(FFAppState().allBillsList);
  return FFAppState().allBillsList;
}
