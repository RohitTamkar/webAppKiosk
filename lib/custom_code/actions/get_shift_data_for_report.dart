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

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> getShiftDataForReport(
  String dayId,
  String shiftId,
  String outletId,
) async {
  // Add your function code here!

  List<dynamic> docRecord = [];
  bool flag = false;

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletId)
      .collection('SHIFT')
      .where('dayId', isEqualTo: dayId)
      .get()
      .then((value) => value);
  if (querySnapshot.size == 0) {
    print('No matching documents.');
  } else {
    int len = querySnapshot.docs.length;
    int count = 0;

    querySnapshot.docs.forEach((doc) {
      if (count == 0) {
        docRecord.add({
          "dayId": dayId,
          "billCount": doc["billCount"],
          "totalSale": doc["totalSale"],
          "deliveryCharges": doc["deliveryCharges"],
          "discount": doc["discount"],
          "tax": doc["tax"],
          "cashSale": doc["cashSale"],
          "paymentJson": doc["paymentJson"],
          "netSale": doc["totalSale"] - doc["deliveryCharges"] + doc["discount"]
        });
      } else {
        docRecord[0]["dayId"] = dayId;
        docRecord[0]["billCount"] += doc["billCount"];
        docRecord[0]["totalSale"] += doc["totalSale"];
        docRecord[0]["deliveryCharges"] += doc["deliveryCharges"];
        docRecord[0]["discount"] += doc["discount"];
        docRecord[0]["tax"] += doc["tax"];
        docRecord[0]["cashSale"] += doc["cashSale"];
        docRecord[0]["netSale"] +=
            doc["totalSale"] - doc["deliveryCharges"] + doc["discount"];
      }
      count++;
    });
  }
  return docRecord;
}
