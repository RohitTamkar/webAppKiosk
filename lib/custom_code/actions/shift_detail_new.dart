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

Future<dynamic> shiftDetailNew(List<ShiftDetailsStruct>? shiftlist) async {
  List<dynamic> docRecord = [];
  bool flag = false;
  int shiftCount = 0;

  for (var doc in shiftlist!) {
    print(doc);
    if (doc.endTime == 0) {
      // Check if the startTime is in a new day
      DateTime currentDateTime = DateTime.now();
      DateTime shiftStartTime =
          DateTime.fromMillisecondsSinceEpoch(doc.startTime);

      if (shiftStartTime.day == currentDateTime.day) {
        // Same day, the shift is resumed
        flag = true;
        docRecord.add({
          "ref": doc.id,
          "shiftId": doc.shiftId,
          "dayId": doc.dayId,
          "billCount": doc.billCount,
          "msg": "Shift resumed",
          "shiftExists": true,
          "totalSale": doc.totalSale,
          "lastBillNo": doc.lastBillNo,
          "deliveryCharges": doc.deliveryCharges,
          "discount": doc.discount,
          "tax": doc.tax,
          "shiftCount": ++shiftCount,
          "endTime": doc.endTime,
          "startTime": doc.startTime,
          "startTimeFormat": doc.startTime, //"dd-mmm-yyyy  h:MM:ss"),
          "lastBillTime": doc.lastBillTime,
          "openingAmt": doc.openingAmt,
          "cashSale": doc.cashSale,
          "paymentJson": doc.paymentJson
        });
      } else {
        // New day, start a new shift
        print('new day end time is not updated');
      }
    } else {
      // The shift has ended, so start a new shift

      shiftCount++;
      print('shcount$shiftCount');
    }
  }

  if (flag == false && shiftlist.isNotEmpty) {
    shiftCount++;
    print('shcountne$shiftCount');
    docRecord.add({
      "msg": "Start new Shift for today",
      "shiftExists": false,
      "shiftCount": shiftCount,
      "startTimeFormat": "0"
    });
  }

  if (docRecord.isEmpty) {
    docRecord.add({
      "msg": "Shift not Started",
      "shiftExists": false,
      "shiftCount": 1,
      "startTimeFormat": "0"
    });
  }

  print(docRecord[0]);
  return docRecord[0];
}
