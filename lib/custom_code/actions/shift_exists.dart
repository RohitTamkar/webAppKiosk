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
import "package:firedart/firedart.dart";
// Imports other custom actions

Future<dynamic> shiftExists(
  String dayId,
  String shiftId,
  String outletId,
) async {
  // Add your function code here!
  // Add your function code here!

  List<dynamic> docRecord = [];
  bool flag = false;
  String id = dayId + "-" + shiftId;
  QuerySnapshot querySnapshot;

  if (FFAppState().targetPlatform == "windows") {
    if (shiftId.toString() != "0") {
      querySnapshot = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(outletId)
          .collection('SHIFT')
          .where('dayId', isEqualTo: dayId)
          .where("shiftId", isEqualTo: id.toString())
          .get()
          .then((value) => value);
    } else {
      querySnapshot = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(outletId)
          .collection('SHIFT')
          .where('dayId', isEqualTo: dayId)
          .get()
          .then((value) => value);
    }

    if (querySnapshot.size == 0) {
      print('No matching documents.');
      docRecord.add({
        "msg": "Shift not Started",
        "shiftExists": false,
        "shiftCount": 1,
        "startTimeFormat": "0"
      });
    } else {
      int len = querySnapshot.docs.length;
      int count = 0;
      querySnapshot.docs.forEach((doc) {
        count = count + 1;
        if (doc["endTime"] == 0) {
          flag = true;
          docRecord.add({
            "ref": doc["id"],
            "shiftId": doc["shiftId"],
            "dayId": doc["dayId"],
            "billCount": doc["billCount"],
            "msg": "Shift resumed",
            "shiftExists": true,
            "totalSale": doc["totalSale"],
            "lastBillNo": doc["lastBillNo"],
            "deliveryCharges": doc["deliveryCharges"],
            "discount": doc["discount"],
            "tax": doc["tax"],
            "shiftCount": count,
            "endTime": doc["endTime"],
            "startTime": doc["startTime"],
            "startTimeFormat": doc["startTime"], //"dd-mmm-yyyy  h:MM:ss"),
            "lastBillTime": doc["lastBillTime"],
            "openingAmt": doc["openingAmt"],
            "cashSale": doc["cashSale"],
            "paymentJson": doc["paymentJson"]
          });
        } else {
          if (len == count && flag == false) {
            docRecord.add({
              "msg": "Start new Shift for today",
              "shiftExists": false,
              "shiftCount": len + 1,
              "startTimeFormat": "0"
            });
          }
        }
      });
    }
  } else {
    if (shiftId.toString() != "0") {
      querySnapshot = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(outletId)
          .collection('SHIFT')
          .where('dayId', isEqualTo: dayId)
          .where("shiftId", isEqualTo: id.toString())
          .get()
          .then((value) => value);
    } else {
      querySnapshot = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(outletId)
          .collection('SHIFT')
          .where('dayId', isEqualTo: dayId)
          .get()
          .then((value) => value);
    }

    if (querySnapshot.size == 0) {
      print('No matching documents.');
      docRecord.add({
        "msg": "Shift not Started",
        "shiftExists": false,
        "shiftCount": 1,
        "startTimeFormat": "0"
      });
    } else {
      int len = querySnapshot.docs.length;
      int count = 0;
      querySnapshot.docs.forEach((doc) {
        count = count + 1;
        if (doc["endTime"] == 0) {
          flag = true;
          docRecord.add({
            "ref": doc["id"],
            "shiftId": doc["shiftId"],
            "dayId": doc["dayId"],
            "billCount": doc["billCount"],
            "msg": "Shift resumed",
            "shiftExists": true,
            "totalSale": doc["totalSale"],
            "lastBillNo": doc["lastBillNo"],
            "deliveryCharges": doc["deliveryCharges"],
            "discount": doc["discount"],
            "tax": doc["tax"],
            "shiftCount": count,
            "endTime": doc["endTime"],
            "startTime": doc["startTime"],
            "startTimeFormat": doc["startTime"], //"dd-mmm-yyyy  h:MM:ss"),
            "lastBillTime": doc["lastBillTime"],
            "openingAmt": doc["openingAmt"],
            "cashSale": doc["cashSale"],
            "paymentJson": doc["paymentJson"]
          });
        } else {
          if (len == count && flag == false) {
            docRecord.add({
              "msg": "Start new Shift for today",
              "shiftExists": false,
              "shiftCount": len + 1,
              "startTimeFormat": "0"
            });
          }
        }
      });
    }
  }

  print(docRecord[0]);
  return docRecord[0];
}
