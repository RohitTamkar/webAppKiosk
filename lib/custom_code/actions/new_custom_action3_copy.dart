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

Future<dynamic> newCustomAction3Copy(
    String data, String vendor, OnlineOrdersRecord record) async {
  // Add your function code here!

  List<dynamic> returnList = [];

  final jsonData = jsonDecode(data);
  if (vendor == "Swiggy") {
    returnList.add({
      "orderId": record.orderId,
      "name": jsonData["customer"]["customer_name"],
      "count": "",
      "addressInstructions": "",
      "address": jsonData["customer_area"],
      "locality": ""
    });

    //print(returnList[0][0]["name"]);
  } else if (vendor == "Zomato") {
    //returnList.add();
    //int len = jsonData["creator"]["items"]["dishes"].length;

    returnList.add({
      "orderId": record.orderId,
      "name": jsonData["creator"]["originalName"],
      "count": jsonData["creator"]["orderCountDisplay"],
      "addressInstructions": jsonData["creator"]["address"]
          ["addressInstructions"],
      "address": jsonData["creator"]["address"]["address"],
      "locality": jsonData["creator"]["address"]["locality"]
    });
  }

  return returnList[0];
}
