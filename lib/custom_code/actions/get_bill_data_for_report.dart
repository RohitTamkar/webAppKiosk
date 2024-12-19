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

Future<List<dynamic>> getBillDataForReport(
  String dayId,
  String shiftId,
  String outletId,
) async {
  // Add your function code here!

  List<dynamic> docRecord = [];
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletId)
      .collection('INVOICE')
      .where('dayId', isEqualTo: dayId)
      .get()
      .then((value) => value);
  if (querySnapshot.size == 0) {
    print('No matching documents.');
  } else {
    int len = querySnapshot.docs.length;
    int count = 0;
    List<dynamic> list1 = [];
    List<dynamic> list2 = [];
    list1.add({
      "totalSale": 0.0,
      "totalBillAmt": 0.0,
      "totalTax": 0.0,
      "billCount": 0,
      "dayId": dayId,
      "totalDis": 0.0,
      "totalDelChg": 0.0
    });

    querySnapshot.docs.forEach((doc) {
      list1[0]["totalSale"] += doc["finalBillAmt"];
      list1[0]["totalBillAmt"] += doc["billAmt"];
      list1[0]["totalTax"] += doc["taxAmt"];
      list1[0]["totalDis"] += doc["discountAmt"];
      list1[0]["totalDelChg"] += doc["delliveryChrg"];
      list1[0]["billCount"] += 1;

      list2.add({
        "billNo": doc["invoice"],
        "billAmt": doc["billAmt"],
        "finalAmt": doc["finalBillAmt"],
        "discount": doc["discountAmt"],
        "tax": doc["taxAmt"]
      });
    });
    docRecord.add(list1);
    docRecord.add(list2);
  }
  return docRecord;
}
