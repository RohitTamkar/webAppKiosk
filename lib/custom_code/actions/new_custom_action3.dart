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

import 'dart:convert';

Future<List<dynamic>> newCustomAction3(
    String data, String vendor, OnlineOrdersRecord record) async {
  // Add your function code here!

  List<dynamic> returnList = [];

  final jsonData = jsonDecode(data);
  if (vendor == "Swiggy") {
    int len = jsonData["cart"]["items"].length;
    for (int i = 0; i < len; i++) {
      returnList.add({
        "orderId": record.orderId,
        "name": jsonData["cart"]["items"][i]["name"],
        "quantity": jsonData["cart"]["items"][i]["quantity"],
        "unitCost": jsonData["cart"]["items"][i]["sub_total"],
        "dishTotalCost": jsonData["cart"]["items"][i]["final_sub_total"],
        "total": jsonData["cart"]["items"][i]["total"]
      });
    }

    //print(returnList[0][0]["name"]);
  } else if (vendor == "Zomato") {
    //returnList.add();
    int len = jsonData["cartDetails"]["items"]["dishes"].length;
    for (int i = 0; i < len; i++) {
      returnList.add({
        "orderId": record.orderId,
        "name": jsonData["cartDetails"]["items"]["dishes"][i]["name"],
        "quantity": jsonData["cartDetails"]["items"]["dishes"][i]["quantity"],
        "unitCost": jsonData["cartDetails"]["items"]["dishes"][i]["unitCost"],
        "dishTotalCost": jsonData["cartDetails"]["items"]["dishes"][i]
            ["dishTotalCost"],
        "total": jsonData["cartDetails"]["items"]["dishes"][i]["totalCost"]
      });
    }
  }

  return returnList;
}
